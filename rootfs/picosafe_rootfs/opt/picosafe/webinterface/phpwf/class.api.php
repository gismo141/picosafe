<?
class API
{
	var $app;

	function API($app)
	{
		$this->app = $app;
	}

  function FormToDB($table,$field_array)
  {
    $id = $this->app->Secure->GetGET("id");
    for($i=0;$i<count($field_array);$i++) 
    {
			$update_sql .= " '".$field_array[$i]."'='".$this->app->Secure->GetPOST($field_array[$i])."'";

			if($i<count($field_array)-1)
       $update_sql .=",";
    }
    $this->app->DB->Update("UPDATE $table SET $update_sql WHERE ROWID=$id");
  }

  function DBtoTpl($table,$id)
  {
    // Parse Content
    $values = $this->app->DB->SelectArr("SELECT * FROM $table WHERE id='$id' LIMIT 1");
    foreach($values[0] as $key=>$row)
    {
      $this->app->Tpl->Set(strtoupper($key),$row);
    } 
	}


}
?>
