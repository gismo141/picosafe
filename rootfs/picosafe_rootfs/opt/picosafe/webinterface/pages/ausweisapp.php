<?php


class Ausweisapp
{

  function Ausweisapp(&$app,$gui=true)
  {
    if(!$gui)
      return;

    $this->app=&$app; 
  
    $this->app->ActionHandlerInit($this);

    $this->app->ActionHandler("list","AusweisappList");
    $this->app->ActionHandler("murmel","AusweisappMurmel");
    $this->app->ActionHandler("user","AusweisappUser");
    $this->app->ActionHandler("certificate","AusweisappCertificate");
    $this->app->ActionHandler("getcertificate","AusweisappGetCertificate");
    $this->app->ActionHandler("sendcertificate","AusweisappSendCertificate");
    $this->app->ActionHandler("goto","AusweisappGoto");
    $this->app->ActionHandler("rfidleser","AusweisappRFIDLeser");
    $this->app->ActionHandler("status","AusweisappStatus");
    $this->app->ActionHandler("details","AusweisappDetails");
    $this->app->ActionHandler("requestpin","AusweisappRequestPin");
    $this->app->ActionHandler("pin","AusweisappPin");
    $this->app->ActionHandler("setpin","AusweisappSetPin");
    $this->app->ActionHandler("send","AusweisappSend");
    $this->app->ActionHandler("checkpin","AusweisappCheckPin");
    $this->app->ActionHandler("run","AusweisappRun");
    $this->app->ActionHandler("ready","AusweisappReady");
  
    $this->app->DefaultActionHandler("list");

		$this->npa_log = '/tmp/npa_log';    
		$this->npa_pin = '/tmp/npa_pin';    

    $this->app->Tpl->ReadTemplatesFromPath("./pages/content/");

    $this->app->Core->Sidebar();

    $this->app->ActionHandlerListen(&$app);
  }

	function AusweisappDetails()
	{
		exec("echo '55:' > /tmp/npa_counter");
		echo '1';
		exit;
	}

	function AusweisappCheckPin()
	{
		$pin = trim(file_get_contents($this->npa_pin));
		if(is_numeric($pin)) {
			$len = strlen($pin);
			if($len==6) {
				echo 'ok';
				exec("echo '90:' > /tmp/npa_counter");
			}else if($len < 6)
				echo 'short';
			else if($len > 6)
				echo 'long';
		}

		if($pin=='timeout')
			echo 'timeout';

		exit;
	}

	function AusweisappRequestPin()
	{
		exec("echo '' > ".$this->npa_pin);
		exec("sudo /var/www/apps/ausweis/pinpad /dev/ttyUSB0 30 > ".$this->npa_pin);
	}

	function AusweisappSetPin()
  {	
		$pin = $this->app->Secure->GetGET('pin');
    exec("echo $pin > ".$this->npa_pin);
		echo "sudo echo $pin > ".$this->npa_pin;
		echo '1';
		exit;
  }

	function AusweisappSend()
	{
		sleep(2);
		exec("echo '100:' > /tmp/npa_counter");
		$this->app->Tpl->Parse('PAGE','ausweisapp_send.tpl');
	}

	function AusweisappPin()
	{
		$this->app->Tpl->Parse('PAGE','ausweisapp_pin.tpl');
	}

  function Configuration()
  {
    $conf = array();
    $conf['login'] = "pin";

    return $conf;
  }

  function StartPrivate($pin="",$murmel="")
  {
    echo "starte Ausweisapp private mit p $pin und m $murmel\n";
    return 1;
  }

  function StartPublic($pin="",$murmel="")
  {
    echo "starte Ausweisapp public mit p $pin und m $murmel\n";
    return 1;
  }

  function AusweisappStatus()
  {
    exec("cat /tmp/npa_counter", $result );

		$progress = 0;
		$description = '';		
	
		if(isset($result[0])) 
		{
			$data = split(':',$result[0]);
			
			if(isset($data[0]))
				$progress = $data[0];

			if(isset($data[1]))
				$description = $data[1];

		}

		echo json_encode(array('progress'=>intval($progress), 
													 'description'=>$description));
    exit;
  }


  function AusweisappRun()
  {
    sleep(2);
    exec("echo '10:Warte auf PIN' > /tmp/npa_counter");

  //  while(1)
  //  {
    $result = passthru("/usr/bin/lua /usr/bin/pin2.lua");
    $pin = split(" ",$result);

    if(1)//trim($pin[0])=="1234")
    { 
    sleep(2);
    exec("echo '30:Pruefe PIN' > /tmp/npa_counter");
    
    sleep(2);
    exec("echo '60:Der Ausweis prueft das Berechtigungszertifikat' > /tmp/npa_counter");
    
    sleep(2);
    exec("echo '90:Uebertrage Daten' > /tmp/npa_counter");
 
    exec("echo '100:Fertig' > /tmp/npa_counter");
    sleep(2);

    } else {
      exec("echo '20:Falsche PIN");
      sleep (3);
      exec("echo '20:Neuen Versuch bitte warten bis Murmel aktiv");
      $this->AusweisappRun();
    }

    //header("Location: http://www.eproo.de");
    exit;
  }


  function AusweisappMurmel()
  {
    $result = passthru("/usr/bin/lua /usr/bin/pin2.lua");
    $pin = split(" ",$result);
    echo $pin[0];
    exit;
  }


  function AusweisappReady()
  {
    $this->app->Tpl->Set(UEBERSCHRIFT,"Ausweisapp-Tools");

    $this->app->Tpl->Set(PAGE,"<br><br><center><h4>Daten erfolgreich &uuml;bermittelt</h4><br><img src=\"/themes/fredgui/images/ok.png\"><br><br>
		<a href=\"#\" class=\"npa\">&rarr;&nbsp;Hier klicken um Dienst fortzuf&uuml;hren</a></center><br><br>");
  }

  function AusweisappUser()
  {
    $this->app->Tpl->Set(UEBERSCHRIFT,"Ausweisapp-Tools");

		$certData = $this->ParseCertificate();

		$this->app->Tpl->Set('CERTDESCRIPTION', $certData['description']);
		$this->app->Tpl->Set('CERTNAME', $certData['serviceName']);
		$this->app->Tpl->Set('CERTURL', $certData['serviceURL']);

		$this->SetCheckboxStatus($certData['auth-options']);

    $this->app->Tpl->Parse(PAGE,"ausweisapp_user.tpl");
  }

	function SetCheckboxStatus($options)
	{
		$boxes = array('NAMESTATUS'=>'Read Given Names',
									 'ARTISTNAME'=>'Read Religious/Artistic Name', 
									 'SURNAMESTATUS'=>'Read Family Names',
									 'IDTYPE'=>'Read Document Type',
									 'PHDSTATUS'=>'Read Academic Title',
									 'ISSUINGCOUNTRYSTATUS'=>'Read Issuing State',
									 'ADDRESSSTATUS'=>'Read Normal Place of Residence',
									 'PORSTATUS'=>'Read Residence Permit I',
									 'BIRTHDATESTATUS'=>'Read Date of Birth',
									 'AGEVERIFYSTATUS'=>'Verify Age',
									 'BIRTHPLACESTATUS'=>'Read Place of Birth',
									 'PSEUDONYMSTATUS'=>'Restricted ID');


		foreach($boxes as $key=>$value) {
			$out = 'disabled';
			if(in_array($value, $options))
				$out = 'checked';
			$this->app->Tpl->Set($key, $out);
		}

	}


	function ParseCertificate()
	{
		$log = file_get_contents($this->npa_log);

		$data = array();
		$data['serviceName'] = $this->SearchTag($log,'serviceName');	
		$data['serviceURL'] = $this->SearchTag($log,'serviceURL');	
		$data['description'] = $this->SearchTag($log,'certificateDescription');
		$data['providerPage'] = $this->SearchTag($log,'providerPage');

		$authoptions = $this->SearchTag($log,'auth-options');
		$data['auth-options'] = $this->SearchTags($authoptions, 'auth-option');

		return $data;
	}

	function SearchTag($text, $tag) {
		$pos1 = strpos($text, '<'.$tag.'>') + strlen($tag) + 2;
		$pos2 = strpos($text, '</'.$tag.'>', $pos1);

		if($pos1!==false && $pos2!==false && $pos1<=$pos2) {
			return substr($text, $pos1, $pos2-$pos1);
		}
		return '';
	}

	function SearchTags($text, $tag) {
		$search_start = "<$tag>";
		$search_end = "</$tag>";

	
		$results = array();
		$pos1 = 0;
		while(true) {
			$pos1 = strpos($text, $search_start, $pos1);
			$pos2 = strpos($text, $search_end, $pos1);

			if($pos1!==false && $pos2!==false && $pos1<=$pos2){
				$results[] = substr($text, $pos1+strlen($search_start), $pos2-($pos1+strlen($search_start)));
				$pos1 = $pos2 + strlen($search_end);
			}else
				break;
		}
	
		return $results;
	}




  function AusweisappList()
  {
    $this->app->Tpl->Set(UEBERSCHRIFT,"Ausweisapp-Tools");
		exec("echo '0:' > /tmp/npa_counter");
//    $this->app->BuildNavigation=false;

    $this->app->Tpl->Parse(PAGE,"ausweisapp.tpl");
  }

	function AusweisappCertificate()
	{
		//exec("/home/sauterbe/GIT/eIDClientCore/bin/Test_nPAClientLib/Test_nPAClientLib > ".$this->npa_log);

		//exec("echo '30:test' > /tmp/npa_counter");


    $this->app->Tpl->Parse(PAGE,"ausweisapp_certificate.tpl");
	}
	
	function AusweisappGetCertificate()
	{
		$name = '';		

		do {
			exec("sudo /home/sauterbe/GIT/eIDClientCore/bin/Test_nPAClientLib/Test_nPAClientLib > $this->npa_log", $result);
			$certData = $this->ParseCertificate();	
			$name = $certData['serviceName'];
		}while($name=='');
		
		exec("echo '30:' > /tmp/npa_counter");
		echo '1';
		exit;
	}

	function AusweisappSendCertificate()
  {
    $name = '';

    do {
      exec("sudo /home/sauterbe/GIT/eIDClientCore/bin/Test_nPAClientLib/Test_nPAClientLib > $this->npa_log", $result);
      $certData = $this->ParseCertificate();
      $name = $certData['providerPage'];
    }while($name=='');
    
		exec("echo '100:' > /tmp/npa_counter");

    echo '1';
    exit;
  }

	function AusweisappGoto()
	{
		 $certData = $this->ParseCertificate();
		 $headers = split("\\r\\n", $certData['providerPage']);
		 foreach($headers as $key=>$value)	
			header($value);
	
		 exit;
	}

  function AusweisappRFIDLeser()
  {
    $result =  trim(shell_exec("opensc-tool -a"));

    //echo $result;
    if(strpos($result,"5e:13:77")!==false)
    {
    	echo '<a href="index.php?module=ausweisapp&action=certificate"><img src="./themes/fredgui/images/foundrfid.png"></a>';                              
   //	$this->app->fredcontrol->LED("core","on"); 
    } else if (strlen($result)>15)
    {
 	echo '<img src="./themes/fredgui/images/wrongrfid.png">';                              
   	//$this->app->fredcontrol->LED("core","off"); 

    }else {
    	echo '<img src="./themes/fredgui/images/searchrfid.png">';                              
   	//$this->app->fredcontrol->LED("core","off"); 
    }

    exit;
    
  }

}
?>
