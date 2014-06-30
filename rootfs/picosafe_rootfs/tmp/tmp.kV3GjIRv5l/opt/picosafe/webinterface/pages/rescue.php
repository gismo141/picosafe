<?php

class Rescue
{

  function Rescue(&$app)
  {
    $this->app=&$app; 
  
    $this->app->ActionHandlerInit($this);

    $this->app->ActionHandler("list","RescueList");
    $this->app->ActionHandler("pin","RescuePIN");
  
    $this->app->DefaultActionHandler("list");

    
    $this->app->Tpl->ReadTemplatesFromPath("./pages/content/");

    $this->app->ActionHandlerListen(&$app);
  }


  function RescuePIN()
  {
    $this->app->Tpl->Parse(PAGE,"rescue_good.tpl");
  }
  
  function RescueList()
  {
    $countpin = $this->app->lua->SingleCommand("ct_get_tries_pin()");
    $countpuk = $this->app->lua->SingleCommand("ct_get_tries_puk()");
  	
    $enterpuk = $this->app->Secure->GetPOST("enterpuk");
    $puk = $this->app->Secure->GetPOST("puk");
    $shutdown = $this->app->Secure->GetPOST("shutdown");
    $this->app->Tpl->Set(UEBERSCHRIFT,"Rescue");
    
    $this->app->Tpl->Set(COUNTPUK,$countpuk);

    if($countpin > 0)
    {
   	// bitte pin eingeben! 
      $this->app->Tpl->Parse(PAGE,"rescue_open.tpl");
    } 
    else if($countpuk>0)
    {

      if($enterpuk!="" && $puk!="" && is_numeric($puk) && $puk >= 0)
      {
   	//TODO unlock
        $this->app->lua->SingleCommand("ct_verify_puk($puk)");
        $this->app->lua->SingleCommand("ct_reset_pin()");
        $this->app->lua->SingleCommand("ct_verify_pin(0000)");
        $this->app->lua->SingleCommand("ct_set_pin(1234)");
   	header("Location: index.php?module=rescue&action=list");
   	exit;
      } else if ($enterpuk!="" || $puk!="")
      {
  	$this->app->Tpl->Set(WARNPUK,'<div class="ui-state-error ui-corner-all" style="padding: 0 .7em;">
          <p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
                  <strong>Achtung:</strong> Die PUK besteht nur aus Ziffern!</p>                                
                          </div>');       
      
      }
    
    
      if($countpuk==1)
      {
      $this->app->Tpl->Set(WARNPUK,'<div class="ui-state-error ui-corner-all" style="padding: 0 .7em;">
        <p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
        <strong>Achtung:</strong> Sie haben nur noch einen Versuch!</p>
        </div>');
                                                                                                                                                                                                                                                                                                                             
      }
      $this->app->Tpl->Parse(PAGE,"rescue.tpl");
    } else {
      $this->app->Tpl->Parse(PAGE,"rescue_locked.tpl");
    }
  }

}
?>
