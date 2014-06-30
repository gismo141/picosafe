<?php

class Welcome 
{

  function Welcome(&$app)
  {
    $this->app=&$app; 
  
    $this->app->ActionHandlerInit($this);

    $this->app->ActionHandler("start","WelcomeStart");
    $this->app->ActionHandler("info","WelcomeInfo");
    $this->app->ActionHandler("lock","WelcomeLock");
  
    $this->app->DefaultActionHandler("start");

    
    $this->app->Tpl->ReadTemplatesFromPath("./pages/content/");

    $this->app->ActionHandlerListen(&$app);
  }

	function Sidebar() 
	{
//		$this->app->Tpl->Set('SIDEBAR_TITLE', 'Home');
//		$this->app->Core->BuildSidebar();
	}
 function FreeSpace($disc)
  {
    if($disc=='') return;

    $output = '';
    exec('df '.$disc, $output);

    if($output[1]!='') {
      $size = substr($output[1], strlen($disc), strlen($output[1])-strlen($disc));
      preg_match_all("/[0-9]+/", $size, $matches);

      return $matches[0][2];
    }
  }

  function TotalSpace($disc)
  {
    if($disc=='') return;

    $output = '';
    exec('df '.$disc, $output);

    if($output[1]!='') {
      $size = substr($output[1], strlen($disc), strlen($output[1])-strlen($disc));
      preg_match_all("/[0-9]+/", $size, $matches);

      return $matches[0][0];
    }
  }



  function WelcomeStart()
  {
		//$this->Sidebar();
    //$this->app->Tpl->Set(UEBERSCHRIFT,"Ihre Startseite");

		file_put_contents("/opt/picosafe/settings/ip_host",$_SERVER['REMOTE_ADDR']);	

 /*   $temperatur = $this->app->lua->SingleCommand("rtc_get_temperature()");
    $this->app->Tpl->Set(TEMPERATUR,$temperatur);

    $akku = $this->app->lua->SingleCommand("voltage_battery_get()");
    $akku = sprintf("%01.2f",((2.56/1024)*$akku)*2);
    $this->app->Tpl->Set(AKKU,$akku);

    $usb = $this->app->lua->SingleCommand("voltage_usb_get()");
    $usb = sprintf("%01.2f",((3.7/1024)*$usb)*2);
    $this->app->Tpl->Set(USB,$usb);

    $curfree = $this->app->lua->SingleCommand("avr_cur_free_ram()");
    $this->app->Tpl->Set(CURFREE,$curfree);

    $minfree = $this->app->lua->SingleCommand("avr_min_free_ram()");
    $this->app->Tpl->Set(MINFREE,$minfree);
*/

	$submit = $this->app->Secure->GetPOST("submit");



	$ip_host= file_get_contents("/opt/picosafe/settings/ip_host");
	if($submit=="Disconnect")
		exec("sudo route del default gw $ip_host");

	if($submit=="Connect")
		exec("sudo route add default gw $ip_host");
	
  if ($this->app->Core->OnlineCheck()) {
    $this->app->Tpl->Set(NETWORK,"<FONT COLOR=#009900><B>ONLINE</B></FONT>");
    $this->app->Tpl->Set(NETWORKMAIN,"<FONT COLOR=#009900 style=\"border:1px solid white; border-radius:4px; background-color:white;\">&nbsp;<B>ONLINE</B>&nbsp;</FONT>");
    $this->app->Tpl->Set(BUTTON,"Disconnect");
  } else {
    $this->app->Tpl->Set(NETWORK,"<FONT COLOR=#DD0000><B>OFFLINE</B></FONT>");
    $this->app->Tpl->Set(NETWORKMAIN,"<FONT COLOR=#DD0000 style=\"border:1px solid white; border-radius:4px; background-color:white;\">&nbsp;<B>OFFLINE</B>&nbsp;</FONT>");
    $this->app->Tpl->Set(BUTTON,"Connect");
  }


   $this->app->Tpl->Set(DISKFREE,exec("df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $4 }' | head -n 1"));
   $this->app->Tpl->Set(DISKSIZE,exec("df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $2 }' | head -n 1"));
	 $cpuload = exec("cat /proc/loadavg");
   $cpuload = substr($cpuload,4,6);
   $this->app->Tpl->Set(CPULOAD,$cpuload);



    $this->app->Tpl->Parse(PAGE,"startseite.tpl");
  }

  function WelcomeLock()
  {
		$password = $this->app->Secure->GetPOST("password");
		$unlock = $this->app->Secure->GetPOST("unlock");
		system("touch /home/picosafe/.webguilock");
	  $counter = file_get_contents("/home/picosafe/.webguilock");

		if($unlock!="")
		{
			// increase counter
			if(!is_numeric($counter))$counter=1;
			else $counter++;
			file_put_contents("/home/picosafe/.webguilock",$counter);
			
			$lockpassword = file_get_contents("/opt/picosafe/settings/lockpassword");	
			if(md5($password)==trim($lockpassword))
			{
				unlink("/home/picosafe/.webguilock");
				header("Location: index.php");
				exit;
			}
		}

		if($counter >= 1) {
			$this->app->Tpl->Set(RETRIES,"<br><br><font color=\"red\"><b>Attention: $counter wrong retries before!</b></font><br><br>");
		}

    $this->app->Tpl->Parse(PAGE,"welcome_lock.tpl");
  }

  function WelcomeInfo()
  {

    $this->app->Tpl->Set(KURZUEBERSCHRIFT,"Ihre Startseite");
    $this->app->Tpl->Set(KURZUEBERSCHRIFT2,"[BENUTZER]");

    $this->app->Tpl->Set(TABTEXT,"Info");
    $this->app->Tpl->Set(TAB1,"Infotext");
    $this->app->Tpl->Parse(PAGE,"tabview.tpl");
  }
}
?>
