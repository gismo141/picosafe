<script>
  $(function() {
    $( "#tabs" ).tabs();
  });
  </script>




<div id="tabs">
  <ul>
    <li><a href="#tabs-1">Bedienung</a></li>
  </ul>
  <div id="tabs-1">

 <br> 
 <br> 
  
 <fieldset><legend>Bedieneinheit</legend> 
  
  
  
  <style>
  #toolbar {
    padding: 10px 4px;
  }
  </style>
  <script>
  $(function() {
    $( "#beginning" ).button({
      text: false,
      icons: {
        primary: "ui-icon-seek-start"
      }
    })
    .click(function() {
      $.get('http://10.0.0.1/index.php?module=mp3&action=previous&ajax=true',function(data,status) { },'html');
    });


    $( "#rewind" ).button({
      text: false,
      icons: {
        primary: "ui-icon-seek-prev"
      }
    });
    $( "#play" ).button({
      text: false,
      icons: {
        primary: "ui-icon-play"
      }
    })
    .click(function() {
      var options;
      $.get('http://10.0.0.1/index.php?module=mp3&action=play&ajax=true',function(data,status) { },'html');
    });
    $( "#pause" ).button({
      text: false,
      icons: {
        primary: "ui-icon-pause"
      }
    })
    .click(function() {
      var options;
      $.get('http://10.0.0.1/index.php?module=mp3&action=pause&ajax=true',function(data,status) { },'html');
    });

    $( "#stop" ).button({
      text: false,
      icons: {
        primary: "ui-icon-stop"
      }
    })
    .click(function() {
      $.get('http://10.0.0.1/index.php?module=mp3&action=stop&ajax=true',function(data,status) { },'html');
      $( "#play" ).button( "option", {
        label: "play",
        icons: {
          primary: "ui-icon-play"
        }
      });
    });
    $( "#forward" ).button({
      text: false,
      icons: {
        primary: "ui-icon-seek-next"
      }
    })
    .click(function() {
      $.get('http://10.0.0.1/index.php?module=mp3&action=next&ajax=true',function(data,status) { },'html');
    });

    $( "#end" ).button({
      text: false,
      icons: {
        primary: "ui-icon-seek-end"
      }
    })
    .click(function() {
      $.get('http://10.0.0.1/index.php?module=mp3&action=next&ajax=true',function(data,status) { },'html');
    });

    $( "#shuffle" ).button()
    .click(function() {
      $.get('http://10.0.0.1/index.php?module=mp3&action=shuffle',function(data,status) { },'html');
    });


    $( "#repeat" ).buttonset();
    
	// setup master volume
	$( "#master" ).slider({
			value: 60,
			orientation: "horizontal",
		range: "min",
		animate: true,
		      step: 10,
		slide: function(event, ui) {
		      $.get('http://10.0.0.1/index.php?module=mp3&action=setvol&ajax=true&val='+ui.value,function(data,status) { },'html');
		          }
		          
		           
	});
	
	 //$.ajaxSetup({ cache: false }); // This part addresses an IE bug.  without it, IE will only load the first number and will never refresh
	   setInterval(function() {
	       $('#notice_div').load('http://10.0.0.1/index.php?module=mp3&action=current&ajax=true');
	         }, 5000); // the "3000" 
	         
    
  });
  </script>



<div class="demo">
<p class="ui-state-default ui-corner-all" style="padding:4px;margin-top:4em;">
	<span class="ui-icon ui-icon-signal" style="float:left; margin:-2px 5px 0 0;"></span>
		Fernbedienung
		</p>
<span id="toolbar" class="ui-widget-header ui-corner-all">
  <button id="beginning">go to beginning</button>
<!--<button id="rewind">rewind</button>-->
  <button id="play">play</button>
  <button id="pause">pause</button>
  <button id="stop">stop</button>
 <!-- <button id="forward">fast forward</button>-->
  <button id="end">go to end</button>
<!--  
  <input type="checkbox" id="shuffle" /><label for="shuffle">Shuffle</label>
  
  <span id="repeat">
    <input type="radio" id="repeat0" name="repeat" checked="checked" /><label for="repeat0">No Repeat</label>
    <input type="radio" id="repeat1" name="repeat" /><label for="repeat1">Once</label>
    <input type="radio" id="repeatall" name="repeat" /><label for="repeatall">All</label>
  </span>
-->
</span>
<p class="ui-state-default ui-corner-all" style="padding:4px;margin-top:4em;">                      
        <span class="ui-icon ui-icon-signal" style="float:left; margin:-2px 5px 0 0;"></span>                
        Aktueller Titel: <span id="notice_div"></span>
                                </p>  


<p class="ui-state-default ui-corner-all" style="padding:4px;margin-top:4em;">
	<span class="ui-icon ui-icon-signal" style="float:left; margin:-2px 5px 0 0;"></span>
	Lautst&auml;rke
		</p>
		
		<div id="master" style="width:260px; margin:15px;"></div>

</div><!-- End demo -->

</fieldset>
<br><br>
Um Dateien auf den MP3-Player kopieren zu k&ouml;nnen muss das MP3-Laufwerk freigegeben werden.
Nach dem Klick auf den unten stehenden Button &ouml;ffnet sich nach ein paar Sekunden ein
weiteres Laufwerk in Ihrem Betriebssystem. Kopieren Sie Ihre Lieder
in das Laufwerk (ohne Unterverzeichnisse). Um die Lieder h&ouml;ren zu k&ouml;nnen
muss der FRED Heruntergefahren werden. Starten Sie den MP3-Player jetzt mit Ihrem passenden
Zugangscode. 
<br><br>

<fieldset><legend>MP3-Dateien laden</legend>



  
  
  <script>
  $(function() {
    $( "#oeffnen" ).button()
     .click(function() {
      $.get('http://10.0.0.1/index.php?module=mp3&action=mount&ajax=true',function(data,status) { },'html');
    });
    
    $( "#schliessen" ).button()                                                                                 
         .click(function() {                                                                                     
               $.get('http://10.0.0.1/index.php?module=mp3&action=umount&ajax=true',function(data,status) { },'html');           
                   }); 

  });
  </script>

<div class="demo">

<input type="submit" id="oeffnen" value="MP3-Laufwerk &ouml;ffnen"/>
<input type="submit" id="schliessen" value="MP3-Laufwerk schlie&szlig;en"/>

</div><!-- End demo -->


</fieldset>



  </div>

</div><!-- End demo -->



<div style="display: none;" class="demo-description">
<p>Click tabs to swap between content that is broken into logical sections.</p>
</div><!-- End demo-description -->
