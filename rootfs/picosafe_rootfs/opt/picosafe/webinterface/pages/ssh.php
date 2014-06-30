<?php

class Ssh
{

  function Ssh(&$app)
  {
    $this->app=&$app;
        
    $this->app->ActionHandlerInit($this);
            
    $this->app->ActionHandler("list","SshList");
                
    $this->app->DefaultActionHandler("list");
                    
    $this->app->Tpl->ReadTemplatesFromPath("./pages/content/");
                        
    $this->app->ActionHandlerListen(&$app);
  }
                              
    

  function SshList()
  {
    $cmd = $this->app->Secure->GetPOST("cmd");
    $msg = $this->app->Secure->GetGET("msg");

		if($msg!="")
    {
    	$this->app->Tpl->Set(MESSAGE_TEXT,base64_decode($msg));
    	$this->app->Tpl->Parse(MESSAGE,"highlight.tpl");
		}

	  if($cmd=="saveconfig") {
      $sshconfig = $this->app->Secure->GetPOST("sshconfig");
			file_put_contents("/home/picosafe/.ssh/config",$sshconfig);
    }

		$sshconfig = file_get_contents("/home/picosafe/.ssh/config");
		$publickey = file_get_contents("/home/picosafe/.ssh/id_rsa.pub");

		$this->app->Tpl->Set(SSHCONFIG,$sshconfig);
		$this->app->Tpl->Set(PUBLICKEY,$publickey);
		
		$this->app->Tpl->Parse(PAGE,"ssh_list.tpl");
	}


}
?>
                                            
