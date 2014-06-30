<?php


class Npa
{

  function Npa(&$app,$gui=true)
  {
    if(!$gui)
      return;

    $this->app=&$app; 
  
    $this->app->ActionHandlerInit($this);

    $this->app->ActionHandler("list","NpaList");
    $this->app->ActionHandler("rfidleser","NpaRFIDLeser");
  
    $this->app->DefaultActionHandler("list");

    $this->app->Tpl->ReadTemplatesFromPath("./pages/content/");

    $this->app->ActionHandlerListen(&$app);
  }

  function Configuration()
  {
    $conf = array();
    $conf['login'] = "pin";

    return $conf;
  }

  function StartPrivate($pin="",$murmel="")
  {
    echo "starte npa private mit p $pin und m $murmel\n";
    return 1;
  }

  function StartPublic($pin="",$murmel="")
  {
    echo "starte npa public mit p $pin und m $murmel\n";
    return 1;
  }


  function NpaList()
  {
    $this->app->Tpl->Set(UEBERSCHRIFT,"nPA-Tools");

    $this->app->Tpl->Parse(PAGE,"npa.tpl");
  }

  function NpaRFIDLeser()
  {

    $result =  trim(shell_exec("opensc-tool -a"));
    //echo $result;
    if(strpos($result,"5e:13:77")!==false)
    {
    	echo '<img src="./themes/fredgui/images/foundrfid.png">';                              
   	$this->app->fredcontrol->LED("core","on"); 
    } else if (strlen($result)>15)
    {
 	echo '<img src="./themes/fredgui/images/wrongrfid.png">';                              
   	$this->app->fredcontrol->LED("core","off"); 

    }else {
    	echo '<img src="./themes/fredgui/images/searchrfid.png">';                              
   	$this->app->fredcontrol->LED("core","off"); 
    }
    exit;
    
  }

}
?>
