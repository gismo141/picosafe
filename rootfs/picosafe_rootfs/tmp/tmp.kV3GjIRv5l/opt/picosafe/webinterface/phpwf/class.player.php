<?
/* Author: Benedikt Sauter, sauter@sistecs.de, 2007
 * Player for PHP Applications
 */

class Player {

  public $DefautTemplates;
  public $DefautTheme;

  // the application object
  public $app;

  function Player()
  {
    $this->DefautTemplates="defaulttemplates";
    $this->DefautTheme="default";
  }

  function SetDefaultTemplates($path)
  {
  }

  function SetDefaultTheme($path)
  {

  }

  function Run($app)
  {
    $this->app = $app;
    $module = $this->app->Secure->GetGET('module','alpha');

    if($module=="")$module="welcome";


    //if(!is_file("/tmp/pw_tresor")&&$module!="header")
    if($module!="header")
    {
      //$module = "rescue";
    }


    if($module=="")
    {
      $application = $this->app->Secure->GetGET('application','alpha');
      if(file_exists("applications/".$application."/".$application.".php")){
	include("applications/".$application."/".$application.".php");
	//create dynamical an object
	$constr=strtoupper($application{0}).substr($application, 1);
	$myApp = new $constr(&$this->app);
      }

    } else {
      if(file_exists("pages/".$module.".php")){
	include("pages/".$module.".php");
	//create dynamical an object
	$constr=strtoupper($module{0}).substr($module, 1);
	$myApp = new $constr(&$this->app);
      }
    }
    if($this->app->BuildNavigation==true)
    {
      echo $this->app->Tpl->FinalParse('page.tpl');
    }
    else
      echo $this->app->Tpl->FinalParse('popup.tpl');

  }


}
