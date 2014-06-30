<?php

class Login
{

  function Login(&$app)
  {
    $this->app=&$app; 
  
    $this->app->ActionHandlerInit($this);

    $this->app->ActionHandler("list","LoginList");
  
    $this->app->DefaultActionHandler("list");

    
    $this->app->Tpl->ReadTemplatesFromPath("./pages/content/");

    $this->app->ActionHandlerListen(&$app);
  }



  function LoginList()
  {
    $this->app->Tpl->Set(UEBERSCHRIFT,"Login");
    $this->app->Tpl->Parse(PAGE,"login.tpl");

  }

}
?>
