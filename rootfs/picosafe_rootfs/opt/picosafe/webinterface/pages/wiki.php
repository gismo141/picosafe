<?php

class Wiki {
  var $app;
  
  function Wiki($app) {
    $this->app=&$app;
    $this->app->ActionHandlerInit($this);
	
    $this->app->ActionHandler("create","WikiCreate");
    $this->app->ActionHandler("edit","WikiEdit");
    $this->app->ActionHandler("delete","WikiDelete");
    $this->app->ActionHandler("rename","WikiRename");
    $this->app->ActionHandler("alle","WikiAlle");
    $this->app->ActionHandler("list","WikiList");

    $this->app->DefaultActionHandler("list");

    $this->app->Tpl->ReadTemplatesFromPath("./pages/content/");
    $name = $this->app->Secure->GetGET("name");
		$this->app->Tpl->Set(NAME,$name);

    $this->app->ActionHandlerListen($app);
  }


	function WikiAlle()
	{

		$alle = $this->app->DB->SelectArr("SELECT name FROM wiki ORDER by name");
		
	  $this->app->Tpl->Set(TAB1,"<h1>All pages (alphanumeric order):</h1><br><ul>");

		for($i=0;$i<count($alle);$i++)
		{
			$this->app->Tpl->Add(TAB1,"<li><a href=\"index.php?module=wiki&action=list&name=".$alle[$i]['name']."\">".$alle[$i]['name']."</a></li>");
		}
	  $this->app->Tpl->Add(TAB1,"</ul>");


		$this->app->Tpl->Set(TABTEXT,"Wiki");
		$this->app->Tpl->Parse(PAGE,"wiki_list.tpl");

	}

	function WikiCreateDialog()
	{

		$name = $this->app->Secure->GetGET("name");
		$this->app->Tpl->Set(TAB1,"<div class=\"info\">Page: <b>$name</b> is missing! Do you woll create this page now? <a href=\"index.php?module=wiki&action=create&name=$name\">Create page now!</a></div>");

	}


function WikiDelete()
  {
    $name = $this->app->Secure->GetGET("name");
    $key = $this->app->Secure->GetGET("key");

    if($name !="" && $key=="true")
    { 
      //loeschen
      $this->app->DB->Delete("DELETE FROM wiki WHERE name='$name'");
       header("Location: index.php?module=wiki&action=list");
        exit;
    }
    else if($name !="")
    { 
        $this->app->Tpl->Set(TAB1,"<div class=\"error\">Page: <b>$name</b> really delete? <a href=\"index.php?module=wiki&action=delete&name=$name&key=true\">Yes delete page now!</a></div>");
                $this->app->Tpl->Set(TABTEXT,"Wiki");
                $this->app->Tpl->Parse(PAGE,"wiki_list.tpl");
    }

  }


	function WikiRename()
  {
    $submit = $this->app->Secure->GetPOST("submit");
    $name = $this->app->Secure->GetGET("name");
    $newname = $this->app->Secure->GetPOST("newname");

		if($submit!="")
		{
			// pruefen ob name passt

			$checkname = $this->app->DB->Select("SELECT name FROM wiki WHERE name='$newname' LIMIT 1");

			if($checkname == $name)
			{
				$this->app->Tpl->Set(MESSAGE,"<div class=\"error\">Diesen Namen gibt es bereits. Bitte w&auml;hlen Sie einen anderen Namen.</div>"); 
				$name = $newname;
			}
			else if($newname=="")
			{
				$this->app->Tpl->Set(MESSAGE,"<div class=\"error\">Bitte geben Sie eine Namen an!</div>"); 
				$name = $newname;
			} else {
				// alle 
				$newname = str_replace(' ','_',$newname);
				$this->app->DB->UPDATE("UPDATE wiki SET name='$newname' WHERE name='$name'");
      	header("Location: index.php?module=wiki&action=list&name=$newname");
				exit;

			}
		}

								$this->app->Tpl->Set(TAB1,"<form action=\"\" method=\"post\">Neuer Name: <input type=\"text\" name=\"newname\" value=\"$name\" size=\"20\">&nbsp;<input type=\"submit\" value=\"umbenennen\" name=\"submit\"></form>");
								$this->app->Tpl->Set(TABTEXT,"Wiki");
                $this->app->Tpl->Parse(PAGE,"wiki_list.tpl");


  }



  function WikiCreate()
  {
		$name = $this->app->Secure->GetGET("name");
		if($name !="")
    {
      $wikiname = $this->app->DB->Select("SELECT name FROM wiki WHERE name='$name' LIMIT 1");

      if($wikiname != $name)
      {
				$this->app->DB->Insert("INSERT INTO wiki (name,content) VALUES ('$name','')");
				header("Location: index.php?module=wiki&action=edit&name=$name");
				exit;
			} else {
				header("Location: index.php?module=wiki&action=edit&name=$name");
				exit;
			}
		}
  }

  function WikiList()
  {

		$name = $this->app->Secure->GetGET("name");

		if($name !="")
		{
			$wikiname = $this->app->DB->Select("SELECT name FROM wiki WHERE name='$name' LIMIT 1");

			if($wikiname == $name)
			{
				$content = $this->app->DB->Select("SELECT content FROM wiki WHERE name='$name' LIMIT 1");
				$wikiparser = new WikiParser();
				$content = $wikiparser->parse($content);
				$index = $wikiparser->BuildIndex();
				if($index!==false) {
					$this->app->Tpl->Set('INDEX', $index);
					$this->app->Tpl->Parse('WIKIINDEX', 'wiki_index.tpl');
				}

				$this->app->Tpl->Set(TAB1,$content); // TODO Wiki Parser!!!!
			} else {
				$this->WikiCreateDialog();
			}

		} else {
			// hauptseite
			header("Location: index.php?module=wiki&action=list&name=Mainpage");
			exit;
		}

		$this->app->Tpl->Set(TABTEXT,"Wiki");
		$this->app->Tpl->Parse(PAGE,"wiki_list.tpl");
  }


  function WikiEdit()
  {

		$name = $this->app->Secure->GetGET("name");
		$content = $this->app->Secure->GetPOST("content");

		$startseite_link = '';
		if($name !="")
		{
			// check if is valid page
			$wikiname = $this->app->DB->Select("SELECT name FROM wiki WHERE name='$name' LIMIT 1");

			if($wikiname != $name)	
			{
				// seite gibt es nicht!!!	
			} else { // wenn es seite gibt speichern
				if($this->app->Secure->GetPOST("submit")!="" || $this->app->Secure->GetPOST("submitAndGoBack")!="")
				{
					$this->app->DB->Update("UPDATE wiki SET lastcontent=content WHERE name='$name'");
					$this->app->DB->Update("UPDATE wiki SET content='$content' WHERE name='$name'");
					if($this->app->Secure->GetPOST("submitAndGoBack")!='')
						header("Location: index.php?module=welcome&action=start");
					else
						header("Location: index.php?module=wiki&action=list&name=$name");
					exit;
				}
				$content = $this->app->DB->Select("SELECT content FROM wiki WHERE name='$name'");
			}
		} else {
			// Seite fehlt!!! soll diese angelegt werden?
			$this->WikiCreateDialog();
		}

		

		$this->app->Tpl->Set(TAB1,"<h1>Edit page $name</h1><br><form action=\"\" method=\"post\"><textarea rows=\"25\" cols=\"100\" name=\"content\">$content</textarea><br><br>
			$startseite_link
			<input type=\"submit\" value=\"Update\" name=\"submit\">
			</form>");
		$this->app->Tpl->Set(TABTEXT,"Wiki - edit page");
		$this->app->Tpl->Parse(PAGE,"wiki_list.tpl");
  }





}

?>
