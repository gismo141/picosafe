<?php

class Motp
{

  function Motp(&$app)
  {
    $this->app=&$app;
        
    $this->app->ActionHandlerInit($this);
            
    $this->app->ActionHandler("list","MotpList");
                
    $this->app->DefaultActionHandler("list");
                    
                    
    $this->app->Tpl->ReadTemplatesFromPath("./pages/content/");
                        
    $this->app->ActionHandlerListen(&$app);
  }
                              
                              
                              
  function MotpList()
  {

    $this->app->Tpl->Set(UEBERSCHRIFT,"mOTP Generator");


    $submit = $this->app->Secure->GetPOST("submit");
    if($submit!="")
    {
       $pin = $this->app->Secure->GetPOST("pin");
       $secret = $this->app->Secure->GetPOST("secret");
	$this->app->Tpl->Set(MESSAGE,'<div class="ui-state-highlight ui-corner-all" style="padding: 0 .7em;"> 
  		<p><span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span> 
  		<strong>Hinweis:</strong>Die neue PIN und das neue Secret wurden gespeichert!</p>
  		</div>');

      $tmp = new INI();
      $arr = $tmp->read("/opt/fred/apps/motp/motp.ini");
      $arr[motp][secret]=$secret;
      $arr[motp][pin]=$pin;
      $tmp->write("/opt/fred/apps/motp/motp.ini",$arr);

//        exec("echo '$pin' > /root/otppin");
//        exec("echo '$secret' > /root/otpsecret");
    } 

      $tmp = new INI();
    $arr = $tmp->read("/opt/fred/apps/motp/motp.ini");


    //$pin = shell_exec("cat /root/otppin");
    $this->app->Tpl->Set(PIN,$arr[motp][pin]);
    //$secret = shell_exec("cat /root/otpsecret");

    $this->app->Tpl->Set(SECRET,$arr[motp][secret]);

    date_default_timezone_set('UTC');
    
    $uhrzeit = date('d.m.Y H:i:s');
    $this->app->Tpl->Set(UHRZEIT,$uhrzeit);
  
    $this->app->Tpl->Parse(UEBERSCHRIFT,"mOTP");
    $this->app->Tpl->Parse(PAGE,"motp.tpl");
  }
}
?>
                                            
