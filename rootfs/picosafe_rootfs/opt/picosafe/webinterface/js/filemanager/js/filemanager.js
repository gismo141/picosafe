(function( $ ) {
	$.fn.FileManager = function(options) {
	
		var files = [];
		var currentDir = '';
		//var shareClient = $.ShareClient();
		var app = this;

		var settings = $.extend({
			directory : '/var/www',
			target: './filemanager.php'
		}, options);


		this.init = function() {
			app.html(
				'<div id="filemanager-header">' +
				 	'<div id="filemanager-path"></div>' +
						'<div id="filemanager-menu">' +
							'<div class="button upload">Upload</div>' +
							'<div class="button" id="newDir">New Folder</div>' +
						'</div>' +
					'<div style="clear: both;"></div>' +
				'</div>' +
				'<div id="filemanager-table">' +
        	'<div id="filemanager-table-header">' +
						'<div style="width: 50%">Name</div>' +
						'<div>Size</div>' +
						'<div></div>' +
					'</div>' +
				'<div>' +

				'<div id="modal-upload" class="modal">' +
					'<div class="modal-header">Upload</div><div class="modal-body"><div class="modal-content" style="width: 400px;">' +
						'<form method="post" enctype="multipart/form-data"  action="#" id="uploadform">' +
						'<div id="modal-content-upload"><center>Datei: <div id="modal-upload-filescont"><input type="file" id="modal-upload-files" style="width: 90%;margin: 15px 0px;"></div>' +
						'<div id="modal-upload-message"></div>' +
						'<div id="modal-upload-buttons"><input type="button" id="modal-upload-start" class="blue" value="Upload"/>&nbsp;' +
						'<input type="button" class="blue modal-cancel" value="Cancel"/></div></center></div>' +
						'</form>' +
				'</div></div></div>' +
				
				'<div id="modal-new" class="modal">' +
	        '<div class="modal-header">New folder</div><div class="modal-body"><div class="modal-content" style="width: 400px;">' +
			      '<div id="modal-content-new"><center>Name: <input type="text" id="modal-new-name" style="width: 85%;margin: 15px 0px;display:inline-block;">' +
						'<div id="modal-new-message"></div>' +
						'<input type="button" id="modal-new-create" class="blue" value="Erstellen"/>&nbsp;' +
						'<input type="button" class="blue modal-cancel" value="Cancel"/></center></div>' +
				'</div></div></div>' +
					
				'<div id="modal-share" class="modal">' +
					'<div class="modal-header">Send file</div><div class="modal-body"><div class="modal-content" style="width: 400px;">' +
					'<div id="modal-content-share">Download-Link: <input type="text" id="modal-share-url" style="width: 75%;margin: 15px 0px;display:inline-block;">' +
					'<center>' +	
					'<input type="button" class="blue modal-cancel" value="Ok"/></center>' +
				'</div></div></div>'	
					);

			currentDir = settings.directory;
			app.OpenDir(currentDir);
			app.AddMenuAction();
		};


		this.SetLocation = function(directory) {
			app.children('div#filemanager-header').children('div#filemanager-path').html(directory);
		};


		this.ConvertSize = function(size) {
			// 1kB = 1024 Byte
			// 1MB = 1048576 Byte
			// 1GB = 1073741824 Byte

			if(size >= 1073741824) {
				return (Math.round((size/1073741824) * 10) / 10) + ' GB';
			}else if(size >= 1048576) {
				return (Math.round((size/1048576) * 10) / 10) + ' MB';
			}else if(size >= 1024) {
				return (Math.round((size/1024) * 10) / 10) + ' kB';
			}else
				return size + ' Byte';
		};


		this.DownloadFile = function(file) {
			window.location.href = settings.target + '?action=download&file=' + base64_encode(file);
		};


		this.RenderLocation = function(directory) {
			var base = base64_encode(settings.directory);
			var directory_enc = base64_encode(directory);

			$.getJSON(settings.target +'?action=path&base='+base+'&directory='+directory_enc, function(data) {	
				var dir = '<a class="path" href="#" path="'+settings.directory+'">'+data.base+'</a>';

				$.each(data.folders, function(i, item) {
					dir += ' &rsaquo; <a class="path" href="#" path='+item.path+'>'+item.directory+'</a>';
				});
				
				app.SetLocation(dir);
			
				$('div#filemanager-path a.path').click(function(e) {
					var path = $(this).attr('path');
					app.OpenDir(path);
				});

			});
		};


		this.OpenDir = function(dir) {
			app.RemoveAll();
			app.ListDir(dir);
			app.RenderLocation(dir);
			currentDir = dir;
		};


		this.RefreshDir = function() {
			app.OpenDir(currentDir);
		};


		this.UploadPopup = function() {
			$('#modal-upload').reveal({       
				animation: 'fadeAndPop',  
				animationspeed: 200,    
				closeonbackgroundclick: true, 
				dismissmodalclass: 'modal-cancel'    
			});
		};

		this.NewFolderPopup = function() {
			$('#modal-new').reveal({
	      animation: 'fadeAndPop',
	      animationspeed: 200,
	      closeonbackgroundclick: true,
	      dismissmodalclass: 'modal-cancel'
	    });
		}

		this.SharePopup = function(el) {
			var link = $(el).parent().parent('div.filemanager-table-row').children('div.type').children('a.link');
    	var type = link.attr('type');
    	var path = link.attr('path');

			var last = {};
    	if(type=='file') {
				shareClient.AddFile(path);
				last = shareClient.GetLast();
			}

			$('input#modal-share-url').val(shareClient.Settings.server+'?action=download&token='+last.token);
			
			$('#modal-share').reveal({
        animation: 'fadeAndPop',
	      animationspeed: 200,
	      closeonbackgroundclick: true,
	      dismissmodalclass: 'modal-cancel'
	    });
		}



		this.UploadFile = function() {
			formdata = false; 
			if (window.FormData)
				formdata = new FormData();
			
			var files = $('#modal-upload-files')[0].files;
			var i = 0, len = files.length, file;


			if(len>0)
				$('div#modal-upload-buttons').html('<div id="filemanager-upload-loading">Upload ...</div>');

			for (;i < len;i++ ) {
				file = files[i];

				if (formdata) 
					formdata.append("files[]", file);
			}
			

			if(formdata && len > 0) {
				var curdir_enc = base64_encode(currentDir);
				$.ajax({
					url: settings.target+'?action=upload&curdir='+curdir_enc,
					type: "POST",
					data: formdata,
					processData: false,
					contentType: false,
					success: function (data) {
			 			if(data=='file uploaded') {
							$('#modal-upload').trigger('reveal:close');
							$('form#uploadform')[0].reset();
							app.RefreshDir();
						}else if(data=='basedir not found')	$('div#modal-upload-message').html('<span class="modal-error">The destination directory could not be found!</span>');
						 else if(data=='file not found')	$('div#modal-upload-message').html('<span class="modal-error">The file could not be uploaded!</span>');
						 else if(data=='cant upload')	$('div#modal-upload-message').html('<span class="modal-error">The file could not be moved to the target directory!</span>');

						// Buttons
			      $('div#modal-upload-buttons').html(
			        '<input type="button" id="modal-upload-start" class="blue" value="Upload"/>&nbsp;' +
			        '<input type="button" class="blue modal-cancel" value="Cancel"/>');
					}
				});
			}
		};

		this.CreateDir = function() {
			var dirname = $('#modal-new-name').val();
			if(dirname=='' || dirname==null) return false;

			var currentDir_enc = base64_encode(currentDir);
      var dirname_enc = base64_encode(dirname);

			$.get(settings.target +'?action=newdir&curdir='+currentDir_enc+'&name='+dirname_enc, function(data) {
				if(data=='dir created') {
					$('#modal-new').trigger('reveal:close');
					$('#modal-new-name').val('');
					app.RefreshDir();
				}else if(data=='basedir not found') $('div#modal-new-message').html('<span class="modal-error">Verzeichnis konnte nicht erstellt werden</span>');
		     else if(data=='dir already exists') $('div#modal-new-message').html('<span class="modal-error">Es existiert bereits ein Verzeichnis mit diesem Namen</span>');
		     else if(data=='cant create dir') $('div#modal-new-message').html('<span class="modal-error">Das Verzeichnis konnte nicht angelegt werden</span>');
			});

		};


		this.AddMenuAction = function() {
			// Upload
			$('div#filemanager-menu div.upload').click(function() {
				app.UploadPopup();
			});

			// New Directory
			$('div#filemanager-menu div#newDir').click(function() {
				app.NewFolderPopup();
			});

			$('input#modal-new-create').click(function() {
				app.CreateDir();	
			});
		};


		this.AddAction = function() {
			// Share-Button
			$('div.filemanager-table-row a.btn_share').click(function() {
				app.SharePopup(this);
			});

			// Upload-Button
			$('input#modal-upload-start').unbind("click").click( function() {
	      app.UploadFile();
	    });

			// Download-Button
			$('div.filemanager-table-row a.link').click(function(e) {
				var type = $(this).attr('type');
				var path = $(this).attr('path');

				if(type=='file') {
					e.preventDefault();
					app.DownloadFile(path);
				}

				if(type=='dir') {
					app.OpenDir(path);
				}
			});

			// Delete-Button
			$('div.filemanager-table-row a.btn_delete').click(function(e) {
				var link = $(this).parent().parent('div.filemanager-table-row').children('div.type').children('a.link');
				var type = link.attr('type');
				var path_enc = base64_encode(link.attr('path'));

				var text = 'Do you want to remove this folder?';
				if(type=='file') text = 'Do you want to remove this file?';

				if(confirm(text)) {
					$.get(settings.target +'?action=delete&file='+path_enc, function(data) {
						if(data=='file deleted') app.RefreshDir();
						else if(data=='file not found') alert('The file could not be found.');
						else if(data=='cant delete file') alert('The file can not be removed.');
					});
				}else
					return false;
			});

			// Rename-Button
			$('div.filemanager-table-row a.btn_rename').click(function() {
				var link = $(this).parent().parent('div.filemanager-table-row').children('div.type').children('a.link');
				var path_enc = base64_encode(link.attr('path'));
		
				var filename = link.attr('path');	
			  filename= filename.split('/').pop()


				var newname = prompt('Please enter a new name:',filename);
	      if(newname=='' || newname==null) return false;

				var newname_enc = base64_encode(newname);

				$.get(settings.target +'?action=rename&old='+path_enc+'&new='+newname_enc, function(data) {
					if(data=='file renamed') app.RefreshDir();
					else if(data=='file not found') alert('The file could not be found.');
					else if(data=='file already exists') alert('There is already a folder or a file with this name.');
					else if(data=='cant rename file') alert('The file or folder can not be renamed!');
				});
					
			});
		}


		this.AddStyle = function() {
/*
   		$('div#modal-upload-buttons').html(
				'<input type="button" id="modal-upload-start" class="blue" value="Upload"/>&nbsp;' +
				'<input type="button" class="blue modal-cancel" value="Cancel"/>');
			$('div#modal-upload-filescont').html('<input type="file" id="modal-upload-files" style="width: 90%;margin: 15px 0px;">');
*/

			$('div.filemanager-table-row').hover(function() {
	      $(this).children('div').children('a.btn').css('visibility','visible');
	    });

	    $('div.filemanager-table-row').mouseleave(function() {
		    $(this).children('div').children('a.btn').css('visibility','hidden');
		  });
		}


		this.RemoveAll = function() {
			files = [];
			app.children('div#filemanager-table').children('div.filemanager-table-row').remove();
		};


		this.AddItem = function(name, path, type, size) {
			var newSize = '';
			if(size > 0)
				newSize = app.ConvertSize(size);

			app.children('div#filemanager-table').append(
				'<div class="filemanager-table-row">' +
					'<div class="type '+type+'"><a href="#" class="link" type="'+type+'" path="'+path+'">'+name+'</a></div>' +
					'<div>'+newSize+'</div>' +
					'<div>' +
						'<a href="#" class="btn btn_share" title="Share link"></a>' +
						'<a href="#" class="btn btn_delete" title="Delete file"></a>' +
						'<a href="#" class="btn btn_rename" title="Rename file"></a>' +
					'</div>' +
				'</div>'
			);	
		};


		this.RenderDir = function() {
			$.each(files, function(i, item) {
				app.AddItem(item.name, item.path, item.type, item.size);
			});

			if(files.length==0) {
				app.children('div#filemanager-table').children('div.filemanager-table-row').remove();
				app.children('div#filemanager-table').append(
					'<div class="filemanager-table-row"><div style="color: #555">The folder is empty</div><div></div><div></div></div></div>'
				);
			}
		};


		this.ListDir = function(directory) {
			directory = base64_encode(directory);
			$.getJSON(settings.target +'?action=listdirectory&directory='+directory, function(data) {
				files = data;
				app.RenderDir();
				app.AddStyle();
				app.AddAction();
			});
		};


		this.init();
	}
})( jQuery );
