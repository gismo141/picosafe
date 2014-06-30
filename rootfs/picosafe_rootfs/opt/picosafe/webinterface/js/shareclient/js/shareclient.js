(function( $ ) {
	$.ShareClient = function(options) {

		var sc = this;

		var uploading = false;

		var settings = $.extend({
			server: 'http://server.fred-securebox.org/share.php',
			client: '../shareclient/shareclient.php',
			lifetime: 1440, /* 60*24 min */
			blocksize: 49152,
			maxblockerrors: 5
		}, options);

		

		var AddFile = function(file, lifetime) {
			//Nocie.Remove('files');

			if(file==null || file=='') return;
			var file_enc = base64_encode(file);


			// Get FileSize
			$.get(settings.client+'?action=filesize&file='+file_enc, function(filesize) {
				if(!(filesize!='' && filesize > 0)) return;

				// Find existing Upload
				var exists = GetFiles();
				var file_exists = false;
				for(f=0;f<exists.length;f++) {
					if(exists[f][0]==file_enc) {
						file_exists = true;
						break;
					}
				}
				if(file_exists) {
					alert('file already queued');
					return 'file already queued';
				}

				// Set lifetime in minutes
				var file_lifetime = settings.lifetime;
				if(lifetime!='' && lifetime!='undefined')
					file_lifetime = lifetime;

				// Register file on server
				$.get(settings.server+'?action=add&file='+file_enc+'&size='+filesize+'&blocksize='+settings.blocksize+'&lifetime='+file_lifetime, function(token) {
					if(token.length==32) {
						var upload = file_enc+':'+token+';';
						var files_enc = Nocie.Get('files');  //Nocie_base64_decode($.dese);

						if(files_enc==null || files_enc=='') files_enc = upload;
						else files_enc += upload;

						Nocie.Set('files', files_enc);
					} else {
						// Server-Error
						alert('Server: '+token);
					}
				});
			});
		};


		var StartTransfer = function() {			
			// Initialize existing Upload
			var files = ParseFiles();
			// Check if there are some files and thread available
			if(files.length > 0) {
				for(i=0;i<files.length;i++)
				TransferFile(files[i][1]);
			}

			setTimeout(StartTransfer, 2500);
		}

		var TransferFile = function(token) {
			
			// Get Blocks
			$.getJSON(settings.server+'?action=getblocks&token='+token, function(data) {
					if (data.constructor==Array && data.length>0) { 
						TransferBlocks(token, data, 0);
					} else if(data==["file finished"]){
						RemoveFile(token);
					}	else if(data==["file not found"]) {
						uploading = false;
					}else if(data==["pending"]) {
						
					}
			});
		}

		var TransferBlocks = function(token, blocks, errors) {
			if(blocks.length==0 || errors==settings.maxblockerrors) {
				uploading = false;
				return;
			}

			// Get First Block and File
			var currentBlock = blocks.shift();
			var currentFile = GetFile(token);
			
			if(currentFile=='') {
				uploading = false;
				return;
			}


			// Get Block from Client
			$.getJSON(settings.client,  { 'action' : 'getblock',
																		'file': currentFile, 
																		'block': currentBlock, 
																		'blocksize': settings.blocksize }, 
			function(data) {
				if(data.size > 0) {
					// Transfer block to server
					$.post(settings.server, {'action': 'transfer', 'token': token, 'block': currentBlock, 'checksum':data.checksum, 'size': data.size, 'data':data.data}, function(success) {
						if(success=='block complete'){
							
						}else if(success=='invalid arguments') {
							blocks.push(currentBlock);
							errors++;
						}else if(success=='cant read block') {
							blocks.push(currentBlock);
							errors++;
						}

						// Transfer next blocks
						TransferBlocks(token, blocks);
					});
				}else if(data=='invalid arguments') {
					blocks.push(currentBlock);
					errors++;
				}else if(data=='cant read block') {
					blocks.push(currentBlock);
					 errors++;
				}

			});

		};



		var RemoveFile = function(token) {
			var files = GetFiles();
			var index = -1;

			// Find index of file
			for(i=0;i<files.length;i++) {
				if(files[i][1]==token) {
					index = i;
					break;
				}
			}
			if(index > -1) {
				// Delete Element
				files.splice(index, 1);
				
				// Build new nockie
				var files_enc = '';
				for(i=0;i<files.length;i++) {
					files_enc += files[i][0]+':'+files[i][1]+';';
				}
				Nocie.Set('files', files_enc);
			}

		};

		var GetLast = function() {
			var files = ParseFiles();
			if(files.length > 0)
				return {file: files[files.length-1][0], token: files[files.length-1][1]  }
			return {};
		}


		var GetFile = function(token) {
			var files = GetFiles();

			for(i=0;i<files.length;i++) {
				if(files[i][1]==token)
					return files[i][0];
			}
			return '';
		};


		var GetFiles = function() {
			// Get File Array encoded [file_enc:token]
			var files = [];
      var files_enc = Nocie.Get('files');

      if(files_enc==null || files_enc=='')
	      return files;

			files = files_enc.split(';');
			
			var data = [], i = 0; exists = false;
			jQuery.each(files, function(index, file) {
      	data_enc = file.split(':');
      	if(data_enc[0]!='') {
		    	data[i] = [data_enc[0],data_enc[1]];
		    	i++;
				}
			});
			return data;
		}

		var ParseFiles = function() {
			// Get File Array decoded [file:token]
			var files = [];
			var files_enc = Nocie.Get('files');
			
			if(files_enc==null || files_enc=='') 
				return files;

			files = files_enc.split(';');
			
			var data = [], i = 0; exists = false;
			jQuery.each(files, function(index, file) {
				data_enc = file.split(':');
				if(data_enc[0]!='') {
					data[i] = [base64_decode(data_enc[0]),data_enc[1]];
					i++;
				}
			});
			return data;
		}


		StartTransfer();

		return {
		    AddFile: AddFile,
				StartTransfer: StartTransfer,
				GetLast: GetLast,
				Settings: settings
		}
	};
})( jQuery );
