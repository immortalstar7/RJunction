<%-- 
    Document   : rest_menuadd
    Created on : Mar 2, 2012, 2:46:53 PM
    Author     : v
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="javazoom.upload.*,java.util.*" %>
<%@ page errorPage="ExceptionHandler.jsp" %>

<!DOCTYPE html>
<html>
    <jsp:useBean id="upBean" scope="page" class="javazoom.upload.UploadBean" >
  <jsp:setProperty name="upBean" property="folderstore" value="c:/uploads" />
  <jsp:setProperty name="upBean" property="parser" value="<%= MultipartFormDataRequest.CFUPARSER %>"/>
  <jsp:setProperty name="upBean" property="parsertmpdir" value="c:/temp"/>
  <jsp:setProperty name="upBean" property="overwritepolicy" value="nametimestamp" />
</jsp:useBean>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="script/jquery-1.7.1.js"></script>
        <script type="text/javascript" src="script/jquery.table.addrow.js"></script>
        <script type="text/javascript">
            (function($){
                $(document).ready(function(){
                    $(".addRow").btnAddRow();
                    $(".delRow").btnDelRow();
                });
            })(jQuery);
        </script>
    </head>
    <body>
        <h2>Upload Menu:</h2>
<%
      if (MultipartFormDataRequest.isMultipartFormData(request))
      {
         // Uses MultipartFormDataRequest to parse the HTTP request.
         MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);
         String todo = null;
         if (mrequest != null) todo = mrequest.getParameter("todo");
	     if ( (todo != null) && (todo.equalsIgnoreCase("upload")) )
	     {
            Hashtable files = mrequest.getFiles();
            if ( (files != null) && (!files.isEmpty()) )
            {
                UploadFile file = (UploadFile) files.get("uploadfile");
                if (file != null) out.println("<li>Form fields : uploadfile"+"<BR> Uploaded file : "+file.getFileName()+" ("+file.getFileSize()+" bytes)"+"<BR> Content Type : "+file.getContentType());
                // Uses the bean now to store specified by jsp:setProperty at the top.
                upBean.store(mrequest, "uploadfile");
               
            }
            else
            {
               out.println("<li>No uploaded files");
            }
		    
	     }
         else out.println("<BR> todo="+todo);
      }
%>
        
        <form action="rest_menuadd.jsp" method="post" name="upForm" enctype="multipart/form-data">
        <input type="hidden" name="todo" value="upload">
        
            <table border="1">
                <tr>
                    <td><label>
                            <input type="file" name="uploadfile" size="50">
                        </label></td>
                    <td><label>
                            <input type="button" name="Submit" value="Add Another Menu Page" class="addRow"/>
                        </label></td>
                    <td><label>
                            <input type="button" name="Submit2" value="Delete Menu Page" class="delRow"/>
                        </label></td>
                </tr>
                <tr>
                    <td colspan="3" align="right"><input type="submit" value="Upload"/></td>
                </tr>
            </table>   
        </form>
    </body>
</html>