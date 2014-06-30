<?
/// Interface for communication with a MySQL Database
class DB{
  var $dbname;
  var $dbhandle;

  //function DB($dbhost,$dbname,$dbuser,$dbpass,&$app="")
  function DB($dbname) //,$dbname,$dbuser,$dbpass,&$app="")
  {
    $this->app = &$app;
    $this->dbname=$dbname;
    $this->dbhandle = new PDO("sqlite:$dbname"); //sqlite_open($dbname, 0666, $error);
  }

	function SelectDB($database)
  {
  }
	
  function free(){
  }

  function Select($sql){
		foreach ($this->dbhandle->query($sql) as $row)
		{
			return $row[key($row)];	
		}
  }
 
  function SelectArr($sql){
		foreach ($this->dbhandle->query($sql) as $row)
		{
			$result_arr[] = $row;
		}
    return $result_arr;
  }
	
  function Result($sql){ return mysql_result(mysql_query($sql), 0);}

  function GetInsertID(){ return $this->dbhandle->lastInsertId();}

  function Insert($sql){ $this->dbhandle->query($sql); }
  function InsertWithoutLog($sql){ return sqlite_query($this->dbhandle, $sql); }
  function Update($sql){ $this->dbhandle->query($sql); }
  function UpdateWithoutLog($sql){ return sqlite_query($this->dbhandle, $sql); }
  function Delete($sql){ $this->dbhandle->query($sql); }

  function LogSQL($sql,$befehl)
  {
/*
    $name = $this->app->User->GetName();
    $sql = base64_encode($sql);
    $serial = base64_encode(serialize($this->app->Secure));
    mysql_query("INSERT INTO logdatei (id,name,befehl,statement,app,zeit) 
      VALUES ('','$name','$befehl','$sql','$serial',NOW())");
*/
  }

  function Count($sql){
    if(mysql_query($sql)){	
      return mysql_num_rows(mysql_query($sql));
    }
    else {return 0;}
  }

  function CheckTableExistence($table){
    $result = mysql_query("SELECT * FROM $table");
    if (!$result) {
      return false;
      } else { return true; }
  }

 
  function CheckColExistence($table,$col)
  {
    if($this->CheckTableExistence($table)){
      $result = mysql_query("SHOW COLUMNS FROM $table");
      if (!$result) {
	echo 'Could not run query: ' . mysql_error();
	exit;
      }
      if (mysql_num_rows($result) > 0) {
	while ($row = mysql_fetch_assoc($result)) {
	  if($row[Field]==$col)
	    return true;
	}
      }
    }
    return false;
  }



  function GetColArray($table)
  {
    if($this->CheckTableExistence($table)){
      $result = mysql_query("SHOW COLUMNS FROM $table");
      if (!$result) {
	echo 'Could not run query: ' . mysql_error();
	exit;
      }
      if (mysql_num_rows($result) > 0) {
	while ($row = mysql_fetch_assoc($result)) {
	  $ret[]=$row[Field];
	}
	return $ret;
      }
    }
  }


  function GetColAssocArray($table)
  {
    if($this->CheckTableExistence($table)){
      $result = mysql_query("SHOW COLUMNS FROM $table");
      if (!$result) {
	echo 'Could not run query: ' . mysql_error();
	exit;
      }
      if (mysql_num_rows($result) > 0) {
	while ($row = mysql_fetch_assoc($result)) {
	  $ret[$row[Field]]="";
	}
	return $ret;
      }
    }
  }

  function UpdateArr($tablename,$pk,$pkname,$ArrCols)
  {
    if(count($ArrCols)>0){
      foreach($ArrCols as $key=>$value){
	if($key!=$pkname)$this->Query("UPDATE `$tablename` SET `$key`='$value' 
	  WHERE `$pkname`='$pk' LIMIT 1");
      }
    }
  }

  function InsertArr($tablename,$pkname,$ArrCols)
  {
    // save primary than update
    $this->Query("INSERT INTO `$tablename` (id) VALUES ('')");
    
    $pk = $this->GetInsertID();
    $this->UpdateArr($tablename,$pk,$pkname,$ArrCols);
  }

  /// get table content with specified cols 
  function SelectTable($tablename,$cols){
   
    $firstcol = true;
    if(count($cols)==0)
      $selection = '*';
    else 
    {
      foreach($cols as $value)
      {
	if(!$firstcol)
	$selection .= ','; 
	
	$selection .= $value;

	$firstcol=false;
      }
    }
 
    $sql = "SELECT $selection FROM $tablename";
    return $this->SelectArr($sql);
  }
	


  function Query($query){
    return mysql_query($query);
  }



  function MysqlCopyRow($TableName, $IDFieldName, $IDToDuplicate) 
  {
    if ($TableName AND $IDFieldName AND $IDToDuplicate > 0) {
      $sql = "SELECT * FROM $TableName WHERE $IDFieldName = $IDToDuplicate";
      $result = @mysql_query($sql);
      if ($result) {
	$sql = "INSERT INTO $TableName SET ";
	$row = mysql_fetch_array($result);
	$RowKeys = array_keys($row);
	$RowValues = array_values($row);
	for ($i=3;$i<count($RowKeys);$i+=2) {
	  if ($i!=3) { $sql .= ", "; }
	  $sql .= $RowKeys[$i] . " = '" . $RowValues[$i] . "'";
	}
	$result = @mysql_query($sql);
      }
    }
		return $this->GetInsertID();
  }
}




















?>
