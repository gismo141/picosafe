<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Picosafe&reg;</title>
    <link rel="stylesheet" type="text/css" href="themes/fredgui/css/redmond/jquery-ui-1.9.2.custom.min.css" />
    <link rel="stylesheet" type="text/css" href="themes/fredgui/css/main.css" />
    <link rel="stylesheet" type="text/css" href="themes/fredgui/css/wiki.css" />
    <link rel="stylesheet" type="text/css" href="js/modalPopup/css/style.css" />

    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="js/base64.js"></script>
		<script type="text/javascript" src="js/nocie.js"></script>
		<script type="text/javascript" src="js/shareclient/js/shareclient.js"></script>
    <script type="text/javascript" src="themes/fredgui/js/jquery-ui-1.9.2.custom.min.js"></script>
    <script type="text/javascript" src="js/modalPopup/js/jquery.reveal.js"></script>



   	<script type="text/javascript" src="js/popUpReplace.js"></script>
		<script type="text/javascript">
			var shareClient = $.ShareClient({client: 'js/shareclient/shareclient.php'});
		</script>
 <script>
$(function() {
$( "#tabs" ).tabs();
});
</script>
 <script>
$(function() {
$( "input[type=submit], a.npa, button" )
.button()
.click(function( event ) {
});
});
</script>
  </head>



  <body class="yui-skin-sam" id="yahoo-com">
    <div id="wrapper">
      <div id="top" class="clear">
	<!--<h1><a href="#">FRED</a></h1>-->
		<a href="index.php"><img src="./themes/fredgui/images/picosafe.png" style="margin-top: 25px;"></a>
	<ul>
	  <li><a href="index.php">Main</a></li>
	  <li><a href="index.php?module=apps&action=list">Applications</a></li>
	  <li><a href="index.php?module=settings&action=list">Settings</a></li>
	  <li><a href="index.php?module=welcome&action=lock">Lock</a></li>
	</ul>
      </div>
	
      <div id="body" class="clear">
<!--
	<div id="sidebar" class="column-left">
	  [SIDEBAR]
	</div>
-->
	
	<!-- Content-Start -->
	  [PAGE]

	<!-- Content-End -->

      </div>
	
      <div id="footer-left" align="left">
</div>
      <div id="footer-right">
	<p>&copy; by embedded projects GmbH</p>
      </div>

    </div>
  </body>
</html>
