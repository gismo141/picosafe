[FORM]
<img src="./themes/fredgui/images/passwordsafe.jpg" align="left" style="margin:20px"><br><br><h4>Password safe</h4><p>Manage your passwords and secret accounts
<div style="padding-left: 140px; width:400px;">[MESSAGE]</div>

<style type="text/css" title="currentStyle">
			@import "./themes/fredgui/css/demo_table_jui.css";
		</style>

<div id="passwordsafe-form" title="Create new account">
<form method="post" action="" id="form">
<input type="hidden" name="cmd" value="create">
<table>
<tr><td>Account</td>
<td><input type="text" name="account" id="account" class="text ui-widget-content ui-corner-all" /></td>
</tr></table>
</form>
</div>

<script type="text/javascript" language="javascript" src="./js/jquery.dataTables.js"></script>
		<script type="text/javascript" charset="utf-8">


function DeleteAccount(id)
{
if(!confirm('Delete account really?')) return false; else window.location.href='index.php?module=passwordsafe&action=delete&id='+id+'&cmd=delete';
}

			$(document).ready(function() {

				$('#example').dataTable( {
					"bProcessing": true,
					"bServerSide": true,
   				"bJQueryUI": true,
					"sAjaxSource": "index.php?module=passwordsafe&action=table"
				} );
     
   			$('<div />').addClass('UnSelectAllButton').css({'float' : 'left'}).attr({'id' : 
						'UnSelectAllButtons'}).prependTo($('#example_filter'));
   
 $( "#passwordsafe-form" ).dialog({
autoOpen: false,
height: 150,
width: 350,
modal: true,
buttons: {
"Add Account": function() {

$("#form").submit()
$( this ).dialog( "close" );
},
Cancel: function() {
$( this ).dialog( "close" );
}
},
close: function() {
allFields.val( "" ).removeClass( "ui-state-error" );
}
});

  
   $('<button />').attr({
      'id' : 'deSelectAll'
   })

   .html('Add Account')
   .appendTo($('#UnSelectAllButtons'));

   $('#deSelectAll').click( function () {
    $( "#passwordsafe-form" ).dialog( "open" );
   });     
     
			} );
</script>
<br>
<br>
[MSG]
<br>
<h4>Your Accounts</h4>
<hr>
<br>
<div class="demo_jui">
<table cellpadding="0" cellspacing="0" border="0" class="display" id="example">
	<thead>
		<tr>
			<th width="20%">Account</th>
			<th width="25%">Description</th>
			<th width="25%">Action</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td colspan="5" class="dataTables_empty">Loading data from server</td>
		</tr>
	</tbody>
	<tfoot>
		<tr>
			<th>Account</th>
			<th>Description</th>
			<th>Action</th>
		</tr>
	</tfoot>
</table>
</div>

