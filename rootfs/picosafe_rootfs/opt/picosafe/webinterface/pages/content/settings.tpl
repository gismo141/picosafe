<script>
  $(function() {
    $( "#accordion" ).accordion({
      heightStyle: "fill"
    });
  });
  $(function() {
    $( "#accordion-resizer" ).resizable({
      minHeight: 140,
      minWidth: 200,
      resize: function() {
        $( "#accordion" ).accordion( "refresh" );
      }
    });
  });
  </script>

<style>
  #accordion-resizer {
    padding: 10px;
    width: 900px;
    height: 420px;
  }
  </style>


<h4>Settings</h4>
[MESSAGE]
<div id="accordion-resizer" class="ui-widget-content">
<div id="accordion" style="height:500px">
<h3>General settings</h3>
<div>
<form action="" method="post">
<input type="hidden" name="cmd" value="general">
<table>
<tr><td>Date:</td><td><input type="text" name="date" value="[DATE]"></td><td>&nbsp;</td><td>Time:</td><td><input type="text" name="hour" size="3" value="[HOUR]">:<input type="text" name="minute" size="3" value="[MINUTE]"><input type="text" name="seconds" size="3" value="[SECONDS]"></td></tr>
<tr><td>Shutdown time after (seconds):</td><td><input type="text" name="shutdown" size="4" value="[SHUTDOWN]"></td><td>&nbsp;</td><td></td><td></td></tr>
<tr><td>File exchange server:</td><td colspan="4"><input type="text" name="url" size="40" value="[URL]"></td></tr>
<tr><td>Online check IP:</td><td colspan="4"><input type="text" name="network_check" size="40" value="[NETWORKCHECK]"></td></tr>
</table>
<br>
<br>
<center><input type="submit" value="Save" name="submit"><input type="submit" name="cancel" value="Cancel"></center>
</div>
</form>
<h3>Lock password</h3>
<form action="" method="post">
<input type="hidden" name="cmd" value="lockpassword">
<div>
<p>Lock password for this management console.</p>
<table>
<tr><td>Lock password: </td><td><input type="password" name="password"></td><td>&nbsp;</td><td>Lock password (repeat):</td><td><input type="password" name="repassword"></td></tr>
</table>
<br>
<br>
<center><input type="submit" name="submit" value="Save"><input type="submit" name="cancel" value="Cancel"></center>
</form>
</div>
<h3>Personal password</h3>
<div>
<p>To change your password you have to login with ssh (user picosafe and pass picosafe at delivery). And then type:</p>
<pre>passwd</pre><br><br>
And change your password. To change encrypt password for boot type this:
<br><br>
Show LUKS keys:
<br><br><pre>sudo cryptsetup luksDump /dev/mmcblk0p3</pre><br>
Add a LUKS key:
<br><br><pre>sudo cryptsetup luksAddKey /dev/mmcblk0p3</pre><br>
Remove LUKS key:
<br><br><pre>sudo cryptsetup luksKillSlot /dev/mmcblk0p3 0</pre><br><br>
Or change 0 for another slot. You can add up to 8 keys (0-7).
<br>
</div>
<h3>Database</h3>
<div>
<p>
<a href="phpliteadmin.php" target="_blank">Link to phpLiteAdmin</a>
</p>
</div>
<h3>Update</h3>
<div>
<p>
Check easy for new updates.
</p>
<a href="backup.php">Check for updates</a>
</div>

<h3>Backup</h3>
<div>
<p>
Download all important files to recover picosafe.
</p>
<p style="color:red">
<strong>Attention: </strong>All datas are in your backup uncrypted! Please download the files only, if you know what you do!
</p>
<a href="backup.php">Download all files</a>
</div>
<h3>Destroy</h3>
<div>
<p>
You can destroy all data on picosafe. Be carefull with this option!
</p>
<a href="https://destroy.php">Start to destroy data</a>

</div>
</div>
</div>
