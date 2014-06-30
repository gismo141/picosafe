	function MountDrive(name)
	{
		$.get('./apps/harddiskcrypt/harddiskcrypt.php?action=mount&name='+name, function(data) {
			if(data=='1'){ 
				Logger.SetDone('logging', 3);
			}else
		 		Logger.SetFailed('logging', 3);
		});
	}	
	
	function FormatDrive(name) 
	{
		$.get('./apps/harddiskcrypt/harddiskcrypt.php?action=format&name='+name, function(data) { 
    	if(data=='1') {
    	  Logger.SetDone('logging', 2);
        Logger.SetActive('logging', 3);
				MountDrive(name);
      }else
        Logger.SetFailed('logging', 2);
    });
	}

	function CreateDrive(name, size) 
	{
		$.get('./apps/harddiskcrypt/harddiskcrypt.php?action=create&name='+name+'&size='+size, function(data) { 
    	if(data=='1') {
    	  Logger.SetDone('logging', 1);
        Logger.SetActive('logging', 2);
        FormatDrive(name);
			}else{
        Logger.SetFailed('logging', 1);
			}
    });
	}

	function DeleteDrive(name) 
	{

		if(confirm('Do you really want delete the drive?')) {
			$.get('./apps/harddiskcrypt/harddiskcrypt.php?action=delete&name='+name, function(data) {
				if(data=='device is mount') alert('The drive is active. Hang it out before deleting.');
				else if(data=='0') alert('The volume could not be deleted!');
				else window.location.reload();
			});
		}
	}

	function PlotDrives()
	{
		$.getJSON('./apps/harddiskcrypt/harddiskcrypt.php?action=listdrives', function(drives) {

			data = [];
			var i = 0;
			for(drive in drives) {
				data[i++] =	{label: drives[drive].name, data: drives[drive].size};
			}
			console.log(data);

			$.plot($("#piechart"), data, {
			      series: { 
							pie: { 
								show: true, 
						    radius: 1,
								label: {  
									show: true,
									radius: 0.75,
									formatter: function(label, series) {
										return '<div class="piechart_label">'+label+'<br/>'+Math.round(series.percent)+'%</div>';
									},
									background: { opacity: 0.5 }
								} 
							} 
						},
						legend: { show: false }
			});
		});
	}
