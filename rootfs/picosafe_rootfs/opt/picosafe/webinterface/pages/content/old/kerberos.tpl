<script>

  $(function() {
    $( "#tabs" ).tabs();
  });

$("#myTable thead").addClass("ui-widget-header");

  </script>



<div class="demo">

<div id="tabs">
  <ul>
    <li><a href="#tabs-1">Login</a></li>
    <li><a href="#tabs-2">Tickets</a></li>
  </ul>
  <div id="tabs-1">
<p>Aktuell muss das Ticket &uuml;ber SSH angefordert werden.</p>
<!--
  <form action="" method="POST">
    <table border="0" width="100%" class="ui-widget">
      <tr><td>Principal:</td><td><input type="text" size="40"></td></tr>
      <tr><td>Passwort:</td><td><input type="passwort" size="40"></td></tr>
      <tr><td></td><td><input type="submit" name="kinit" value="Ticket anfordern"></td></tr>
    </table>
   </form>
-->
  </div>
  <div id="tabs-2">
  <form action="" method="POST"><input type="submit" name="kdestroy" value="Aktuelle Tickets l&ouml;schen"></form>
  <textarea rows="20" cols="100">[KLIST]</textarea>
  </div>

</div><!-- End demo -->



