<?php

class Mp3
{

  function Mp3(&$app,$gui=true)
  {
    if(!$gui)
      return;
  
    $this->app=&$app; 
  
    $this->app->ActionHandlerInit($this);

    $this->app->ActionHandler("list","Mp3List");
    $this->app->ActionHandler("play","Mp3Play");
    $this->app->ActionHandler("pause","Mp3Pause");
    $this->app->ActionHandler("shuffle","Mp3Shuffle");
    $this->app->ActionHandler("next","Mp3Next");
    $this->app->ActionHandler("previous","Mp3Previous");
    $this->app->ActionHandler("stop","Mp3Stop");
    $this->app->ActionHandler("current","Mp3Current");
    $this->app->ActionHandler("setvol","Mp3Setvol");
    $this->app->ActionHandler("mount","Mp3Mount");
    $this->app->ActionHandler("umount","Mp3Umount");
  
    $this->app->DefaultActionHandler("list");

    
    $this->app->Tpl->ReadTemplatesFromPath("./pages/content/");

    $this->app->ActionHandlerListen(&$app);
  }


  function Configuration()
  {
    $conf = array();
    $conf['login'] = "public"; // oder pin // keyboard

    return $conf;
  }


  function Login($pin="",$murmel="")
  {
    echo "login mp3 public mit p $pin und m $murmel\n";

    // return 0 bei falsch 1 bei ok
    return 1;
  }

  function Run($pin="",$murmel="")
  {
    // return 0 bei falsch 1 bei ok
    echo "starte mp3 private mit p $pin und m $murmel\n";
    return 1;
  }


  function Mp3List()
  {
    $this->app->Tpl->Set(UEBERSCHRIFT,"MP3-Player");

    $this->app->Tpl->Parse(PAGE,"mp3.tpl");
  }



  function Mp3Current()
  {
    //for($i=0;$i<100;$i++)
    {
    ob_start();
    passthru("echo 'currentsong' | netcat -c localhost 6600");
    $content_grabbed=ob_get_contents();
    ob_end_clean();
    //$test = system("echo 'current' | telnet localhost 6600");
    //echo nl2br($content_grabbed);
    $ext_arr = split("\n",$content_grabbed);
    $tmp = split(":",$ext_arr[1]);
    if($tmp[1]!="")
    {
      echo $tmp[1];
      exit;
    }
//    sleep(1);
    }
    echo "kein Titel";
    exit;

    $this->app->Tpl->Parse(PAGE,"mp3.tpl");
  }



  function Mp3Setvol()                                        
  {                                                            
  	$val = $this->app->Secure->GetGET("val");
  	if(is_numeric($val) && $val >= 0 && $val <=100)
      		exec("echo 'setvol $val' | netcat -c localhost 6600");
      $this->Mp3List();                               
  }

  function Mp3Shuffle()
  {
  	exec("echo 'shuffle' | netcat -c localhost 6600");
    $this->Mp3List();
  }


  function Mp3Next()
  {
  exec("echo 'next' | netcat -c localhost 6600");
    $this->Mp3List();
  }


  function Mp3Previous()
  {
  exec("echo 'previous' | netcat -c localhost 6600");
    $this->Mp3List();
  }



  function Mp3Pause()
  {
  exec("echo 'pause' | netcat -c localhost 6600");
//    $this->Mp3List();
  }


                                                    

  function Mp3Play()
  {
  exec("echo 'play' | netcat -c localhost 6600");
  //  $this->Mp3List();
  }


  function Mp3Stop()
  {
  exec("echo 'play 0' | netcat -c localhost 6600");
  exec("echo 'stop' | netcat -c localhost 6600");
    $this->Mp3List();
  }


  function Mp3Mount()
  {
    //exec("killall mpg123 &");
    //exex("killall mpd");
    exec("rmmod g_multi && sleep 2");
    //exec("umount /mnt");
    //exec("losetup -d /dev/loop0");
    exec("modprobe g_multi file=/root/qemu.img,/root/mp3.img &");
    exec("ifconfig usb0 10.0.0.1");
    $this->Mp3List();
  }

  function Mp3Umount()
  {                 
    //exec("killall mpg123 &");
    exec("rmmod g_multi && sleep 2"); 
    exec("modprobe g_multi file=/root/qemu.img &");
    exex("losetup /dev/loop0 /root/mp3.img");
    exex("mount /dev/loop0 /mnt");
    exex("/etc/init.d/S95mpd start");
    exec("ifconfig usb0 10.0.0.1");
    $this->Mp3List();        
  }  



}
?>
