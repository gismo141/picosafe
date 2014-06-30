<?php

class Email
{

  function Email(&$app)
  {
    $this->app=&$app; 
  
    $this->app->ActionHandlerInit($this);

    $this->app->ActionHandler("list","EmailList");
  
    $this->app->DefaultActionHandler("list");

    
    $this->app->Tpl->ReadTemplatesFromPath("./pages/content/");

    $this->app->ActionHandlerListen(&$app);
  }



  function EmailList()
  {
    $this->app->Tpl->Set(UEBERSCHRIFT,"E-Mail");
    $this->app->Tpl->Parse(PAGE,"email.tpl");

  }

}
?>
