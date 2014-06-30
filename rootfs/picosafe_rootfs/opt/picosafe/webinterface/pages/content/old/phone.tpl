<script>
  $(function() {
    $( "#tabs" ).tabs();
  });

$("#myTable thead").addClass("ui-widget-header");

  </script>



<div class="demo">

<div id="tabs">
  <ul>
    <li><a href="#tabs-1">Telefon</a></li>
    <li><a href="#tabs-2">SIP-Account</a></li>
  </ul>
  <div id="tabs-1">
    <p>Ihr Telefon:</p>

  <table>
    <tr><td><input type="text" size="40" id="eingabe">&nbsp;<input type="button" value="Anrufen"><input type="button" value="Clear"  onclick="window.document.getElementById('eingabe').value=''"></td></tr>
    <tr><td>

  <table>
    <tr><td><input type="button" value="1" onclick="window.document.getElementById('eingabe').value+=1"></td><td><input type="button" value="2" onclick="window.document.getElementById('eingabe').value+='2'"></td><td><input type="button" value="3" onclick="window.document.getElementById('eingabe').value+='3'"></td></tr>
    <tr><td><input type="button" value="4" onclick="window.document.getElementById('eingabe').value+=4"></td><td><input type="button" value="5" onclick="window.document.getElementById('eingabe').value+='5'"></td><td><input type="button" value="6" onclick="window.document.getElementById('eingabe').value+='6'"></td></tr>
    <tr><td><input type="button" value="7" onclick="window.document.getElementById('eingabe').value+=7"></td><td><input type="button" value="8" onclick="window.document.getElementById('eingabe').value+='8'"></td><td><input type="button" value="9" onclick="window.document.getElementById('eingabe').value+='9'"></td></tr>
    <tr><td><input type="button" value="*" onclick="window.document.getElementById('eingabe').value+='*'"></td><td><input type="button" value="0" onclick="window.document.getElementById('eingabe').value+='0'"></td><td><input type="button" value="#" onclick="window.document.getElementById('eingabe').value+='#'"></td></tr>
  </table>


    </td></tr>
    </table>

  </div>
  <div id="tabs-2">
    <p>Zugangsdaten f&uuml;r Ihr SIP-Account:</p>


    <table border="0" width="100%" class="ui-widget">
      <tr><td>Account:</td><td><input type="text" size="40"></td></tr>
      <tr><td>Host:</td><td><input type="text" size="40"></td></tr>
      <tr><td>Passwort:</td><td><input type="password" size="40"></td></tr>
      <tr><td>Passwort wdh:</td><td><input type="password" size="40"></td></tr>
      <tr><td></td><td><input type="button" value="Speichern"></td></tr>
    </table>
  

  </div>
</div>

</div><!-- End demo -->



<div style="display: none;" class="demo-description">
<p>Click tabs to swap between content that is broken into logical sections.</p>
</div><!-- End demo-description -->
