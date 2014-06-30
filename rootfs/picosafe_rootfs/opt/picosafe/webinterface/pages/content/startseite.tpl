<center>
<table height="400" border="0">
<tr valign="top"><td>
<h4>Main menu</h4>
<br><br>
Manage your Picosafe: Easy with your browser.
<br><br><br><br>
<img width="400" src="./themes/fredgui/images/picosafe_splash.jpg">
<br>
<br>
<h4>	
Full utilization
</h4>

<table>
<tr><td width="200">Security level:</td><td><font color="green">no messages</font></td></tr>
<tr><td width="200">Disk:</td><td>from [DISKSIZE] are [DISKFREE] free</td></tr>
<tr><td width="200">CPU load:</td><td>[CPULOAD] <i>(normally under 2.5)</i></td></tr>
</table>
</td><td>
<h4>Internet connection</h4>
<br><br>
1. To share your local internet connection type (or copy) this in your console:
<br>
<br>
<div style="word-wrap:break-word; width:300px;">
 sudo su -c 'echo 1 > /proc/sys/net/ipv4/ip_forward && iptables -P FORWARD ACCEPT && iptables -A POSTROUTING -t nat -j MASQUERADE -s 172.24.42.0/24'
</div>
<br>
<br>
or put this to a start script.
<br>
<br>
<br>
<br>

2. Connect Picosafe to the internet
<br><br>
<table><tr><td>Status: [NETWORK]</td><td>
<form action="" method="post"><input type="submit" name="submit" value="[BUTTON]"></form>
</td></tr></table>

</td></tr></table>

</center>
