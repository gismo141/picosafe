<?php
	define('_DRIVEPATH', '/home/picosafe/drives');

	$action = $_GET['action'];
	$name = $_GET['name'];
	$size = $_GET['size'];

	$file = _DRIVEPATH.'/'.$name;
	$file_enc = _DRIVEPATH.'/'.base64_encode($name).'.drive';

	/* -------------- Actions -------------- */
	if($action=='default' && $name!='') {
		echo SetDefault($name);
		return;
	}

	if($action=='open' && $name!='') {
		echo OpenDrive($file_enc, $name);
		return;
	}

	if($action=='unmount' && $name!='') {
		echo UnmountDrive($file_enc, $name);
		return;
	}

	if($action=='mount' && $name!='') {
		echo MountDrive($file_enc, $name);
		return;
	}

	if($action=='exists' && $name!='') {
		echo DriveExists($file_enc);
		return;
	}
	
	if($action=='create' && $name!='' && $size!='') {
		echo CreateDrive($file_enc, $size);
		return;
	}

	if($action=='delete' && $name!='') {
		echo DeleteDrive($file_enc, $name);
		return;
	}

	if($action=='format' && $name!='') {
		echo FormatDrive($file_enc);
		return;
	}
		
	if($action=='listdrives') {
		echo ListDrives(_DRIVEPATH);
		return;
	}

	/* -------------- Functions -------------- */

	function SetDefault($name)
	{
		$exist = GetDefault(_DRIVEPATH);
		if($exist!='')
			unlink(_DRIVEPATH.'/'.base64_encode($exist).'.default');

		$new = _DRIVEPATH.'/'.base64_encode($name).'.default';
		exec("touch '$new'");
		return 1;
	}

	function OpenDrive($file, $name)
	{
		if(IsMount($name))
			return 'locked';

		if(IsOpen($name))
			return 'opened';

		$slots = GetFreeLoopSlots();

		if(count($slots)<1)
			return 'noslots';


		$loopSlot = $slots[0];

		$lockfile = dirname($file).'/'.base64_encode($name).'.'.$loopSlot;
		$mount_name = NormalizeName($name);
    $mount_path = "/mnt/$mount_name";


		exec("sudo losetup /dev/$loopSlot $file", $losetup_out, $losetup_status);
		if($losetup_status!=0) {
			exec("sudo losetup -d /dev/$loopSlot");
    	exec("rm $lockfile");
			tryMount($lockfile, $mount_path, $loopSlot);
		} else {
			if(tryMount($lockfile, $mount_path, $loopSlot))
        return 'success';
		}

		exec("sudo mount | grep '$mount_path '",$check_output, $check_success);
    if($check_success=='0') {
			exec("sync");
			exec("sudo umount '$mount_path'", $output, $success);
		}


		exec("sudo losetup -d /dev/$loopSlot");
		exec("rm $lockfile");
		return 'error';
	}

	function tryMount($lockfile, $mount_path, $loopSlot) 
	{
		exec("touch $lockfile");
      exec("chmod 777 $lockfile");

      exec("sync");
      exec("sudo umount '$mount_path'");

      if(!file_exists($mount_path)) {
        mkdir($mount_path);
        chmod($mount_path, 0777);
      }

      exec("sudo mount /dev/$loopSlot $mount_path -o umask=000", $mount_out, $mount_status);
      if($mount_status==0)
        return true;
			return false;	
	}

	function CloseDrive($name)
 	{
		$mount_name = NormalizeName($name);

    // Mounted as loop-device?
    if(IsOpen($name)) {
      $mount_path = "/mnt/$mount_name";

      exec("sudo mount | grep '$mount_path '",$check_output, $check_success);
      if($check_success=='0') {
        exec("sync");
        exec("sudo umount '$mount_path'", $output, $success);

        $name_enc = base64_encode($name);
        $mounted = glob(_DRIVEPATH."/$name_enc.loop*");
        for($i=0;$i<count($mounted);$i++) {
          if(is_file($mounted[$i])) exec("rm {$mounted[$i]}");
        }
      }
    }
	}


	function UnmountDrive($file, $name) 
	{
		/*
		$mount_name = NormalizeName($name);
		$mount_path = "/mnt/$mount_name";

		if(!file_exists($mount_path))
			return 1;

		exec("sync");
		exec("sudo umount '$mount_path'", $output, $success);

		// check if umount was successful and delete folder
		exec("mount | grep '$mount_path'",$check_output, $check_success);
		if($check_success=='1') 
			exec("rm -r $mount_path");
		*/

		CloseDrive($name);


		$name_enc = base64_encode($name);
		$mounted = glob(_DRIVEPATH."/$name_enc.lun*");
		if(count($mounted)<1)
			return 1;	


		for($i=0;$i<count($mounted);$i++) {
			//$lun_pos = strrpos($mounted[$i], 'lun');
			//$lunSlot = substr($mounted[$i], $lun_pos, strlen($mounted[$i])-$lun_pos);	

			file_put_contents($mounted[$i], "close\r\n");

	
			//exec("sudo su -c 'echo > /sys/devices/platform/fsl-usb2-udc.0/gadget/$lunSlot/file'", $lun_output, $lun_status);
			//echo $lun_status;
			//exec("cat /sys/devices/platform/fsl-usb2-udc.0/gadget/$lunSlot/file", $lun_out);
			//if($lun_status==0)
			//	exec("rm $mounted[$i]");
		}

		return 1;
	}

	function MountDrive($file, $name)
	{

		$mount_name = NormalizeName($name);

		CloseDrive($name);		

		/*
		// Already active?
		$mount_path = "/mnt/$mount_name";
		exec("sudo mount | grep '$mount_path '",$check_output, $check_success);
		if($check_success=='1'){
			exec("rm -r $mount_path");
			mkdir($mount_path);
			chmod($mount_path, 0777);
		}else
			return 'device already active';

		if(!file_exists($file))
			return 'cant find device';

		exec("sudo /bin/mount -t vfat '$file' '$mount_path' -o loop -o umask=000",$output,$success);

		// check if umount was successful and delete folder
		exec("sudo mount | grep '$mount_path '",$check_output, $check_success);
		if($check_success=='1')
			exec("rm -r $mount_path");

		if($success!=0) return 0;
		*/

		$freeSlots = GetFreeMountSlots();
		if(count($freeSlots)<1)
			return 0;


		$lunSlot = $freeSlots[0];

		exec("sudo echo $file > /sys/devices/platform/fsl-usb2-udc.0/gadget/$lunSlot/file");

		$lockfile = dirname($file).'/'.base64_encode($name).'.'.$lunSlot;
		exec("touch $lockfile");
		exec("chmod 777 $lockfile");

		return 1;
	}

	function GetFreeMountSlots()
	{
		$mounted = glob(_DRIVEPATH.'/*.lun*');
		$slots = array('lun0','lun1','lun2','lun3','lun4','lun5','lun6','lun7');
    $found = array();
    for($i=0;$i<count($mounted);$i++) {
      $index_pos = strrpos($mounted[$i], 'lun');
      if(is_numeric($index_pos)) 
        $found[] = substr($mounted[$i], $index_pos, strlen($mounted[$i])-$index_pos);
    }

		return array_values(array_diff($slots, $found));
	}

	function GetFreeLoopSlots()
	{
		$mounted = glob(_DRIVEPATH.'/*.loop*');
    $slots = array('loop0','loop1','loop2','loop3','loop4','loop5','loop6','loop7');
    $found = array();
    for($i=0;$i<count($mounted);$i++) {
      $index_pos = strrpos($mounted[$i], 'loop');
      if(is_numeric($index_pos))
        $found[] = substr($mounted[$i], $index_pos, strlen($mounted[$i])-$index_pos);
    }

    return array_values(array_diff($slots, $found));
	}

	function DriveExists($file, $name) 
	{ 
		$mount_name = NormalizeName($name);

		if(file_exists($file))
			return 1;
		return 0;
	}

	function CreateDrive($file, $size) 
	{
		exec("truncate -s {$size}M $file",$output,$success);
		chmod($file, 0777);
		if($success!=0) return 0;
		return 1;
	}

	function DeleteDrive($file, $name)
	{
		if(isMount($name)=='1')
			return 'device is mount';

		unlink($file);
		if(file_exists($file)) 
			return 0;
		return 1;
	}

	function FormatDrive($file) {
		exec("sudo /sbin/mkfs.vfat  -F 32 $file",$output,$success);
		if($success!=0) return 0;
		return 1;
	}
	
	function ListDrives($dir) {
		$drives = GetDrives($dir);

		$total = floor(TotalSpace('/dev/sda1') / 1024);
		$free = floor(FreeSpace('/dev/sda1') / 1024);

		$data[] = array('name'=>'Free Space', 'size'=> ($free / $total));

		$drivesTotal = 0;

		for($i=0;$i<count($drives);$i++) {
			$size_in_mb = ($drives[$i]['size'] / 1048576);
			$data[] = array('name'=>$drives[$i]['name'], 'size'=>$size_in_mb / $total);
		}


		return json_encode($data);
	}
	
	/* *********************************************************** */

	function NormalizeName($name)
	{
		$name = mb_strtoupper($name, 'UTF-8');
		$replace = array('Ä'=>'AE','Ö'=>'OE','Ü'=>'UE','ß'=>'SS');
		$name = strtr($name, $replace);

		return preg_replace('/[^A-Z0-9]+/',"",$name);
	}

	function IsMount($name) 
	{
		$name_enc = base64_encode($name);
		$mounted = glob(_DRIVEPATH."/$name_enc.lun*");
    if(count($mounted)<1)
      return 0;
		return 1;
	}

	function IsOpen($name)
	{
		$name_enc = base64_encode($name);
    $mounted = glob(_DRIVEPATH."/$name_enc.loop*");
		if(count($mounted)<1)
      return 0;
    return 1;
	}

	function RealFileSize($file)
	{
		exec("du -b '$file' | awk '{print $1}'", $output, $success);
		if($success!=0) return 0;
		return $output[0];
	}

	function GetDrives($dir='/home/picosafe/drives') 
	{
		$files = glob($dir.'/*.drive');

		$drives = array();
		foreach($files as $file) 
			$drives[] = array('name'=>base64_decode(basename($file,'.drive')), 'size' => RealFileSize($file));

		return $drives;
	}

	function GetDefault($dir='apps/harddiskcrypt/drives')
	{
		$default = glob($dir.'/*.default');
		if(count($default)==0) return;

		return base64_decode(basename($default[0], '.default'));
	}

	function FreeSpace($disc)
	{
		if($disc=='') return;
		
		$output = '';
		exec('df '.$disc, $output);
		
		if($output[1]!='') {
			$size = substr($output[1], strlen($disc), strlen($output[1])-strlen($disc));
			preg_match_all("/[0-9]+/", $size, $matches);

			return $matches[0][2];
		}
	}

	function TotalSpace($disc)
	{
		if($disc=='') return;
		
		$output = '';
		exec('df '.$disc, $output);
		
		if($output[1]!='') {
			$size = substr($output[1], strlen($disc), strlen($output[1])-strlen($disc));
			preg_match_all("/[0-9]+/", $size, $matches);

			return $matches[0][0];
		}
	}
?>
