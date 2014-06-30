
<script>

  $(function() {
    $( "#tabs" ).tabs();
  });

$("#myTable thead").addClass("ui-widget-header");
</script>


<div class="demo">

<div id="tabs">
  <ul>
    <li><a href="#tabs-1">Ausweis-App</a></li>
  </ul>
  <div id="tabs-1">
    <p>Proin elit arcu, rutrper leo. Vivamus sed magna quis ligula eleifend adipiscing. Duis orci. Aliquam sodales tortor vitae ipsum. Aliquam nulla. Duis aliquam molestie erat. Ut et mauris vel pede varius sollicitudin. Sed ut dolor nec orci tincidunt interdum. Phasellus ipsum. Nunc tristique tempus lectus.</p>

<script>
  $(function() {
    $( "button", ".demo" ).button();
  });
  </script>
<div class="demo">
<table width="100%">
<tr><td width="50%">

<script>

var refreshId = setInterval(function()
{
     $('#check').fadeTo("fast").load('index.php?module=npa&action=rfidleser');
     }, 2000);
</script>
<div id="check"><img src="./themes/fredgui/images/searchrfid.png"></div>
     
</td><td style="border-left: solid 2px;" align="center">
<center><button>Ausweis-App Starten</button></center>
<center><button>PIN &auml;ndern</button></center>
</td></tr></table>

</div><!-- End demo -->
</div><!-- End demo -->

