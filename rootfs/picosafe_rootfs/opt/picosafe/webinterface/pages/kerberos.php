<?php

class Kerberos
{

  function Kerberos(&$app,$gui=true)
  {
    if(!$gui)
      return;

    $this->app=&$app; 
  
    $this->app->ActionHandlerInit($this);

    $this->app->ActionHandler("list","KerberosList");
  
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
    echo "starte kerberos private mit p $pin und m $murmel\n";
    return 1;
  }

  function StartPublic($pin="",$murmel="")
  {
    echo "starte kerberos public mit p $pin und m $murmel\n";
    return 1;
  }


  function KerberosList()
  {
    if($this->app->Secure->GetPOST("kdestroy")!="")
      exec("kdestroy");
    if($this->app->Secure->GetPOST("kinit")!="")
      exec("kinit ".$this->app->Secure->GetPOST("principal"));



    $this->app->Tpl->Set(UEBERSCHRIFT,"Kerberos");

    ob_start(); // start trapping output
    passthru("klist");
    $content_grabbed=ob_get_contents();
    ob_end_clean(); // discard trapped output and stop trapping

    $this->app->Tpl->Set(KLIST,$content_grabbed);

    $this->app->Tpl->Parse(PAGE,"kerberos.tpl");
  }

}
?>
