<script type="text/javascript" src="js/jquery.flot.js"></script>
<script type="text/javascript" src="js/jquery.flot.pie.js"></script>
<script type="text/javascript" src="apps/harddiskcrypt/harddiskcrypt.js"></script>


<script type="text/javascript" src="js/logger/logger.js"></script>
<link rel="stylesheet" type="text/css" href="js/logger/style.css" />

<script type="text/javascript">
	$(document).ready(function() {
		var free_space = [FREESPACE];
    var total_space = [TOTALSPACE];

		var data = [];	
		var series = Math.floor(Math.random()*10)+1;	
		for( var i = 0; i<series; i++)	{		
			data[i] = { label: "Series"+(i+1), data: Math.floor(Math.random()*100)+1 }	
		}

		// Piechart-Plotter
		PlotDrives();

		// Create-Dialog
		$('#create_new').click(function(e) {
			var limit = 150;

			var description = $('#create_description').val();
			var size = $('#create_size').val();

			// Add Logger Entries
			Logger.Reset('logging');
			Logger.Add('logging', 'Create container');
			Logger.Add('logging', 'Format with vFat');
			Logger.Add('logging', 'Mount new disk');


			if(description=='') {
				alert("Please enter a drive letter");
				return;
			}
			
			if(size=='') {
				alert('Please enter the required drive size');
				return;
			}
	
			if(!(size > 0 && size <= free_space-limit)) {
				alert("The entered size is not valid! At the moment are "+limit+" MB reserverd for internal thungs.");
				$('#create_size').val(free_space-limit);

				return;
			}


			$.get('./apps/harddiskcrypt/harddiskcrypt.php?action=exists&name='+description+'&size='+size, function(data) {
				if(data=='0') {
	    		$('#modal-create').reveal({                // The item which will be opened with reveal
		    		animation: 'fade',              // fade, fadeAndPop, none
		    		animationspeed: 200,            // how fast animtions are
		    		closeonbackgroundclick: true,   // if you click background will modal close?
						refreshonclose: true,   
		    		dismissmodalclass: 'close'      // the class of a button or element that will close an open modal
		  		});

					Logger.SetActive('logging', 1);
					CreateDrive(description, size);
				}else
					alert("There is already a drive with that name. Please erase the drive before creating a new one.");
			});
		});
	});

	function SetDefault(name) {
		$.get('./apps/harddiskcrypt/harddiskcrypt.php?action=default&name='+name, function(data) {	
			if(data=='1') window.location.reload();
		});
	}	

	function OpenDrive(name, path)
	{
		$.get('./apps/harddiskcrypt/harddiskcrypt.php?action=open&name='+name, function(data) {
			if(data=='locked') 
				alert('You must unmount the volume first before you can use them with the file browser!');
			
			if(data=='opened'){
				location.href = path;
			}

			if(data=='noslots')
				alert('It can be open simultaneously up to 8 images. Connect at least one disk');

			if(data=='error')
				alert('The disk could not be mounted! Please try again.');

			if(data=='success'){
				location.href = path;
			}
		});
	}

	function Mount(name) {
		$('#modal-mount').reveal({         
	    animation: 'fade',              
	    animationspeed: 200,            
	    closeonbackgroundclick: true,
			refreshonclose: true,   
	    dismissmodalclass: 'close'      
	  });

		$.get('./apps/harddiskcrypt/harddiskcrypt.php?action=mount&name='+name, function(data) {
			if(data=='0') {
				$('#mount').html('<center><div style="margin:25px 0px;"><img style="margin-bottom: 5px;"src="./themes/fredgui/images/dialog_error.png"><br><b>The drive could not be mounted!</b></center>');
			}

			if(data=='1') {
				$('#mount').html('<center><div style="margin:25px 0px;"><img style="margin-bottom: 5px;"src="./themes/fredgui/images/dialog_accept.png"><br><b>Ready!</b></center>');
			}

			if(data=='device already active') {
				$('#mount').html('<center><div style="margin:25px 0px;"><img style="margin-bottom: 5px;"src="./themes/fredgui/images/dialog_warning.png"><br><b>The drive is already mounted!</b></center>');
			}

			if(data=='cant find device') {
				$('#mount').html('<center><div style="margin:25px 0px;"><img style="margin-bottom: 5px;"src="./themes/fredgui/images/dialog_error.png"><br><b>The drive could not be found!</b></center>');
			}
		});
	}

	function Unmount(name) {
		$('#modal-unmount').reveal({         
			animation: 'fade',              
			animationspeed: 200,            
			closeonbackgroundclick: true,   
			refreshonclose: true,   
			dismissmodalclass: 'close'      
		});

		$.get('./apps/harddiskcrypt/harddiskcrypt.php?action=unmount&name='+name, function(data) {
			if(data=='1') 
				$('#unmount').html('<center><div style="margin:25px 0px;"><img style="margin-bottom: 5px;"src="./themes/fredgui/images/dialog_accept.png"><br><b>Ready!</b><br>Please umount the drive in you operating system</center>');

			if(data=='0')
				$('#mount').html('<center><div style="margin:25px 0px;"><img style="margin-bottom: 5px;"src="./themes/fredgui/images/dialog_error.png"><br><b>Disk could not be unmounted! Please try again.</b></center>');

		});
	}
</script>

<style type="text/css">
	div.graph
	{
		width: 250px;
		height: 250px;
		border: 1px dashed #bbb;
	} 
</style>

<table border="0">
	<tr valign="top"><td><h4>Storage</h4></td></tr>

	<tr valign="top"><td>
		<div id="piechart" class="graph" style="margin: 1px 15px 10px 1px;float:left;"></div>
		<div style="display:inline-block;">
			<table>
				<tr>
					<td>
					<h4>Disk</h4>
						<table width="100%">
							<tr><td width="100" nowrap>Storage (complete):</td><td>[TOTALSPACE] MB</td></tr>
							<tr><td nowrap>Storage (free):</td><td>[FREESPACE] MB</td></tr>
							<!--<tr><td>Laufwerke:</td><td>[DRIVES]</td></tr>-->
						</table>
					</td>
				</tr>
				<tr>
					<td>
					<h4>Create new drive</h4>
					<table border="0">
						<tr><td width="100">Drive name:</td><td><input type="text" id="create_description" style="width:200px"></td></tr>
						<tr><td>Size:</td><td><input type="text" id="create_size" style="width:50px;text-align:right;padding-right:2px;"> MB</td></tr>
						<tr><td></td><td><input type="button" id="create_new" class="blue" value="Create drive"></td></tr>
					</table>
			</table>
		</div>
	</td></tr>

	<tr>
		<td>
		  <table width="100%">
				<tr><th>Name</th><th>Drive</th><th>Size</th><th>Active</th><th>Action</th></tr>
				[DRIVESTABLE]
			</table>
		</td>
	</tr>

</table>

<!-- ModalPopup - Neues Laufwerk -->
<div id="modal-create" class="modal">
	<div class="modal-header">
		Drive creating
	</div>
	<div class="modal-body">
		<div class="modal-content" style="width: 400px;">
			<div id="logging"></div>
		</div>
	</div>
</div>

<!-- ModalPopup - Mount -->
<div id="modal-mount" class="modal">
  <div class="modal-header">
		Drive is mounting
	</div>
	<div class="modal-body">
		<div class="modal-content" style="width: 400px;">
		<div id="mount"><center><div style="margin:25px 0px;"><img style="margin-bottom: 5px;"src="./themes/fredgui/images/spinner.gif"><br><b>Please wait ...</b></center></div>
		</div>
	</div>
</div>

<!-- ModalPopup - Unmount -->
<div id="modal-unmount" class="modal">
  <div class="modal-header">
		Drive is unmounting
	</div>
	<div class="modal-body">
		<div class="modal-content" style="width: 400px;">
			<div id="unmount"><center><div style="margin:25px 0px;"><img style="margin-bottom: 5px;"src="./themes/fredgui/images/spinner.gif"><br><b>Please wait ...</b></center></div>
		</div>
	</div>
</div>



