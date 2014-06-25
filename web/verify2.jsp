<%-- 
    Document   : newjsp1
    Created on : Feb 28, 2012, 8:15:29 PM
    Author     : v
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
        String email = request.getParameter("email");
        String temppassword = request.getParameter("temppassword");
        String txtpassword = request.getParameter("txtpassword");
        if(temppassword==txtpassword)
                       {
             response.sendRedirect("home.jsp");
                       }
               else{
            out.println("password is not valid");
        }
        %>
    </body>
</html>
