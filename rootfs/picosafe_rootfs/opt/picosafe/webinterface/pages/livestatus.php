<?php

class Livestatus 
{

  function Livestatus(&$app)
  {
    $this->app=&$app; 
  
    $this->app->ActionHandlerInit($this);

    $this->app->ActionHandler("list","LivestatusList");
    $this->app->ActionHandler("status","LivestatusStatus");
    $this->app->ActionHandler("do","LivestatusDo");
  
    $this->app->DefaultActionHandler("list");

    
    $this->app->Tpl->ReadTemplatesFromPath("./pages/content/");

    $this->app->ActionHandlerListen(&$app);
  }



  function LivestatusList()
  {
    $this->app->Tpl->Set(KURZUEBERSCHRIFT,"Ihre Startseite");
    $this->app->Tpl->Set(KURZUEBERSCHRIFT2,"[BENUTZER]");

    $this->app->Tpl->Set(TABTEXT,"Steckkarten");

    $this->app->Tpl->Set(SLOTNAME,"usbprog");
    $this->app->Tpl->Set(SLOT,"1");
		$this->app->Tpl->Parse(SLOT1,"slot.tpl");

    $this->app->Tpl->Set(SLOTNAME,"DC 2-12V");
    $this->app->Tpl->Set(SLOT,"2");
		$this->app->Tpl->Parse(SLOT2,"slot.tpl");

    $this->app->Tpl->Set(SLOTNAME,"Taster");
    $this->app->Tpl->Set(SLOT,"3");
		$this->app->Tpl->Parse(SLOT3,"slot.tpl");

    $this->app->Tpl->Set(SLOTNAME,"none");
    $this->app->Tpl->Set(SLOT,"4");
		$this->app->Tpl->Parse(SLOT4,"slot.tpl");

    $this->app->Tpl->Set(SLOT,"5");
		$this->app->Tpl->Parse(SLOT5,"slot.tpl");

    $this->app->Tpl->Set(SLOT,"6");
		$this->app->Tpl->Parse(SLOT6,"slot.tpl");

    $this->app->Tpl->Set(SLOT,"7");
    $this->app->Tpl->Parse(SLOT7,"slot.tpl");

    $this->app->Tpl->Parse(TAB1,"livestatus.tpl");




    $this->app->Tpl->Parse(PAGE,"tabview.tpl");
  }

	function LivestatusStatus()
	{
		$info = $this->app->Secure->GetGET("info");
		$slot = $this->app->Secure->GetGET("slot");

		// Which slots are used
		if($info=="usedslots")
		{
			echo json_encode(array(1,2,3,5));
		}

		// Get slot-status
		if($info=="slotstatus")
		{
			if(is_numeric($slot))
				echo json_encode(array('slot'=>'1','power'=>'1','mode'=>'internal'));
			else
				echo json_encode(array(array('slot'=>'1','power'=>'1','mode'=>'internal'),
														 	 array('slot'=>'2','power'=>'1','mode'=>'external'),
														 	 array('slot'=>'3','power'=>'0','mode'=>'internal'),
														 	 array('slot'=>'5','power'=>'0','mode'=>'external')));
		}
		exit;
	}

	function LivestatusDo()
	{
		$do = $this->app->Secure->GetGET("do");
		$slot = $this->app->Secure->GetGET("slot");

		if(is_numeric($slot))
		{
			if($do=='powerOff')
			{
				echo '1';
			}

			if($do=='powerOn')
			{
				echo '1';
			}

			if($do=='internalOn')
			{
				echo '1';
			}

			if($do=='externalOn')
			{
				echo '1';
			}
		}
		exit;
	}

  function LivestatusInfo()
  {

    $this->app->Tpl->Set(KURZUEBERSCHRIFT,"Ihre Startseite");
    $this->app->Tpl->Set(KURZUEBERSCHRIFT2,"[BENUTZER]");

    $this->app->Tpl->Set(TABTEXT,"Info");
    $this->app->Tpl->Set(TAB1,"Infotext");
    $this->app->Tpl->Parse(PAGE,"tabview.tpl");
  }
}
?>
