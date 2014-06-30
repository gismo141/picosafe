<script type="text/javascript" src="js/filemanager/js/base64.js"></script>
<script type="text/javascript" src="js/filemanager/js/filemanager.js"></script>
<link rel="stylesheet" type="text/css" href="js/filemanager/css/style.css" />

<script type="text/javascript">
	$(document).ready(function() {
		var shareClient = $.ShareClient({client: 'js/shareclient/shareclient.php'});
		$('#filebrowser').FileManager({
			directory : '[PATH]',
			target: 'js/filemanager/filemanager.php'
		});				
	});
</script>


<div style="width: 100%; min-height:400px;margin-bottom:20px;">
		<link rel="stylesheet" type="text/css" href="../modalPopup/css/style.css" />

	<a href="index.php?module=harddisk&action=list" class="blue" style="display: block;margin-bottom: 10px;">Back</a>

	<div id="filebrowser"></div>
</div>
