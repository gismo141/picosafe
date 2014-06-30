<?php

	$action = $_GET['action'];


	/* ************************* Actions ************************* */
	if($action=='listdirectory') {
		$directory = base64_decode($_GET['directory']);
		$data = ListDirectory($directory);
		$data = SortFiles($data);
		echo json_encode($data);
	}

	if($action=='path') {
		$directory = base64_decode($_GET['directory']);
		$base = base64_decode($_GET['base']);
		$data = GetPath($base, $directory);
		echo json_encode($data);
	}

	if($action=='download') {
		$file = base64_decode($_GET['file']);
		DownloadFile($file);
	}

	if($action=='delete') {
		$file = base64_decode($_GET['file']);
		echo DeleteFile($file);
	}

	if($action=='newdir') {
		$curdir = base64_decode($_GET['curdir']);	
		$name = base64_decode($_GET['name']);
		echo NewDir($curdir, $name);
	}

	if($action=='rename') {
		$oldname = base64_decode($_GET['old']);
		$newname = base64_decode($_GET['new']);
		echo RenameFile($oldname, $newname);
	}

	if($action=='upload') {
		$curdir = base64_decode($_GET['curdir']);
		echo UploadFile($curdir);
	}

	return;
	/* *********************** Actions-End *********************** */

	function UploadFile($curdir) {
		if(!file_exists($curdir))
			return 'basedir not found';
		
		if(!isset($_FILES['files'])) 
			return 'file not found';

		$name = $_FILES['files']['name'][0];
		$from = $_FILES['files']['tmp_name'][0];

		$to = realpath($curdir).'/'.$name;

		copy($from, $to);

		if(!file_exists($to))
			return 'cant upload';

		chmod($to, 0755);

		return 'file uploaded';
	}

	function RenameFile($oldname, $newname) {
		if(!file_exists($oldname))
			return 'file not found';

		$newfile = dirname($oldname).'/'.$newname;

		if(file_exists($newfile))
			return 'file already exists';

		rename($oldname, $newfile);

		if(!file_exists($newfile))
			return 'cant rename file';

		return 'file renamed';
	}

	function NewDir($curdir, $name) {
		if(!file_exists($curdir))
			return 'basedir not found';

		$curdir = realpath($curdir);
		$newdir = $curdir.'/'.$name;

		if(file_exists($newdir))
			return 'dir already exists';

		exec('mkdir '.$newdir);

		if(!file_exists($newdir))
			return 'cant create dir';

		return 'dir created';	
	}

	function DeleteFile($file) {
		if(!file_exists($file))
			return 'file not found';

		exec('rm -Rf '.$file);
		//unlink($file);

		if(file_exists($file))
			return 'cant delete file';

		return 'file deleted';
	}


	function DownloadFile($file) {
		if(!file_exists($file))
			return;

		set_time_limit(0);

		$size = intval(sprintf("%u", filesize($file)));
		header('Content-Type: application/octet-stream');
		header('Content-Description: File Transfer');
		header("Content-Length: ".$size);
		header('Content-Disposition: attachment; filename="'.basename($file).'"');
		
		$chunksize = 1 * (1024 * 1024); // how many bytes per chunk 
		if ($size > $chunksize) {

			$handle = fopen($file, 'rb'); 
			$buffer = ''; 
			
			while (!feof($handle)) { 
				$buffer = fread($handle, $chunksize); 
				echo $buffer; 
				ob_flush(); 
				flush(); 
			} 
			
			fclose($handle); 
		}else 
		  readfile($file); 
	}



	function GetPath($base, $directory) {
		if(file_exists($base) && file_exists($directory)) {
			$data = array('base'=>basename($base), 'folders'=>array());
			if($base==$directory) return $data;


			$b_dir = str_replace($base.'/', '', $directory);

			$folders = explode('/',$b_dir);

			$dirs = array();
			for($i=0;$i<count($folders);$i++) {
				$path = $base;

				for($f=0;$f<=$i;$f++)
					$path .= '/'.$folders[$f];
			
				$dirs[] = array('directory' => $folders[$i], 'path' => $path);
			}

			$data['folders'] = $dirs;
			return $data;
		}
	}

	function RealFileSize($file)
	{
		exec("du -b '$file' | awk '{print $1}'", $output, $success);
		if($success!=0) return 0;
		return $output[0];
	}

	function ListDirectory($directory) {
		$path = realpath($directory);

		if(file_exists($path)) {

			$files = glob($path.'/*');//scandir($directory);

			if($files[0]=='.') unset($files[0]);
			if($files[1]=='..') unset($files[1]);
			$files = array_values($files);
		
			$data = array();

			for($i=0;$i<count($files);$i++) {
				$name = basename($files[$i]);
				$type = filetype($files[$i]);
				$size = (($type=='file') ? RealFileSize($files[$i]) : 0);

				$data[] = array('path'=>$files[$i], 'name' => $name, 'type' => $type, 'size' => $size);
			}
			return $data;	
		}
	}

	function SortFiles($data) {
		$files = array();
		$dirs = array();

		if(count($data>0)) {
			for($i=0;$i<count($data);$i++) {
				if($data[$i]['type']=='dir') 
					$dirs[]	= $data[$i];

				if($data[$i]['type']=='file') 
					$files[] = $data[$i];
			}

			sort($dirs);
			sort($files);
			return array_merge($dirs, $files);
		}
	}

?>
