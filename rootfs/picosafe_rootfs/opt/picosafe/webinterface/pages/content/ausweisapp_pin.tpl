<link rel="stylesheet" type="text/css" href="apps/ausweis/ausweis_pin.css" />

<script>
  $(function() {
    $( "#tabs" ).tabs();

		$("#bar").progressbar({value: 0});


		var waiting = false;
    function Input() {
      if(!waiting && !pinpad_active) {
        waiting = true;
        $.get('index.php?module=ausweisapp&action=requestpin', function() {
          waiting = false;
        });
      }
    }
    Input();



		var pinpad_active = false;

		$( "#numpad_activate" ).button().click(function(event) {
			var numpad = $('#numpad');
			var img = $('#Lockimg');
			if(numpad.css('display')=='none') {
				numpad.css('display','table');
				img.css('display', 'none');
				pinpad_active = true;
				$( "#numpad_activate" ).val('Picosafe-Eingabe');
			}else {
				numpad.css('display','none');
        img.css('display', 'block');
        pinpad_active = false;
				$( "#numpad_activate" ).val('Bildschirmtastatur');
				$('#status').html('Geben Sie bitte den 6-stelligen PIN ein');
				pin = '';
				$('#numpad_display').val('');
				Input()
			}	
		});



		var pin = '';
		$( "#numpad input[type=button]" )
      .button()
      .click(function( event ) {
				var display = $('#numpad_display');
				var len = pin.length;
				
				if(this.value=='Ok') {
					$.get('index.php?module=ausweisapp&action=setpin&pin='+pin);
				}else if(this.value=='Clear'){
					pin = '';	
				} else {
					if(len < 6) 
						pin += this.value;
				}

				var out = '';
				for(i=0;i<pin.length;i++)
					out += '*';
				display.val(out);
		});


		function refreshCounter() {
    	$.getJSON('index.php?module=ausweisapp&action=status', function(data){
        	$("#bar").progressbar({value: data.progress});
        	$("#watcher").html(data.description);
					setTimeout(function() {refreshCounter();}, 300);
    	});
  	}
		refreshCounter();
		

		function checkPin() {
			$.get('index.php?module=ausweisapp&action=checkpin', function(status){
				if(status=='ok') {
					//$('#status').html('Pin-Eingabe war erfolgreich');
					setTimeout(function() {window.location.href='index.php?module=ausweisapp&action=send';}, 200);
				}else if(status=='short') {
					$('#status').html('Der eingegebene Pin ist zu kurz<br>Versuchen Sie es bitte erneut');
					Input();
				}else if(status=='long') {
					$('#status').html('Der eingegebene Pin ist zu lange');
					Input();
				}else if(status=='timeout') {
					$('#status').html('Die Wartezeit ist abgelaufen<br>Versuchen Sie es bitte erneut');
					Input();
				}
				
				setTimeout(function() {checkPin();}, 500);
			});
		}
		checkPin();

	});

</script>
<h4>AusweisApp</h4>


<div style="margin: 50px 0px 100px 0px;">
<center><p><div id="status">Geben Sie bitte den 6-stelligen PIN ein</div></p>
<img id="Lockimg" src="apps/ausweis/Lock.png">
<table id="numpad">
  <tr>
    <td colspan="3"><input type="text" id="numpad_display" readonly></td>
  </tr>
  <tr>
    <td><input type="button" value="1"></td>
    <td><input type="button" value="2"></td>
    <td><input type="button" value="3"></td>
  </tr>
  <tr>
    <td><input type="button" value="4"></td>
    <td><input type="button" value="5"></td>
    <td><input type="button" value="6"></td>
  </tr>
  <tr>
    <td><input type="button" value="7"></td>
    <td><input type="button" value="8"></td>
    <td><input type="button" value="9"></td>
  </tr>
  <tr>
    <td><input type="button" value="Clear"></td>
    <td><input type="button" value="0"></td>
    <td><input type="button" value="Ok"></td>
  </tr>
</table>
<br><input type="button" id="numpad_activate" style="margin-top: 10px;" value="Bildschirmtastatur"><br>
</center>
</div>

<TABLE cellspacing=0 cellpadding=2 width="100%">
<tr><td colspan=2>
	<div id="bar"></div>
	<div id="watcher"></div>
</td></tr></table>
