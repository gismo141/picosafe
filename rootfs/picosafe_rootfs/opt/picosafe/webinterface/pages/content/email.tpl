<script>

  $(function() {
    $( "#tabs" ).tabs();
  });

$("#myTable thead").addClass("ui-widget-header");

  </script>


<div class="demo">
<h1>Coming ...</h1>
<!--
<div id="tabs">
  <ul>
    <li><a href="#tabs-1">Lesen</a></li>
    <li><a href="#tabs-2">Schreiben</a></li>
    <li><a href="#tabs-3">Adressen</a></li>
    <li><a href="#tabs-4">Einstellungen</a></li>
  </ul>
  <div id="tabs-1">
  <script>
    $(function() {
        $( "button", ".demo" ).button();
          });
            </script>
            
            <center><button>E-Mails jetzt abrufen</button></center>
            <br>
            
<table id="myTable" border="0" class="ui-widget" width="100%">
<thead class="ui-widget-header">
    <tr>
        <th>Von</th>
        <th width="50%">Betreff</th>
        <th>Datum</th>
        <th>Aktion</th>
    </tr>
</thead>
<tbody class="ui-widget-content">
    <tr>
        <td>Benedikt Sauter</td>
        <td>Zugangsdaten Server</td>
        <td>01.08.2012</td>
        <td>Lesen / Antworten / L&ouml;schen</td>
    </tr>
</tbody>
</table>
  </div>
  <div id="tabs-2">
    <table border="0" width="100%" class="ui-widget">
      <tr><td>Empf&auml;nger:</td><td><input type="text" size="40"></td></tr>
      <tr><td>Betreff:</td><td><input type="text" size="40"></td></tr>
      <tr valign="top"><td>Nachricht:</td><td><textarea rows="10" cols="40"></textarea></td></tr>
      <tr><td>Verschl&uuml;sselt:</td><td><input type="radio" name="same" checked>(Achtung nur Nachricht, kein Betreff, wird verschl&uuml;sselt.)</td></tr>
      <tr><td>Offen:</td><td><input type="radio" name="same"></td></tr>
      <tr><td></td><td><input type="button" value="Absenden"></td></tr>
    </table>

  </div>
  
 <div id="tabs-3"> 
  <table id="myTable" border="0" class="ui-widget" width="100%">                                                                                                                            
  <thead class="ui-widget-header">                                                                                                                                                          
      <tr>                                                                                                                                                                                  
                      <th width="50%">Name</th>                                                                                                                                                      
                              <th>E-Mail</th>                                                                                                                                                                    
                               <th>Aktion</th>                                                                                                                                                                   
                                          </tr>                                                                                                                                                                                 
                                          </thead>                                                                                                                                                                                  
                                          <tbody class="ui-widget-content">                                                                                                                                                         
                                              <tr>                                                                                                                                                                                  
                                                      <td>Benedikt Sauter</td>                                                                                                                                                          
                                                              <td>sauter_picosafe@embedded-projects.net</td>                                                                                                                                                      
                                                              <td>Bearbeiten / L&ouml;schen</td>                                                                                                                                         
                                                                    </tr>                                                                                                                                                                                 
                                                                                  </tbody>                                                                                                                                                                                  
                                                                                  </table>                                                                                                                                                                                  
                                                                                    </div> 
  
  <div id="tabs-4">
  <p>Grundeinstellungen Picosafe E-Mail Zugang.</p>
    <table border="0" width="100%" class="ui-widget">
      <tr><td>Benutzername:</td><td><input type="text" size="40"></td></tr>
      <tr><td>Passwort:</td><td><input type="text" size="40"></td></tr>
      <tr><td>Server (SMTP + POP3):</td><td><input type="text" size="40"></td></tr>
      <tr valign="top"><td>Signatur:</td><td><textarea rows="10" cols="40"></textarea></td></tr>
      <tr valign="top"><td>Asym-Key Public:</td><td><textarea rows="10" cols="40"></textarea></td></tr>
      <tr valign="top"><td>Asym-Key Private:</td><td><a href="#">Bearbeiten</a></td></tr>
      <tr><td></td><td><input type="button" value="Speichern"></td></tr>
    </table>
  </div>
</div>

</div><!-- End demo -->



<div style="display: none;" class="demo-description">
<p>Click tabs to swap between content that is broken into logical sections.</p>
-->
</div><!-- End demo-description -->
