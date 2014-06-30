<?php

class Script 
{

  function Script(&$app)
  {
    $this->app=&$app; 
  
    $this->app->ActionHandlerInit($this);

    $this->app->ActionHandler("list","ScriptList");
  
    $this->app->DefaultActionHandler("list");

    
    $this->app->Tpl->ReadTemplatesFromPath("./pages/content/");

    $this->app->ActionHandlerListen(&$app);
  }



  function ScriptList()
  {
    $this->app->Tpl->Set(KURZUEBERSCHRIFT,"Ihre Startseite");
    $this->app->Tpl->Set(KURZUEBERSCHRIFT2,"[BENUTZER]");

    $this->app->Tpl->Set(TABTEXT,"Skript Editor");
    $this->app->Tpl->Parse(TAB1,"scripteditor.tpl");
    $this->app->Tpl->Parse(PAGE,"tabview.tpl");
  }

  function ScriptInfo()
  {

    $this->app->Tpl->Set(KURZUEBERSCHRIFT,"Ihre Startseite");
    $this->app->Tpl->Set(KURZUEBERSCHRIFT2,"[BENUTZER]");

    $this->app->Tpl->Set(TABTEXT,"Info");
    $this->app->Tpl->Set(TAB1,"Infotext");
    $this->app->Tpl->Parse(PAGE,"tabview.tpl");
  }
}
?>
