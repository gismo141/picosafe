<?php

class Filebrowser
{
  function Filebrowser(&$app)
  {
    $this->app=&$app; 
  
    $this->app->ActionHandlerInit($this);

    $this->app->ActionHandler('list', 'FilebrowserList');
  
    $this->app->DefaultActionHandler("list");

    $this->app->ActionHandlerListen(&$app);
  }


  function FilebrowserList()
  {
		$path = $_GET['path'];
		
		$this->app->Tpl->Set('PATH', $path);

    $this->app->Tpl->Parse(PAGE, 'filebrowser_list.tpl');
  }
}
?>
