<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<title>jQuery UI Example Page</title>
		<link type="text/css" href="styles/jquery-ui-1.8.18.custom.css" rel="stylesheet" />	
		<script type="text/javascript" src="script/jquery-1.7.1.js"></script>
		<script type="text/javascript" src="script/jquery-ui-accordian.js"></script>
		<script type="text/javascript">
			$(function(){

				// Accordion
				$("#accordion").accordion({ header: "h3" });
				
				//hover states on the static widgets
				$('#dialog_link, ul#icons li').hover(
					function() { $(this).addClass('ui-state-hover'); }, 
					function() { $(this).removeClass('ui-state-hover'); }
				);
				
			});
		</script>
		<style type="text/css">
			/*demo page css*/
			body{ font: 62.5% "Trebuchet MS", sans-serif;}
			.demoHeaders { margin-top: 2em; }
			#dialog_link {padding: .4em 1em .4em 20px;text-decoration: none;position: relative;}
			#dialog_link span.ui-icon {margin: 0 5px 0 0;position: absolute;left: .2em;top: 50%;margin-top: -8px;}
			ul#icons {margin: 0; padding: 0;}
			ul#icons li {margin: 2px; position: relative; padding: 4px 0; cursor: pointer; float: left;  list-style: none;}
			ul#icons span.ui-icon {float: left; margin: 0 4px;}
		</style>	
	</head>
	<body>

	<!-- Accordion -->
		<div id="accordion" style="width:20%; margin-left:5%; margin-top:60px">
			<div>
				<h3><a href="#">Profile</a></h3>
				<div><a href="accordian_home.jsp?mid=1">Edit Profile</a></div>
			</div>
			<div>
				<h3><a href="#">Second</a></h3>
				<div>Phasellus mattis tincidunt nibh.</div>
			</div>
			<div>
				<h3><a href="#">Third</a></h3>
				<div>Nam dui erat, auctor a, dignissim quis.</div>
			</div>
	</div>
			

	</body>
</html>


