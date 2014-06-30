<?php

class Boot
{

  function Boot(&$app)
  {
    $this->app=&$app; 
  
    $this->app->ActionHandlerInit($this);

    $this->app->ActionHandler("list","BootList");
  
    $this->app->DefaultActionHandler("list");

    
    $this->app->Tpl->ReadTemplatesFromPath("./pages/content/");

    $this->app->ActionHandlerListen(&$app);
  }



  function BootList()
  {
    $this->app->Tpl->Set(UEBERSCHRIFT,"Live Boot");
    $this->app->Tpl->Parse(PAGE,"boot.tpl");
  }

}
?>
