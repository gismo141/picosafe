<?php

  /* ************** Actions ************** */

	$action = $_GET['action'];

	if($action=='filesize') {
		$file = base64_decode($_GET['file']);
		echo RealFileSize($file);
	}

	if($action=='getblock') {
		$file = base64_decode($_GET['file']);
		$block = $_GET['block'];
		$blocksize = $_GET['blocksize'];
		echo GetBlock($file, $block, $blocksize);
	}

	return;

  /* *********** Actions-End  ************ */

	function GetBlock($file, $block, $blocksize) {
		if(!(file_exists($file) && is_numeric($block) && $block>0 && is_numeric($blocksize) && $blocksize>0))
			return 'invalid arguments';

		$handle = fopen ($file, 'r');
		if($handle==null)
			return 'cant read block';

		$size = RealFilesize($file);

		$offset = ($block-1) * $blocksize;

		if(fseek($handle, $offset, SEEK_SET)<0) {
			fclose($handle);
			return 'cant read block';
		}

		$data = fread($handle, $blocksize);
		$curPtr = ftell($handle);
		rewind($handle);
		fclose($handle);

		return json_encode(array('data'=>base64_encode($data),'size'=>$curPtr-$offset,'checksum'=>md5($data)));
	}

  function RealFileSize($file)
	{
		exec("du -b '$file' | awk '{print $1}'", $output, $success);
		if($success!=0) return 0;
		return $output[0];
	}


?>
