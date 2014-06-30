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

<img src="./themes/fredgui/images/ssh.jpg" align="left" style="margin:20px"><br><br><h4>SSH Accounts</h4><p>Manage your SSH accounts
<div style="padding-left: 140px; width:400px;">[MESSAGE]</div>
<br>
<br>
<br>
<h4>Your Account</h4>
<hr>
<br>
<div id="accordion-resizer" class="ui-widget-content">

<div id="accordion">


<h3>Overview</h3>
<div>
<h1>Secure SSH dongle</h1>
Picosafe is really just a completely encrypted mini server from which you can very easily but securely connect to other SSH server itself. This surface is actually more of a help, because SSH is used for Picosafe with all original tools on the command line.
<br><br>
<ul>
<li>ssh-agent</li>
<li>ssh</li>
<li>ssh-copy-id</li>
<li>ssh-key-gen</li>
</ul>

<h5>1. Generate first time a key pair (optional with a password)</h5>

If you don't love it to work only with username and password
you can login with an own key pair. This means you have
now to keys.
<bR><br>
<ul><li><b>public key</b> (you can send them other friends and third parties)</li>
<li><b>private key</b> (you are never allowed to give this file someone!)</li>
</ul>
The public key is for the other side of your authentification to
check or send you crypted things. The private key is you 
secret! Be sure that nobody can read this! The best thing
would be if stay the file on picosafe, because picosafe
is 100% crypted and so nobody can reach or read this file.
<br><br>
Additional you can protect you key pair with an passwort
or so called passphrase. This means you can use the files
only if you know the passpharse.


<br><br><pre>ssh-key-gen</pre><br>

<h5>2. Add external ssh servers to your SSH config</h5>

This means you don't have to type every time <i>ssh user@domain.de</i>.
You can put the host, user, port and so on into an config file. Then
you can define a short label. After this you can start a session
with <i>ssh yourlabel</i>. That's it.
<br><br>
Example host in your SSH config:
<br><br><pre>Host youlabel
  User username_on_server
  HostName domain_or_ip
  Post port_on_server 
</pre><br><br>
Further hosts you can put also into this file.
<br><br>
<h5>3. Copy you public key to forgein servers</h5>
If you don't like to be ask every time you log into an
server you can copy your public key on the external server.
Then the server can this to authentifcate you.
<br><br><pre>ssh-copy-id user@domain-or-ip</pre><br><br>
or you can use your label from SSH config:
<br><br><pre>ssh-copy-id youlabel</pre><br><br>
Now you have to write the last time the password. After this
success you can login without a password.
<br><br>

<h5>4. Work with ssh-agent</h5>
If you use an password or passphrase at you keys you need every
time you use the keys this password or passphrase. <i>ssh-agent</i>
is small tool which can start an session for example for two hours.
That means in this time you don't need your password or passphrase
again. Before you start to work type once:

<br><br><pre>exec ssh-agent bash</pre><br><br>
Then put your keys into the hand of the agent:
<br><br><pre>ssh-add</pre><br><br>
And start to work with you ssh accounts.

<br><br>
<h5>Login to server behind servers</h5>
<p>Sometimes a server is behind an central login server. This means you keys must be forward to the
final server. You can enable this freature in you SSH config.
<br><pre>ForwardAgent yes</pre><br><br>

<h5>Proxycommand</h5>
<p>If you want to connect to a computer that is behind another, usually you have to shimmy through successively via SSH to. 
In the SSH config you can do this, however, define once and connect to a short rechnerX ssh directly to the correct server behind other servers.</p>
<pre>Host machine1
  User username
  HostName domain-or-ip-rechner1

Host machine2
  User otherusername
  ProxyCommand ssh -q machine1 nc -q0 domain-or-ip-rechner2 22
</pre>
If one wants to also now not every log times with the password
you can directly with its public key on machine2.
<br><br><pre>ssh-copy-id machine2</pre><br><br>

</div>



<h3>SSH config</h3>
<div>
<form action="" method="post">
<input type="hidden" name="cmd" value="saveconfig">
<textarea cols="100" name="sshconfig" rows="10">[SSHCONFIG]</textarea>
<br>
<br>
<center><input type="submit" value="Save" name="submit"><input type="submit" name="cancel" value="Cancel"></center>
</form>
</div>




<h3>SSH public key</h3>
<div>
<textarea cols="100" rows="10">[PUBLICKEY]</textarea>
<br>
<br>
</div>





</div>
</div>
