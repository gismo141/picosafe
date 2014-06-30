<?php

class Apps
{

  function Apps(&$app)
  {
    $this->app=&$app; 
  
    $this->app->ActionHandlerInit($this);

    $this->app->ActionHandler("list","AppsList");
    $this->app->ActionHandler("demos","AppsDemos");
  
    $this->app->DefaultActionHandler("list");
    
    $this->app->Tpl->ReadTemplatesFromPath("./pages/content/");
    $this->app->Core->Sidebar();


    $this->app->ActionHandlerListen(&$app);
  }


  function AppsDemos()
  {
    $this->app->Tpl->Parse(PAGE,"apps_demos.tpl");
  }

  function AppsList()
  {
    $this->app->Tpl->Parse(PAGE,"apps.tpl");
  }

}
?>
