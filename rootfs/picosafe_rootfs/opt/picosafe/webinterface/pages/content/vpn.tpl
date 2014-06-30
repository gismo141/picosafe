
<script>

  $(function() {
    $( "#tabs" ).tabs();
  });

$("#myTable thead").addClass("ui-widget-header");

  </script>





<div class="demo">

<div id="tabs">
  <ul>
    <li><a href="#tabs-1">Verbindungen</a></li>
    <li><a href="#tabs-2">Einstellungen</a></li>
  </ul>
  <div id="tabs-1">
    <p>Verbinden Sie sich jetzt mit Ihrem Netzwerk.</p>

<script>
  $(function() {
    $( "button", ".demo" ).button();
  });
  </script>
<div class="demo">

<center><button>Jetzt mit Netzwerk verbinden</button></center>

</div>

  </div>
  <div id="tabs-2">
  <p>VPN Zugangsdaten:</p>
    <table border="0" width="100%" class="ui-widget">
      <tr><td>VPN-Server:</td><td><input type="text" size="40"></td></tr>
      <tr><td>Authentifizierung:</td><td><select><option>Benutzername / Passwort</option><option>Smartcard</option></select></td></tr>
      <tr><td>Benutzername:</td><td><input type="text" size="40"></td></tr>
      <tr><td>Passwort:</td><td><input type="text" size="40"></td></tr>
    </table>
        <table width="100%"><tr><td align="right"><input type="button" value="Speichern"></td></tr></table>

  </div>
</div>

</div><!-- End demo -->



<div style="display: none;" class="demo-description">
<p>Click tabs to swap between content that is broken into logical sections.</p>
</div><!-- End demo-description -->
