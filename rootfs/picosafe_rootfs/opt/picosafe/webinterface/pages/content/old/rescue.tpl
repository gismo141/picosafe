<script>
  $(function() {
    $( "#tabs" ).tabs();
  });
  </script>



<div class="demo">

<div id="tabs">
  <ul>
    <li><a href="#tabs-1">PUK Eingabe</a></li>
  </ul>
  <div id="tabs-1">
  [WARNPUK]
    <p>Ihre PIN ist gesperrt. Bitte geben Sie Ihre PUK ein um die PIN wieder zu entsperren. Sie haben noch <font style="font-style:bold;">[COUNTPUK]</font> Versuche frei.</p>
    <form action="" method="post">
    <table border="0" width="100%" class="ui-widget">
      <tr><td>PUK:</td><td><input type="text" size="40" name="puk">&nbsp;<input type="submit" value="PIN jetzt freischalten" name="enterpuk"></td></tr>
    </table>
    </form>
  </div>
</div>

</div><!-- End demo -->


