<?php

class Harddisk
{

  function Harddisk(&$app)
  {
    $this->app=&$app; 
  
    $this->app->ActionHandlerInit($this);

    $this->app->ActionHandler("list","HarddiskCrypt");
  
    $this->app->DefaultActionHandler("list");
    
    $this->app->Core->Sidebar();

    $this->app->ActionHandlerListen(&$app);
  }

	/* ----------------------------------- Harddisk ----------------------------------- */

	function HarddiskCrypt()
	{
		require('./apps/harddiskcrypt/harddiskcrypt.php');

		$open = $this->app->Secure->GetGET('open');
		$close = $this->app->Secure->GetGET('close');
		$default = $this->app->Secure->GetGET('default');
	
		$freespace = FreeSpace('/dev/sda1');
		$totalspace = TotalSpace('/dev/sda1');

		$freespace_in_mb = floor($freespace / 1024);
		$totalspace_in_mb = floor($totalspace / 1024);

		$this->app->Tpl->Set('FREESPACE', $freespace_in_mb);
		$this->app->Tpl->Set('TOTALSPACE', $totalspace_in_mb);
		
		$drives = GetDrives();

		$out = '';
		$default = GetDefault();

		for($i=0;$i<count($drives);$i++) {
			$size = floor($drives[$i]['size'] / (1024*1024));
			$mount_name = NormalizeName($drives[$i]['name']);
			$active = ((IsMount($drives[$i]['name'])=='1') ? '<img src="./themes/fredgui/images/ok_arrow.png">' : '');
			$standard = (($default==$drives[$i]['name']) ? '- default' : '');
			$out .= "<tr><td><b>{$drives[$i]['name']}</b> $standard</td><td>$mount_name</td><td>$size MB</td><td>$active</td>
									 <!--<td><a href=\"index.php?module=filebrowser&action=list&path=/mnt/$mount_name\" class=\"blue\">&Ouml;ffnen</a>&nbsp;-->
									 <td><a href=\"#\" onclick=\"OpenDrive('{$drives[$i]['name']}','index.php?module=filebrowser&action=list&path=/mnt/$mount_name')\" class=\"blue\">as web</a>&nbsp;|&nbsp;
											 <a href=\"#\" onclick=\"Mount('{$drives[$i]['name']}')\" class=\"blue\">as stick</a>&nbsp;|&nbsp;
									 		 <a href=\"#\" onclick=\"Unmount('{$drives[$i]['name']}')\" class=\"blue\">umount</a>&nbsp;|&nbsp;
											 <!--<a href=\"#\" onclick=\"SetDefault('{$drives[$i]['name']}')\" class=\"blue\">Standard</a>&nbsp;|&nbsp;-->
											 <a href=\"#\" onclick=\"DeleteDrive('{$drives[$i]['name']}')\" class=\"blue\">delete</a></td></tr>";
		}
		if(count($drives)==0) $out = '<tr><td colspan="3">no volumes are available!</td></tr>';
		$this->app->Tpl->Set('DRIVESTABLE', $out);
		

    $this->app->Tpl->Parse(PAGE,"harddiskcrypt.tpl");
	}

}
?>
