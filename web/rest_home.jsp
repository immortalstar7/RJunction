<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<title>jQuery UI Example Page</title>
		<link type="text/css" href="css/custom-theme/jquery-ui-1.8.18.custom.css" rel="stylesheet" />	
		<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
		<script type="text/javascript" src="js/jquery-ui-1.8.18.custom.min.js"></script>
        <script type="text/javascript" src="script/jquery.table.addrow.js" ></script>
		<script type="text/javascript">
			$(function(){
	
				// Tabs
				$('#tabs').tabs();
				
				//hover states on the static widgets
				$('#dialog_link, ul#icons li').hover(
					function() { $(this).addClass('ui-state-hover'); }, 
					function() { $(this).removeClass('ui-state-hover'); }
				);
				
			});
			(function($){
	$(document).ready(function(){
		$(".addRow").btnAddRow();
		$(".delRow").btnDelRow();
});
})(jQuery);
		</script>
		<style type="text/css">
			/*demo page css*/
			body{ font: 62.5% "Trebuchet MS", sans-serif; margin-left: 10%; margin-right:10%}
			.demoHeaders { margin-top: 10%; }
			#dialog_link {padding: .4em 1em .4em 20px;text-decoration: none;position: relative;}
			#dialog_link span.ui-icon {margin: 0 5px 0 0;position: absolute;left: .2em;top: 50%;margin-top: -8px;}
			ul#icons {margin: 0; padding: 0;}
			ul#icons li {margin: 2px; position: relative; padding: 4px 0; cursor: pointer; float: left;  list-style: none;}
			ul#icons span.ui-icon {float: left; margin: 0 4px;}
		</style>	
	</head>
	<body>
	 <form action="user_login" method="post" name="signup1">
            <table width="100%" border="0" align="right" cellpadding="0px" style="border-bottom:solid; border-top:solid; border-left:solid; border-right:solid;">
                <tr>
                    <td width="269"><img src="image/rjunctionlogo small.jpg"/></td>
                    <td width="720">&nbsp;</td>
                    <td width="51" valign="bottom"><input name="login" type="submit" value="logout" /></td>
                </tr>
            </table>
    </form>
	<p style="font-size: 1.2em; line-height: 1.5; margin: 1em 0; width: 50%;">&nbsp;</p>	

	<div id="tabs">
			<ul>
				<li><a href="#tabs-1">Profile</a></li>
				<li><a href="#tabs-2">Branches</a></li>
				<li><a href="#tabs-3">Menu</a></li>
				<li><a href="#tabs-4">Deals</a></li>
			</ul>
			<div id="tabs-1">
			<table border="0">
  <tr>
    <td>Restaurant Name</td>
    <td>...</td>
  </tr>
  <tr>
    <td>Email</td>
    <td><input type="text" name="textfield2" /></td>
  </tr>
  <tr>
    <td>Contact No. </td>
    <td><label>
      <input type="text" name="textfield" />
    </label></td>
  </tr>
  <tr>
    <td>Open Hours </td>
    <td>from
      <select name="select">
      </select>
to
<select name="select2">
</select>
or <a href="#">always open</a></td>
  </tr>
  <tr>
    <td>About</td>
    <td><textarea name="textarea" rows="3"> </textarea></td>
  </tr>
  <tr>
    <td>Website</td>
    <td><input type="textfield" name="website" /></td>
  </tr>
</table>

			</div>
			<div id="tabs-2">
			<form method="post" action="rest_branch">
		<table border="0" align="center" style="border:solid">
  <tr>
    <th width="54">No.</th>
    <th width="257">Address</th>
    <th width="144">Post Code</th>
    <th width="144">Contact no.</th>
    <th width="95">&nbsp;</th>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><textarea name="address" rows="3" cols="40" ></textarea></td>
    <td valign="bottom"><input type="text" name="postcode"></td>
    <td valign="bottom"><input type="text" name="phoneno"></td>
    <td valign="bottom">
      <input class="delRow" type="submit" name="Submit" value="Delete Branch">
    </td>
  </tr>
  <tr>
    <td colspan="5" align="right" style="border-top:solid; padding:7px">
      <input class="addRow" type="submit" name="Submit2" value="Add Another Branch">
    </td>
  </tr>
</table>
</form>

			</div>
			<div id="tabs-3">Nam dui erat, auctor a, dignissim quis, sollicitudin eu, felis. Pellentesque nisi urna, interdum eget, sagittis et, consequat vestibulum, lacus. Mauris porttitor ullamcorper augue.</div>
			<div id="tabs-4">Nam dui erat, auctor a, dignissim quis, sollicitudin eu, felis. Pellentesque nisi urna, interdum eget, sagittis et, consequat vestibulum, lacus. Mauris porttitor ullamcorper augue.</div>

	</div>
			
				
		
		
	</body>
</html>


