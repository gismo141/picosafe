<?php

class Rfid
{

  function Rfid(&$app,$gui=true)
  {
    if(!$gui)
      return;

    $this->app=&$app; 
  
    $this->app->ActionHandlerInit($this);

    $this->app->ActionHandler("list","RfidList");
  
    $this->app->DefaultActionHandler("list");

    $this->app->Tpl->ReadTemplatesFromPath("./pages/content/");

    $this->app->ActionHandlerListen(&$app);
  }

  function Configuration()
  {
    $conf = array();
    $conf['login'] = "pin";

    return $conf;
  }

  function StartPrivate($pin="",$murmel="")
  {
    echo "starte rfid private mit p $pin und m $murmel\n";
    return 1;
  }

  function StartPublic($pin="",$murmel="")
  {
    echo "starte rfid public mit p $pin und m $murmel\n";
    return 1;
  }


  function RfidList()
  {
    $this->app->Tpl->Set(UEBERSCHRIFT,"RFID");

    $output = shell_exec("pkcs15-tool --dump");

    $this->app->Tpl->Set(RFID,$output);

    $this->app->Tpl->Parse(PAGE,"rfid.tpl");
  }

}
?>
