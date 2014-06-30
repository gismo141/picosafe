<?php

class Settings
{

  function Settings(&$app)
  {
    $this->app=&$app; 
  
    $this->app->ActionHandlerInit($this);

    $this->app->ActionHandler("list","SettingsList");
    $this->app->ActionHandler("sshstart","SettingsSSHStart");
    $this->app->ActionHandler("sshstop","SettingsSSHStop");
  
    $this->app->DefaultActionHandler("list");

    
    $this->app->Tpl->ReadTemplatesFromPath("./pages/content/");

    $this->app->ActionHandlerListen(&$app);
  }



  function SettingsList()
  {
    $submit = $this->app->Secure->GetPOST("submit");
    $cmd = $this->app->Secure->GetPOST("cmd");

//    date_default_timezone_set('UTC');

    if($submit!="")
    {
			switch($cmd)
			{
				case "general":

      		$date = $this->app->Secure->GetPOST("date");
      		$hour = $this->app->Secure->GetPOST("hour");
      		$minute = $this->app->Secure->GetPOST("minute");
      		$seconds = $this->app->Secure->GetPOST("seconds");
      		$shutdown = $this->app->Secure->GetPOST("shutdown");
      		$url = $this->app->Secure->GetPOST("url");
      		$network_check = $this->app->Secure->GetPOST("network_check");

      		$arrdatum = split('\-',$date);
					if(is_numeric($shutdown) && $shutdown > 0)
						file_put_contents("/opt/picosafe/settings/timeout",$shutdown);

					file_put_contents("/opt/picosafe/settings/url",$url);
					file_put_contents("/opt/picosafe/settings/network_check",$network_check);

      		$timestamp = mktime($hour,$minute,$seconds,$arrdatum[1],$arrdatum[0],$arrdatum[2]);
      		//exec("sudo date -u -s \"{$arrdatum[0]}-{$arrdatum[1]}-$arrdatum[2] {$hour}:{$minute}:{$seconds}\"");
      		exec("sudo date -s \"{$arrdatum[0]}-{$arrdatum[1]}-$arrdatum[2] {$hour}:{$minute}:{$seconds}\"");
      		exec("sudo hwclock --systohc");
				break;

				case "lockpassword":
      		$password = $this->app->Secure->GetPOST("password");
      		$repassword = $this->app->Secure->GetPOST("repassword");

					if($password==$repassword && $password!="")
					{
						file_put_contents("/opt/picosafe/settings/lockpassword",md5($password));
					} else {
						$this->app->Tpl->Set(MESSAGE,"<font color=red>Please type both times the same password!</font><br><br>");
					}

				break;
			}

    }

    // Die Standard-Zeitzone, die verwendet werden soll, setzen.
    $date = date('Y-m-d'); 
    $hour = date('H'); 
    $minute = date('i'); 
    $seconds = date('s'); 

		$shutdown = file_get_contents("/opt/picosafe/settings/timeout");
		$url = file_get_contents("/opt/picosafe/settings/url");
		$network_check = file_get_contents("/opt/picosafe/settings/network_check");
  
    $this->app->Tpl->Set(DATE,$date);
    $this->app->Tpl->Set(HOUR,$hour);
    $this->app->Tpl->Set(MINUTE,$minute);
    $this->app->Tpl->Set(SECONDS,$seconds);

    $this->app->Tpl->Set(SHUTDOWN,$shutdown);
    $this->app->Tpl->Set(URL,$url);
    $this->app->Tpl->Set(NETWORKCHECK,$network_check);

    $this->app->Tpl->Parse(PAGE,"settings.tpl");
  }
  
  function SettingsSSHStart()                                                                                                                          
  {                                                   
    exec("/opt/fred/init.d/sshd start");                       
    $this->SettingsList();
  } 
  
  function SettingsSSHStop()
  {
    exec("/opt/fred/init.d/sshd stop");                            
    $this->SettingsList();         
  }    
  	                                                                                                                                                                                               

}
?>
