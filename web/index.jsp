<!DOCTYPE html>
<html>
    <head>
        <title>Welcome to R Junction</title>
        <link href="styles/jquery.datepick.css" rel="stylesheet" type="text/css" media="all" />
        <script type="text/javascript" src="script/jquery-1.7.1.js"></script>
        <script type="text/javascript" src="script/jquery.validate.js"></script>
        <script type="text/javascript" src="script/jquery.datepick.js"></script>
        <style>
            label.error {
                color: #FF0000;
            }
        </style>
        <script type="text/javascript">
            $(document).ready(function(){
                $('#terms').hide(); 
                $("#signupform").validate({
            
                    rules: {
                
                        fname: {
                            required: true
                        },
                        email: {
                            required: true,
                            email: true
                        },
                        verifyemail: {
                            equalTo: "#email"
                        },
                
                        bdate: {
                            required: true
                        },
                        terms: {
                            required: true
                        }
                        
                    } 
                });
                $('#bdate').datepick({dateFormat: 'dd-mm-yyyy'});
            }
        );
        </script>
    </head>

    <body>
	<p align="right"><a href="rest_signup.html">Click here</a> for Restaurant SignUp
        <form action="user_login" method="post" name="signup1">
            <table width="95%" border="0" align="right" cellpadding="0px" style="border-bottom:solid; border-top:solid; border-left:solid; border-right:solid;">
                <tr>
                    <td width="162" rowspan="2"><img src="image/rjunctionlogo small.jpg"/></td>
                    <td width="524" rowspan="2">&nbsp;</td>
                    <td width="56"><div align="right"><strong>Email</strong></div></td>
                    <td width="149" align="center"><input type="text" name="txtemail" /></td>
                    <td width="1">&nbsp;</td>
                    <td width="64"><strong>Password</strong></td>
                    <td width="144"><input type="password" name="txtpassword" /></td>
                    <td width="45" rowspan="2" valign="top"><input name="login" type="submit" value="login" /></td>
                </tr>
                <tr>
                    <td height="24" colspan="2"  align="right"><a href="">forgotten your password? </a></td>
                    <td height="24" colspan="3" align="right"><input type="checkbox" name="checkbox2" value="checkbox" />Remember me </td>
                </tr>
            </table>
        </form>

        <br/><br/><br/><br/>

        <form id="signupform" action="user_registration" method="post" name="SIGNUP">
          <table width="540" cellpadding="3px" border="0" align="right" style="border-bottom:solid; border-top:solid; border-left:solid; border-right:solid;">
            <tr>
              <td colspan="3" style="border-bottom:solid; padding:0px;"><h2>User Signup:</h2> </td>
            </tr>
            <tr>
              <td width="124"><strong>First Name</strong> </td>
              <td colspan="2"><input type="text" name="fname" /></td>
            </tr>
            <tr>
              <td><strong>Last Name</strong> </td>
              <td colspan="2"><input type="text" name="lname" /></td>
            </tr>
            <tr>
              <td colspan="3"><em>Password will be sent to your email ...! </em></td>
            </tr>
            <tr>
              <td><strong>Email</strong></td>
              <td colspan="2"><input type="text" name="email" id="email"/></td>
            </tr>
            <tr>
              <td><strong>Re-enter email</strong> </td>
              <td colspan="2"><input type="text" name="verifyemail" /></td>
            </tr>
            <tr>
              <td><strong>Birth-date</strong></td>
              <td colspan="2" align="left"><input type="textfield" name="bdate" id="bdate"></td>
            </tr>
            <tr>
              <td><strong>Gender</strong></td>
              <td colspan="2"><input name="gender" type="radio" value="male" checked="checked" />
                Male
                  <input name="gender" type="radio" value="female" />
                Female </td>
            </tr>
            <tr>
              <td rowspan="3"><strong>Location</strong></td>
              <td width="63" align="right">Country:</td>
              <td width="313"><input  type="text" name="lcountry"></td>
            </tr>
            <tr>
              <td align="right">State:</td>
              <td><input  type="text" name="lstate"></td>
            </tr>
            <tr>
              <td align="right">City:</td>
              <td><input  type="text" name="lcity"></td>
            </tr>
            <tr>
              <td  align="center">&nbsp;</td>
              <td colspan="2"  align="left"><input type="checkbox" name="terms" value="checkbox" />
                Agree to <a href="Termsandconditions.html"> Terms & Conditions</a> <br>
                <label id="terms" for="terms" class="error">Agree to our terms and conditions</label>              </td>
            </tr>
            <tr>
              <td colspan="3" align="center"><input name="reset" type="reset" value="Reset" />
                  <input type="submit" value="Submit" name="Submit" /></td>
            </tr>
          </table>
        </form>
        </br></br></br></br>

        <table width="95%" cellpadding="4px" border="0" align="right" style="border-bottom:solid; border-top:solid; border-left:solid; border-right:solid;">
            <td align="center">
                <a href="">about us</a> . <a href="privacypolicy.html">privacy policy</a> . <a href="Termsandconditions.html">terms & conditions</a> . <a href="contactus.html">contact us</a> . <a href="">help</a></td></table>

    </body>
</html>