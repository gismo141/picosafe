<script type="text/javascript">
function copyToClipboard(text)
{
  window.prompt ("Copy to clipboard: Ctrl+C, Enter", text);
}

$(function() {
$( "input[type=submit], a.button, button" )
.button()
.click(function( event ) {
event.preventDefault();
});
});


function open_in_new_tab(url )
{
  var win=window.open(url, '_blank');
  win.focus();
}

function open_in_new_tab_anonym(urlbase64 )
{
  var win=window.open('proxy/index.php?q='+urlbase64, '_blank');
  win.focus();
}

</script>

<img src="./themes/fredgui/images/passwordsafe.jpg" align="left" style="margin:20px"><br><br><h4>Password safe</h4><p>Manage your passwords and secret accounts
<div style="padding-left: 140px; width:400px;">[MESSAGE]</div>
<br>
<br>
<br>
<h4>Your Account</h4>
<hr>
<br>
<form action="" method="post" name="password_form">
<table>
<tr><td>Account:</td><td><input type="text" size="30" name="account" value="[ACCOUNT]"></td><td rowspan="6" width="40%">

<button style="width:170px" onclick="document.forms['password_form'].submit();">Save</button><br><br>
<button style="width:170px" onclick="if(!confirm('Really delete?')) return false; else window.location.href='index.php?module=passwordsafe&action=delete&id=[ID]&cmd=delete';">Delete</button><br><br>
<br><br>
<a class="button" onclick="open_in_new_tab('[URL]')" style="width:170px">Open URL</a><br><br>
<a class="button" onclick="open_in_new_tab_anonym('[URLBASE64]')" style="width:170px">Open Anonym Browser</a><br><br>
<a class="button" style="width:170px" onclick="copyToClipboard(document.getElementById('externalpassword').value);">Copy to Clipboard</a><br><br>
<!--<button style="width:170px">Send as Keyboard</button><br><br>--><br><br>
<button style="width:170px" onclick="window.location.href='index.php?module=passwordsafe&action=list'">Back to List</button>

</td></tr>
<tr><td>Description:</td><td><input type="text"  size="30" name="description" value="[DESCRIPTION]"></td></tr>
<tr><td>Login:</td><td><input type="text" size="30" name="externallogin" value="[EXTERNALLOGIN]"></td></tr>
<tr><td>Password:</td><td><input type="text" size="30" name="externalpassword" id="externalpassword" value="[EXTERNALPASSWORD]"></td></tr>
<tr><td>URL:</td><td><input type="text" size="30" name="url" value="[URL]"></td></tr>
<tr><td>Comments:</td><td><textarea rows="10" cols="40" name="comments">[COMMENTS]</textarea></td></tr>
</table>
<input type="hidden" name="cmd" value="update">
</form>


