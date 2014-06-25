<html>
    <head>
        <title>Profile</title>
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
            input.groovybutton
            {
                font-size:14px;
                font-family:Arial Black,sans-serif;
                font-weight:bold;
                width:70px;
                height:30px;
                background-color:#6699FF;
                border-style:outset;
                border-color:#66CCFF;
                border-width:2px;
            }
            div.header {
                background-image:url(file:///H|/project/Rushabh/Restaurant Admin/dfdfdf.jpg);
                background-repeat:repeat;
                margin-left:10%;
                position: absolute;
                top: 15px;
                padding: 0px;
                width: 79%;
                border: 1px  dashed #666666;
                background-color:#00DF00;
                left: 9px;
            }
            div.left {
                background-image:url(file:///H|/project/Rushabh/Restaurant Admin/cherry-wood.jpg);
                background-repeat:repeat;
                margin-left:10%;
                position: absolute;
                top: 120px;
                width:17%;
                border: 1px  dashed #666666;
                min-height:800px;

            }	
            div.main {
                background-image:url(file:///H|/project/Rushabh/Restaurant Admin/omsilk-paper1049588009.jpg);
                background-repeat:repeat;
                min-height:800px;
                margin-left:28%;
                position: absolute;
                top: 120px;
                width: 61%;
                border: 1px  dashed #666666;
                background-color:#00DF00;
            }	
            .style1 {
                font-family: Arial, Helvetica, sans-serif;
                font-weight: bold;
                font-size: 18px;
            }
            .style2 {
                font-family: Geneva, Arial, Helvetica, sans-serif;
                font-size: 24px;
                font-weight: bold;
                color: #003300;
            }
            .style5 {font-weight: bold; font-family: Arial, Helvetica, sans-serif;}
            .style8 {color: #003300; font-family: Arial, Helvetica, sans-serif; font-weight: bold; }
            .style10 {color: #FFFFFF}
            .style12 {
                font-family: Geneva, Arial, Helvetica, sans-serif;
                font-size: 24px;
                font-weight: bold;
                color: 006600;
            }
        </style>
        <script language="javascript">

            function goLite(FRM,BTN)
            {
                window.document.forms[FRM].elements[BTN].style.color = "#000000";
                window.document.forms[FRM].elements[BTN].style.backgroundColor = "#CC66CC";
            }

            function goDim(FRM,BTN)
            {
                window.document.forms[FRM].elements[BTN].style.color = "";
                window.document.forms[FRM].elements[BTN].style.backgroundColor = "#006600";
            }

        </script>
    </head>

    <body background="file:///H|/project/Rushabh/Restaurant Admin/isolated-green-beer-bottle-background-thumb12189206.jpg" style="background-repeat:repeat">
        <div class="header" align="right" style="padding:0" ><table width="270" border="0" cellpadding="0">
                <tr>
                    <td width="12" height="51">&nbsp;</td>
                    <td width="252"><img src="file:///H|/project/Rushabh/Restaurant Admin/Picture2.jpg" /></td>
                </tr>
            </table>

        </div>
        <div class="left">
            <!-- Accordion -->
            <div id="accordion">
                <div>
                    <h3><a href="#">Profile</a></h3>
                    <div><a href="myhomepage.jsp?mid=1">Edit Profile</a></div>
                </div>
                <div>
                    <h3><a href="#">Branches</a></h3>
                    <div><a href="myhomepage.jsp?mid=3">Add Branch</a></div>
                </div>
                <div>
                    <h3><a href="?mid=4">Menu</a></h3>
                    <div><a href="?mid=5">Add Menu</a></div>
				</div>
				<div>
                    <h3><a href="?mid=6">Deals</a></h3>
                    <div><a href="?mid=7">Add Deal</a></div>
				</div>
					
            </div>

        </div>
        <div class="main">
            <%
                int mid = Integer.parseInt(request.getParameter("mid"));
                if (mid == 1) {
            %>    
            <%@include file="rest_editprofile.jsp" %>
            <%        }
                if (mid == 3) {
            %>    
            <%@include file="rest_editprofile.jsp" %>
            <%        }
            %>
			
        </div>
    </body>
</html>