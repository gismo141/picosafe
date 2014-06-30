<?
/* Author: Benedikt Sauter <sauter@embedded-projects.net>
 */
include_once("./phpwf/class.application.php");
include_once("./lib/core.php");

class fredgui extends Application
{
  public $obj;
  public $starttime;
  public $endtime;
  public $fredcontrol;

  public function __construct($config,$group="") 
  {
//    $this->starttime = microtime(); 
    parent::Application($config,$group);

  	// $this->fredcontrol = new FredControl();
  	// $this->lua = new LUA();

	$this->Core = new Core(&$this);
  $this->DB             = new DB("fred-gui2.db");
/*
  if ($this->Core->OnlineCheck()) {
    $this->Tpl->Set(NETWORKMAIN,"<FONT COLOR=#009900 style=\"border:1px solid white; border-radius:4px; background-color:white;\">&nbsp;<B>ONLINE</B>&nbsp;</FONT>");
  } else {
    $this->Tpl->Set(NETWORKMAIN,"<FONT COLOR=#DD0000 style=\"border:1px solid white; border-radius:4px; background-color:white;\">&nbsp;<B>OFFLINE</B>&nbsp;</FONT>");
  }
*/

	$this->Tpl->ReadTemplatesFromPath("./pages/content/"); // ca. 200ms
 //	$device =  $this->mobile_user_agent_switch();

	$this->Tpl->Set(THEME,"fredgui");
	$this->Tpl->ReadTemplatesFromPath("./themes/fredgui/templates/");


   $module = $this->Secure->GetGET("module");
   $action = $this->Secure->GetGET("lock");

		if(is_file("/home/picosafe/.webguilock"))
		{
			if($module!="welcome" && $module!="lock" && is_file("/home/picosafe/.webguilock"))
				header("Location: index.php?module=welcome&action=lock");
		} 
  }


  function calledWhenAuth($type)
  {

  } 

  function mobile_user_agent_switch(){
    $device = '';

    if( stristr($_SERVER['HTTP_USER_AGENT'],'ipad') ) {
      $device = "ipad";
    } else if( stristr($_SERVER['HTTP_USER_AGENT'],'iphone') || strstr($_SERVER['HTTP_USER_AGENT'],'iphone') ) {
      $device = "iphone";
    } else if( stristr($_SERVER['HTTP_USER_AGENT'],'blackberry') ) {
      $device = "blackberry";
    } else if( stristr($_SERVER['HTTP_USER_AGENT'],'android') ) {
      $device = "android";
    }

    if( $device ) {
      return $device;
    } return false; {
      return false;
    }
	}
}



?>
