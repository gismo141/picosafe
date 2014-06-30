<?
class Core
{
	var $app;

	function Core($app)
	{
		$this->app = &$app;
		$this->app = $app;
	}


	function Sidebar()
  {

  }

  function OnlineCheck()
  {
    $ts_ip = file_get_contents("/opt/picosafe/settings/network_check");
    $ts_port = "80"; // Make sure this port is open on the router or firewall

    $output = @fsockopen("$ts_ip", $ts_port, $errno, $errstr, 2);
    socket_set_timeout($output, 1);

    if ($output) {
			fclose($output);
    	return 1;
    } else {
			@fclose($output);
    	return 0;
    }
  }

	function RandomString($len)
	{
		mt_srand((double) microtime() * 1000000); 
		 
		$set = "ABCDEFGHIKLMNPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz123456789";
		$str = "";
		  
		for ($n=1;$n<=$len;$n++)
			$str .= $set[mt_rand(0,(strlen($set)-1))];

		return $str;
	}


	// Convertiert MySQL-Datum YYYY-MM-DD nach DD.MM.YYYY
  function ConvertDate($mysqlDate)
  {
    if($mysqlDate != "")
      return $this->Convert($mysqlDate,"%1-%2-%3","%3.%2.%1");
  }

  // Convertiert nach MySQL-Datum, DD.MM.YYYY nach YYYY-MM-DD 
  function ConvertToSqlDate($date)
  {
    if($date != "")
      return $this->Convert($date,"%3.%2.%1","%1-%2-%3");
  }

	function Convert($value,$input,$output)
  {
    if($input=="")
      return $value;

    $array = $this->FindPercentValues($input);
    $regexp = $this->BuildRegExp($array);

    $elements =
      preg_split($regexp,$value,-1,PREG_SPLIT_DELIM_CAPTURE | PREG_SPLIT_NO_EMPTY);

    // input und elements stimmmen ueberein

    $newout = $output;
    $i = 0;
    foreach($array as $key=>$value)
    {
      $newout = str_replace($key,$elements[$i],$newout);
      $i++;
    }
    return $newout;
  }

  function BuildRegExp($array)
  {

    $regexp = '/^';
    foreach($array as $value)
    {
      $value = str_replace('.','\.',$value);
      $value = str_replace('+','\+',$value);
      $value = str_replace('*','\*',$value);
      $value = str_replace('?','\?',$value);
      $regexp .= '(\S+)'.$value;
    }
    $regexp .= '/';

    return $regexp;
  }

	function FindPercentValues($pattern)
  {
    preg_match_all('/(?:(%[0-9]+)|.)/i', $pattern, $matches);

    $start = true;
    foreach($matches[1] as $key=>$value)
    {
      if($value=="")
  			$collecting = true;
      else
      {
  			$collecting = false;
  			$oldhash = $hash;
  			$hash = $value;
      }

      if(!$collecting)
      {
  			if(!$start)
    			$replace[$oldhash] = $collect;
  			$collect="";
      }
      else
  			$collect .=$matches[0][$key];
      $start = false;
    }
    $replace[$hash] = $collect;
    return $replace;
  }

	function configAdminAccess()
	{
	 	$docRoot = $_SERVER['DOCUMENT_ROOT'];

		//Suche in derzeitiger htaccess nach document_root
		$found = false;

		if(file_exists("{$docRoot}/admin/.htaccess"))
		{
			$content = file_get_contents("{$docRoot}/admin/.htaccess");
			$pos = stripos($content, $docRoot);
			if(is_numeric($pos))
				$found = true;
		}

		// schreibe neue .htaccess
		if($found==false)
		{
			$tpl = file_get_contents("{$docRoot}/conf/htaccess.tpl");
			$tpl = str_replace("[DOCROOT]", $docRoot."/admin/", $tpl);

			$file = fopen("{$docRoot}/admin/.htaccess","w");
			fwrite($file, $tpl);
			fclose($file);
		}
	}


}
?>
