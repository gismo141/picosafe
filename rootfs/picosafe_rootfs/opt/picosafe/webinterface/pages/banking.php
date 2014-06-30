<?php


class Banking
{

  function Banking(&$app,$gui=true)
  {
    if(!$gui)
      return;

    $this->app=&$app; 
  
    $this->app->ActionHandlerInit($this);

    $this->app->ActionHandler("list","BankingList");
    $this->app->ActionHandler("rfidleser","BankingRFIDLeser");
    $this->app->ActionHandler("openbrowser","BankingOpenBrowser");
    $this->app->ActionHandler("closebrowser","BankingCloseBrowser");
  
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
    echo "starte banking private mit p $pin und m $murmel\n";
    return 1;
  }

  function StartPublic($pin="",$murmel="")
  {
    echo "starte banking public mit p $pin und m $murmel\n";
    return 1;
  }


  function BankingList()
  {

    $this->app->Tpl->Set(UEBERSCHRIFT,"Banking");


    for($i=0;$i<=5;$i++)
    {
      $betrag = sprintf("%01.2f",rand(20,1000)); 

     $this->app->Tpl->Add(UEBERWEISUNGEN,'
    <tr>
        <td>Max Mustermann</td>
        <td >1234456</td>
        <td >7878787</td>
        <td >Rechnung 3737</td>
        <td >'.$betrag.'</td>
        <td >EUR</td>
    </tr>');
    }


    $this->app->Tpl->Parse(PAGE,"banking.tpl");
  }
  
  
  function BankingOpenBrowser()
  {
    exec("rmmod g_multi");  
    exec("modprobe g_multi file=/opt/fred/apps/gui/gui.img,/opt/fred/apps/gui/browser.img");
    exec("ifconfig usb0 10.0.0.1");  
    $this->BankingList();
  }
  
  function BankingCloseBrowser()
  {          
    exec("rmmod g_multi");
    exec("modprobe g_multi file=/opt/fred/apps/gui/gui.img");
    exec("ifconfig usb0 10.0.0.1");  
    $this->BankingList();
  }      
                                

  function BankingRFIDLeser()
  {

//    $result =  trim(shell_exec("opensc-tool -a"));
    //echo $result;
    if($result=="3b:88:80:01:4a:43:4f:50:76:32:34:31:5e")
    {
    	echo '<img src="./themes/fredgui/images/foundrfid.png">';                              
   	$this->app->fredcontrol->LED("core","on"); 
    } else {
    	echo '<img src="./themes/fredgui/images/searchrfid.png">';                              
   	$this->app->fredcontrol->LED("core","off"); 
    }
    exit;
    
  }

}
?>
