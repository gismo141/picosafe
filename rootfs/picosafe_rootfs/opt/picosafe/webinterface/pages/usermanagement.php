<?php

class Usermanagement 
{

  function Usermanagement(&$app)
  {
    $this->app=&$app; 
  
    $this->app->ActionHandlerInit($this);

    $this->app->ActionHandler("list","UsermanagementList");
    $this->app->ActionHandler("info","UsermanagementInfo");
  
    $this->app->DefaultActionHandler("start");

    
    $this->app->Tpl->ReadTemplatesFromPath("./pages/content/");

    $this->app->ActionHandlerListen(&$app);
  }



  function UsermanagementList()
  {

    $this->app->Tpl->Set(KURZUEBERSCHRIFT,"Ihre Startseite");
    $this->app->Tpl->Set(KURZUEBERSCHRIFT2,"[BENUTZER]");

    $this->app->Tpl->Set(TABTEXT,"Benutzer Verwaltung");
    $this->app->Tpl->Parse(TAB1,"usermanagement.tpl");
    $this->app->Tpl->Parse(PAGE,"tabview.tpl");
  }

  function UsermanagementInfo()
  {

    $this->app->Tpl->Set(KURZUEBERSCHRIFT,"Ihre Startseite");
    $this->app->Tpl->Set(KURZUEBERSCHRIFT2,"[BENUTZER]");

    $this->app->Tpl->Set(TABTEXT,"Info");
    $this->app->Tpl->Set(TAB1,"Infotext");
    $this->app->Tpl->Parse(PAGE,"tabview.tpl");
  }
}
?>
