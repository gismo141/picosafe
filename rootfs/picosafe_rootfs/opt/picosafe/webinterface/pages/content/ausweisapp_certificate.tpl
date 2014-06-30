<link rel="stylesheet" type="text/css" href="apps/ausweis/spinner.css" />

<script>

	function nextPage() {
		alert('yo');
  	window.location.href='index.php?module=ausweisapp&action=user';
  }

	


  $(function() {
    $( "#tabs" ).tabs();

		$("#bar").progressbar({value: 0});


		function refreshCounter() {
    	$.getJSON('index.php?module=ausweisapp&action=status', function(data){
        	$("#bar").progressbar({value: data.progress});
        	$("#watcher").html(data.description);
					setTimeout(function() {refreshCounter();}, 300);
    	});
  	}
		refreshCounter();

		$.get('index.php?module=ausweisapp&action=getcertificate', function(data) {
			if(data=='1') {
				$("#status").html("Zertifikat erfolgreich empfangen");
				setTimeout(function() {window.location.href='index.php?module=ausweisapp&action=user';}, 600);
			}
		});

	});

</script>
<h4>AusweisApp</h4>

<table border="0" width="700" cellspacing="5" cellpadding="10">

<div style="margin: 100px 0px 100px 0px;">
<center><p><div id="status">Empfange Zertifikat</div></p>
<div id="circleG">
<div id="circleG_1" class="circleG">
</div>
<div id="circleG_2" class="circleG">
</div>
<div id="circleG_3" class="circleG">
</div>
<div style="clear:both"></div>
</div>
</center>
</div>

<TABLE cellspacing=0 cellpadding=2 width="100%">
<tr><td colspan=2>
	<div id="bar"></div>
	<div id="watcher"></div>
</td></tr></table>
