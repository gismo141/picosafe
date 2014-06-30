<?
/*function microtime_float()
{
    list($usec, $sec) = explode(" ", microtime());
    return ((float)$usec + (float)$sec);
}*/


//$time_start = microtime_float();

// layer 1 -> mechnik steht bereit
include("./conf/main.conf.php");
$config = new Config();


//$time_include = microtime_float(); // Teil 1

include("fredgui.php");
$app = new fredgui($config);

//$time_config = microtime_float(); // Teil 2



// layer 2 -> darfst du ueberhaupt?
//include("./phpwf/class.session.php");
//$session = new Session();
//$session->Check($app);

//$time_session = microtime_float(); // Teil 3

// layer 3 -> nur noch abspielen
include("./phpwf/class.player.php");
$player = new Player();
$player->Run($app);

// pruefe ob benutzer angemeldet ist, wenn es anmeldung gibt

/*
// zeige homepage an
$time_end = microtime_float(); // Teil 4
$time = $time_session - $time_start;
$time_session = $time_end - $time_session;

echo "Teil 1 ".($time_include - $time_start)."<br>";
echo "Teil 2 ".($time_config - $time_include)."<br>";
echo "Teil 3 $time<br>";
echo "Teil 4 $time_session<br>";
*/
exit;



?>
