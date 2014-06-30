<?php

class Phone
{

  function Phone(&$app)
  {
    $this->app=&$app; 
  
    $this->app->ActionHandlerInit($this);

    $this->app->ActionHandler("list","PhoneList");
  
    $this->app->DefaultActionHandler("list");

    
    $this->app->Tpl->ReadTemplatesFromPath("./pages/content/");

    $this->app->ActionHandlerListen(&$app);
  }



  function PhoneList()
  {

    $this->app->Tpl->Set(UEBERSCHRIFT,"VoIP");
    $this->app->Tpl->Parse(PAGE,"phone.tpl");

  }

}
?>
