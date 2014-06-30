<?php

class Header 
{

  function Header(&$app)
  {
    $this->app=&$app; 
  
    $this->app->ActionHandlerInit($this);

    $this->app->ActionHandler("list","HeaderList");
    $this->app->ActionHandler("nav","HeaderNav");
    $this->app->ActionHandler("route","HeaderRoute");
    $this->app->ActionHandler("check","HeaderCheck");
    $this->app->ActionHandler("delroute","HeaderDelRoute");
    $this->app->ActionHandler("poweroff","HeaderPoweroff");
    $this->app->ActionHandler("reallypoweroff","HeaderReallyPoweroff");
  
    $this->app->DefaultActionHandler("list");

    
    $this->app->Tpl->ReadTemplatesFromPath("./pages/content/");

    $this->app->ActionHandlerListen(&$app);
  }

  function ping($host, $timeout = 1) {
                /* ICMP ping packet with a pre-calculated checksum */
                $package = "\x08\x00\x7d\x4b\x00\x00\x00\x00PingHost";
                $socket  = socket_create(AF_INET, SOCK_RAW, 1);
                socket_set_option($socket, SOL_SOCKET, SO_RCVTIMEO, array('sec' => $timeout, 'usec' => 0));
                socket_connect($socket, $host, null);

                $ts = microtime(true);
                socket_send($socket, $package, strLen($package), 0);
                if (socket_read($socket, 255))
                        $result = microtime(true) - $ts;
                else    $result = false;
                socket_close($socket);

                return $result;
        }


  function HeaderCheck()
  {

    if($this->ping("8.8.8.8",1))
    {
    echo "<img src=\"./themes/fredgui/images/network-online.png\" height=\"20\" title=\"Verbindung in das Internet besteht\">";
    exec("touch /tmp/online");
    }
    else
    {
    echo "<img src=\"./themes/fredgui/images/network-offline.png\" height=\"20\" title=\"Keine Verbindung in das Internet\">";
    exec("rm /tmp/online");
    }
    exit;
  }


	function HeaderNav()
	{
		echo "<table cellpadding=\"1\" height=\"30%\">";
		echo "<tr><td><a href=\"index.php?module=safe&action=list\" target=\"content\"><img src=\"./themes/fredgui/images/hard-disk.png\" width=\"40px\" title=\"Storage\"></a></td></tr>";
		echo "<tr><td><a href=\"index.php?module=password&action=list\" target=\"content\"><img src=\"./themes/fredgui/images/password.png\" title=\"Password Safe\"width=\"40px\"></a></td></tr>";
		echo "<tr><td><a href=\"index.php?module=wiki&action=list\" target=\"content\"><img src=\"./themes/fredgui/images/wiki.png\" title=\"Wiki\"width=\"40px\"></a></td></tr>";
		echo "<tr><td><a href=\"index.php?module=settings&action=list\" target=\"content\"><img src=\"./themes/fredgui/images/preferences.png\" width=\"40px\" title=\"Preferences\"></a></td></tr>";
		echo "<tr><td><a href=\"index.php\" target=\"content\"><img src=\"./themes/fredgui/images/home.png\" title=\"Home\" width=\"40px\"></a></td></tr>";
		echo "</table>";
		exit;
	}

  function HeaderList()
  {
    //$this->app->Tpl->Set(PAGE,"Ihr Header");
    echo "<table width=\"100%\" border=\"0\"><tr><td><a href=\"index.php\" target=\"content\"><img src=\"./themes/fredgui/images/logo.png\" height=\"25\" border=\"0\"></a>
        </td><td align=\"right\"><!--Status: <img src=\"./themes/fredgui/images/wireless.png\" height=\"25\" title=\"WLAN Adapter gefunden\">  <img src=\"./themes/fredgui/images/rfid.png\" height=\"35\" title=\"RFID Leser gefunden\">


        <img src=\"./themes/fredgui/images/keyboard.png\" height=\"25\">-->
<link type=\"text/css\" href=\"./themes/fredgui/css/blitzer/jquery-ui-1.8.18.custom.css\" rel=\"Stylesheet\" />  
<script type=\"text/javascript\" src=\"./js/jquery-1.7.1.min.js\"></script>
<script type=\"text/javascript\" src=\"./js/jquery-ui-1.8.18.custom.min.js\"></script>

<script>

var refreshId = setInterval(function()
{
     $('#check').fadeTo(\"fast\").load('index.php?module=header&action=check&ajax=true');
}, 2000);
</script>

<div id=\"check\"></div></td><td align=\"right\" width=\"100\">
<a href=\"index.php?module=header&action=reallypoweroff\" target=\"content\"><img src=\"./themes/fredgui/images/power.png\" title=\"Picosafe ausschalten\" height=\"35\" border=\"0\">
        </a>  </td><td width=\"20\">&nbsp;</td></tr>";
    //$this->app->BuildNav=false;
    exit;

  }
 

  function HeaderList2()
  {

    //$this->app->Tpl->Set(PAGE,"Ihr Header");
    echo "<table width=\"100%\"><tr><td><a href=\"index.php\" target=\"content\"><img src=\"./themes/fredgui/images/logo.gif\"  border=\"0\"></a>
        </td><td align=\"right\">Status: <img src=\"./themes/fredgui/images/wireless.png\" height=\"25\" title=\"WLAN Adapter gefunden\">  <img src=\"./themes/fredgui/images/rfid.png\" height=\"35\" title=\"RFID Leser gefunden\">
        <img src=\"./themes/fredgui/images/keyboard.png\" height=\"25\"> | Aktionen: 

<link type=\"text/css\" href=\"./themes/fredgui/css/blitzer/jquery-ui-1.8.18.custom.css\" rel=\"Stylesheet\" />  
<script type=\"text/javascript\" src=\"./js/jquery-1.7.1.min.js\"></script>
<script type=\"text/javascript\" src=\"./js/jquery-ui-1.8.18.custom.min.js\"></script>

<script type=\"text/javascript\"  src=\"./js/jquery.dataTables.min.js\"></script>


<script type=\"text/javascript\">
$(document).ready(function() {
$('div#thedialog').dialog({ autoOpen: false })
$('#thelink').click(function(){ $('div#thedialog').dialog('open'); });
})
    </script>

<div id=\"thedialog\" title=\"Download complete\">
    <p>
        <span class=\"ui-icon ui-icon-circle-check\" style=\"float:left; margin:0 7px 50px 0;\"></span>
        Your files have downloaded successfully into the My Downloads folder.
    </p>
    <p>
        Currently using <b>36% of your storage space</b>.
    </p>
</div>

<a href=\"#\" id=\"thelink\">Clickme</a>



<a href=\"index.php?module=header&action=poweroff\"><img src=\"./themes/fredgui/images/poweroff.png\" title=\"FRED ausschalten\" height=\"25\" border=\"0\">
        </a>  </td></tr>";
    //$this->app->BuildNav=false;
    exit;

  }
 

  function HeaderReallyPoweroff()
  {
    $this->app->Tpl->Set(PAGE,"

  <script>
  $(function() {
    // a workaround for a flaw in the demo system (http://dev.jqueryui.com/ticket/4375), ignore!
    $( \"#dialog:ui-dialog\" ).dialog( \"destroy\" );
  
    $( \"#dialog-confirm\" ).dialog({
      resizable: false,
      autoOpen: true,
      height:170,
      modal: true,
      buttons: {
	\"FRED ausschalten\": function() {
	  $( this ).dialog( \"close\" );
          $.get('http://10.0.0.1/index.php?module=header&action=poweroff',function(data,status) { },'html');

	  
	},
	\"Abbrechen\": function() {
	  $( this ).dialog( \"close\" );
	}
      }
    });
  });
  </script>

<div id=\"dialog-confirm\" title=\"FRED jetzt ausschalten?\">
  <p><span class=\"ui-icon ui-icon-alert\" style=\"float:left; margin:0 7px 20px 0;\"></span>Soll FRED jetzt wirklich ausgeschaltet werden?</p>
</div>


");

  }
 
  function HeaderPoweroff()
  {
      //$tmp = new LUA();
      //$tmp->Add("fred:shutdown()");
      //$tmp->Run();
      //exec("/opt/fred/shutdown.sh");
  }
  
  
  
  function HeaderRoute()
  {
 	$ip = $_SERVER[REMOTE_ADDR];
 	exec("echo 'nameserver 8.8.8.8' > /etc/resolv.conf");
 	exec("route add default gw $ip");
 	exec("cp /etc/hosts /etc/hosts_org");
 	exec("echo '$ip	fredhost' >> /etc/hosts");
 	header("Location: http://10.0.0.1/index.html");
 	
 	exit; 
  }
  
  
    function HeaderDelRoute()
      {                                      
              $ip = $_SERVER[REMOTE_ADDR];
                      exec("echo 'nameserver 8.8.8.8' > /etc/resolv.conf");
                              exec("route delete default gw $ip");            
                                      header("Location: http://10.0.0.1/index.html");    
                                       
                                               exit;                                
                                                 }
                                                 

}
?>
