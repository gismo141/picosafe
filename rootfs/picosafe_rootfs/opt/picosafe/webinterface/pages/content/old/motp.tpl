<script>
  $(function() {
    $( "#tabs" ).tabs();
  });
  </script>



<div class="demo">

<div id="tabs">
  <ul>
    <li><a href="#tabs-1">Konfiguration</a></li>
  </ul>
  <div id="tabs-1">
    [MESSAGE]
    <p>Bitte geben Sie hier Ihre PIN und das Secret f&uuml;r Ihrem mOTP Zugang ein:</p>
    <form action="" method="post">
    <table border="0" width="100%" class="ui-widget">
      <!--<tr><td>OTP PIN:</td><td><input type="text" name="pin" value="[PIN]" size="40"></td></tr>-->
      <tr><td>OTP Secret:</td><td><input type="text" name="secret" value="[SECRET]" size="40"></td></tr>
      <tr><td>Aktuelle Uhrzeit:</td><td>[UHRZEIT]</td></tr>
      <tr><td></td><td><input type="submit" name="submit" value="Speichern"></td></tr>
    </table>
    </form>

  </div>
</div>

</div><!-- End demo -->


