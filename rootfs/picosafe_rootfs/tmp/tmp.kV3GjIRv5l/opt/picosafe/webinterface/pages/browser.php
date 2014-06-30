<?php

class Browser
{

  function Browser(&$app)
  {
    $this->app=&$app; 
  
    $this->app->ActionHandlerInit($this);

    $this->app->ActionHandler("list","BrowserList");
    $this->app->ActionHandler("window","BrowserWindow");
    $this->app->ActionHandler("offline","BrowserOffline");
  
    $this->app->DefaultActionHandler("list");
    
    $this->app->Tpl->ReadTemplatesFromPath("./pages/content/");
    $this->app->Core->Sidebar();


    $this->app->ActionHandlerListen(&$app);
  }



  function BrowserWindow()
  {
    $url = $this->app->Secure->GetGET("url");
    //$url = "http://www.xcom.de";
    echo shell_exec("links -source https://$url -force-html");
    //echo "HUHU";
    exit;
  }

  function BrowserOffline()
  {
    echo "<br>Keine Netzwerkverbindung vorhanden! Bitte gehen Sie erst online!";
    exit;

  }


  function BrowserList()
  {
    $url = $this->app->Secure->GetGET("url");

    $this->app->Tpl->Set(UEBERSCHRIFT,"Browser");

    if(1)//is_file("/tmp/online"))
      //$startpage = "http://firma.embedded-projects.net";
      $startpage = "http://www.bundesdruckerei.de";
    else
      $startpage = "index.php?module=browser&action=offline";


    if($url!="") $startpage = base64_decode($url);

    $this->app->Tpl->Set(STARTPAGE,$startpage);
    $this->app->Tpl->Parse(PAGE,"browser.tpl");

  }

}
?>
