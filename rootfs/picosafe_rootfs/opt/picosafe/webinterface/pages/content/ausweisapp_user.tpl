
<script>

$(function() {
	$( "#tabs" ).tabs();
  
	$("#bar").progressbar({value: 0});

	$("#send").button().click(function(){
		$.post('index.php?module=ausweisapp&action=details', function(data) {
			if(data=='1')
				setTimeout(function() {window.location.href='index.php?module=ausweisapp&action=pin';}, 600);	
		});
  });

	$("#cancel").button().click(function(){ });

	function refreshCounter() {
    $.getJSON('index.php?module=ausweisapp&action=status', function(data){
        $("#bar").progressbar({value: data.progress});
        $("#watcher").html(data.description);
        setTimeout(function() {refreshCounter();}, 300);
    });
  };
  refreshCounter();


});
</script>
<h4>AusweisApp</h4>

<table border="0" width="700" cellspacing="5" cellpadding="10">
<tr valign="top"><td width="50%"><font style="font-weight: bold">Zertifikat des Dienstanbieters</font><br>
<DIV STYLE="overflow: auto; width: 280px; height: 150px; 
            border-left: 1px gray solid; border-bottom: 1px gray solid; 
            border-top: 1px gray solid; border-right: 1px gray solid; 
            padding:0px; margin: 0px">
<TABLE cellspacing=0 cellpadding=2>
<tr><td>
[CERTDESCRIPTION]
</div>
</td></tr></table>

</td><td>
<font style="font-weight: bold">Auszulesende Daten</font>
<table>
<tr><td><input type="checkbox" [NAMESTATUS]></td><td>Vorname(n)</td><td>&nbsp;</td>
		<td><input type="checkbox" [ARTISTNAME]></td><td>Ordens- und Kuenstlername</td></tr>
<tr><td><input type="checkbox" [SURNAMESTATUS]></td><td>Name</td><td>&nbsp;</td>
		<td><input type="checkbox" [IDTYPE]></td><td>Ausweistyp</td></tr>
<tr><td><input type="checkbox" [PHDSTATUS]></td><td>Doktorgrad</td><td>&nbsp;</td>
		<td><input type="checkbox" [ISSUINGCOUNTRYSTATUS]></td><td>Ausstellendes Land</td></tr>
<tr><td><input type="checkbox" [ADDRESSSTATUS]></td><td>Anschrift</td><td>&nbsp;</td>
		<td><input type="checkbox" [PORSTATUS]></td><td>Wohnortbest&auml;tigung</td></tr>
<tr><td><input type="checkbox" [BIRTHDATESTATUS]></td><td>Geburtsdatum</td><td>&nbsp;</td>
		<td><input type="checkbox" [AGEVERIFYSTATUS]></td><td>Altersverifikation</td></tr>
<tr><td><input type="checkbox" [BIRTHPLACESTATUS]></td><td>Geburtsort</td><td>&nbsp;</td>
		<td><input type="checkbox" [PSEUDONYMSTATUS]></td><td>Pseudonym/Kartenkennung</td></tr>
</table>

</td></tr>
<tr><td><font style="font-weight: bold">Aussteller des Berechtigungszertifikat</font><br>

<DIV STYLE="overflow: auto; width: 280px; height: 60px; 
            border-left: 1px gray solid; border-bottom: 1px gray solid; 
            border-top: 1px gray solid; border-right: 1px gray solid; 
            padding:0px; margin: 0px">
<TABLE cellspacing=0 cellpadding=2>
<tr><td>
[CERTNAME]<br>
[CERTURL]
</div>
</td></tr></table>

</td><td>
<font style="font-weight: bold">Weiter mit Personalausweis</font><br>
<form name="form" action="post">
<hr>
<table align="center"><tr>
<td><input type="button" id="send" value="Weiter"></td>
<!--<td><input type="button" id="bestaetigen" value="Best&auml;tigen"></td>-->
<td><input type="button" id="cancel" value="Abbrechen"></td>
</table>
</form>
</td></tr>
<tr><td colspan=2>

  

<div id="bar"></div>
<div id="watcher"></div>
</td></tr></table>
