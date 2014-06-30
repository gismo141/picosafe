
<script>

  $(function() {
    $( "#tabs" ).tabs();
  });

$("#myTable thead").addClass("ui-widget-header");
</script>



<div id="tabs">
  <ul>
    <li><a href="#tabs-1">&Uuml;berweisungen</a></li>
    <li><a href="#tabs-2">Online-Banking</a></li>
  </ul>
  <div id="tabs-1">
    <p>Proin elit arcu, rutrper leo. Vivamus sed magna quis ligula eleifend adipiscing. Duis orci. Aliquam sodales tortor vitae ipsum. Aliquam nulla. Duis aliquam molestie erat. Ut et mauris vel pede varius sollicitudin. Sed ut dolor nec orci tincidunt interdum. Phasellus ipsum. Nunc tristique tempus lectus.</p>

<script>
  $(function() {
    $( "button", ".demo" ).button();
  });
  </script>
<table width="100%">
<tr><td width="50%">
  <div class="ui-state-highlight ui-corner-all" style="padding: 0 .7em;">
          <p><span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span>
          <strong>Hinweis:</strong> Es warten 5 &Uuml;berweisungen auf Ihre Freigabe!</p>
  </div>
<br>
<table id="myTable" border="0" class="ui-widget" width="100%">
<thead class="ui-widget-header">
    <tr>
        <th width="30%">Empf&auml;nger</th>
        <th>Konto</th>
        <th>BLZ</th>
        <th>Betreff</th>
        <th>Summe</th>
        <th>W&auml;hrung</th>
    </tr>
</thead>
<tbody class="ui-widget-content">
[UEBERWEISUNGEN]
</tbody>
</table>




</td><td  align="center">

<script>                                  
    $(function() {                            
$( "#pin" ).button()                                                                   
             .click(function() {                    
                   $.get('http://10.0.0.1/index.php?module=banking&action=pin',function(data,status) { },'html');
});                                                                                           

</script>                                                                                                 

<input type="submit" id="pin" value="&Uuml;berweisungen freigeben"/>                                        



</td></tr></table>

</div>

<div id="tabs-2">

  <script>                                  
    $(function() {                            
$( "#oeffnen" ).button()                                                                   
             .click(function() {                    
                   $.get('http://10.0.0.1/index.php?module=banking&action=openbrowser',function(data,status) { },'html');
});                                                                                           

$( "#schliessen" ).button()                                                                   
.click(function() {                                                                      
$.get('http://10.0.0.1/index.php?module=banking&action=closebrowser',function(data,status) { },'html');
});                                                                                      

});                                                                                                       
</script>                                                                                                 


<input type="submit" id="oeffnen" value="Browser Laufwerk &ouml;ffnen"/>                                        
<input type="submit" id="schliessen" value="Browser Laufwerk schlie&szlig;en"/>                                 



</div><!-- End demo -->
</div><!-- End demo -->

