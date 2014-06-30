<?php

class Passwordsafe
{

  function Passwordsafe(&$app)
  {
    $this->app=&$app;
        
    $this->app->ActionHandlerInit($this);
            
    $this->app->ActionHandler("list","PasswordsafeList");
    $this->app->ActionHandler("table","PasswordsafeTable");
    $this->app->ActionHandler("edit","PasswordsafeEdit");
    $this->app->ActionHandler("delete","PasswordsafeDelete");
                
    $this->app->DefaultActionHandler("list");
                    
    $this->app->Tpl->ReadTemplatesFromPath("./pages/content/");
                        
    $this->app->ActionHandlerListen(&$app);
  }
                              
    

  function PasswordsafeList()
  {
    $cmd = $this->app->Secure->GetPOST("cmd");
    $msg = $this->app->Secure->GetGET("msg");

		if($msg!="")
    {
    	$this->app->Tpl->Set(MESSAGE_TEXT,base64_decode($msg));
    	$this->app->Tpl->Parse(MESSAGE,"highlight.tpl");
		}

	  if($cmd=="create") {
      $account = $this->app->Secure->GetPOST("account");
      $description = $this->app->Secure->GetPOST("description");
			$sql = "INSERT INTO passwordsafe ('id','account','description','externallogin','externalpassword','url','comments') VALUES (NULL,'$account','$description',NULL,NULL,NULL,NULL)";
			$this->app->DB->Insert($sql);
      $id = $this->app->DB->GetInsertID();
      header("Location: index.php?module=passwordsafe&action=edit&id=$id");
      exit;
    }
		$this->app->Tpl->Parse(FORM,"passwordsafe_form.tpl");
		$this->app->Tpl->Parse(PAGE,"passwordsafe_list.tpl");
	}

  function PasswordsafeDelete()
	{
    $id = $this->app->Secure->GetGET("id");
    $cmd = $this->app->Secure->GetGET("cmd");
	  if($cmd=="delete") {
			$this->app->DB->Delete("DELETE FROM passwordsafe WHERE ROWID=$id");
			$msg=base64_encode("Your account was deleted!");
      header("Location: index.php?module=passwordsafe&action=list&msg=$msg");
			exit;
		}
	}

  function PasswordsafeEdit()
  {
    $id = $this->app->Secure->GetGET("id");

    $this->app->Tpl->Set(ID,$id);
    
    $cmd = $this->app->Secure->GetPOST("cmd");
    if($cmd=="update")
		{
      $this->app->api->FormToDB("passwordsafe",array('account','description','externallogin','externalpassword','url','comments'));
			$this->app->Tpl->Set(MESSAGE_TEXT,"Saved successfully!");
      $this->app->Tpl->Parse(MESSAGE,"highlight.tpl");
		}
    // Parse Content 
		$this->app->api->DBtoTpl("passwordsafe",$id);
	  $url = $this->app->DB->Select("SELECT url FROM passwordsafe WHERE id='$id'");
	  $this->app->Tpl->Set(URLBASE64,base64_encode($url));


		$this->app->Tpl->Parse(PAGE,"passwordsafe_edit.tpl");
  }

  function PasswordsafeTable()
  {
		$iDisplayLength=$this->app->Secure->GetGET("iDisplayLength");
		$sSearch=$this->app->Secure->GetGET("sSearch");
		$iSortCol_0=$this->app->Secure->GetGET("iSortCol_0");
		$sSortDir_0=$this->app->Secure->GetGET("sSortDir_0");

    $iSortCol_0 = $iSortCol_0 +1;

    $result = $this->app->DB->SelectArr("SELECT account,description,
				'<a href=\"index.php?module=passwordsafe&action=edit&id=' || id || '\">Edit</a>&nbsp;<a onclick=\"DeleteAccount(' || id || ')\" href=\"#\">Delete</a>'
				 as id FROM passwordsafe WHERE (account LIKE '%$sSearch%' OR description LIKE '%$sSearch%')  ORDER by $iSortCol_0 $sSortDir_0 LIMIT $iDisplayLength");

		$iFilteredTotal=count($result);

    $iTotal= $this->app->DB->Select("SELECT COUNT(id) FROM passwordsafe");

		$output = array(
		"sEcho" => intval($this->app->Secure->GetGET("sEcho")),
		"iTotalRecords" => $iTotal,
		"iTotalDisplayRecords" => $iFilteredTotal,
		"aaData" => array()
		);

		foreach($result as $key=>$row)
    {
			$output['aaData'][] = $row;//array('name','descr','accout','id');	
    }

		echo json_encode( $output );
	
    exit;
  }

}
?>
                                            
