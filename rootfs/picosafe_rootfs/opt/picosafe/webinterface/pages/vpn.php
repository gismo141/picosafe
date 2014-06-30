<?php

class Vpn
{

  function Vpn(&$app)
  {
    $this->app=&$app; 
  
    $this->app->ActionHandlerInit($this);

    $this->app->ActionHandler("list","VpnList");
  
    $this->app->DefaultActionHandler("list");
    
    $this->app->Tpl->ReadTemplatesFromPath("./pages/content/");

    $this->app->ActionHandlerListen(&$app);
  }


  function VpnList()
  {

    $this->app->Tpl->Set(UEBERSCHRIFT,"VPN-Verbindung");
    $this->app->Tpl->Parse(PAGE,"vpn.tpl");

  }

}
?>
