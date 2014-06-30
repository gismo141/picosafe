
<script>

  $(function() {
    $( "#tabs" ).tabs();
  });

$("#myTable thead").addClass("ui-widget-header");
</script>

<h4>AusweisApp</h4>
<center>

    <p>Bitte legen Sie Ihren Ausweis auf den Leser:</p>


<table width="100%">
<tr><td width="50%">

<script>

var refreshId = setInterval(function()
{
     $('#check').fadeTo("fast").load('index.php?module=ausweisapp&action=rfidleser');
     }, 2000);
</script>
<div id="check" align="center"><img src="./themes/fredgui/images/searchrfid.png"></div>
     
</td></tr></table>

</center>
