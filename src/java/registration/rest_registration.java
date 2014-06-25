/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package registration;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import temp.SendingEmail;

/**
 *
 * @author v
 */
@WebServlet(name = "rest_registration", urlPatterns = {"/rest_registration"})
public class rest_registration extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rj", "root", "root");
            Statement statement = con.createStatement();
            HttpSession session = request.getSession(true);
            String rname = request.getParameter("rname");
            String location_country = request.getParameter("lcountry");
            String location_state = request.getParameter("lstate");
            String location_city = request.getParameter("lcity");
            String remail = request.getParameter("remail");
            
            if (rname.length() > 30 || rname == null) {
                    out.println("Your Restaurant Name is not valid");
                }
            if (location_country.length() > 30 || location_country == null) {
                    out.println("Your country is not valid");
                }
            if (location_state.length() > 30 || location_state == null) {
                    out.println("Your state is not valid");
                }
            if (location_city.length() > 30 || location_city == null) {
                    out.println("Your city is not valid");
                }
            if (remail.length() > 30 || remail == null) {
                    out.println("Your email is not valid");
                }
int i = statement.executeUpdate("INSERT INTO rest_registration "
                        + "(rest_name,rest_location_country,rest_location_state,rest_location_city,rest_email)"
                        + "VALUES"
                        + "('" + rname + "','" + location_country + "','" + location_state + "','" + location_city + "','" + remail +"')");
 if (i != 0) {
                    double x = 1000000 * Math.random();
                    int temppassword = (int) x;
                    SendingEmail e = new SendingEmail();
                    Boolean reply = e.send_email("restaurantjunction@gmail.com", "madamtussads",
                            remail,"<h1>your password is "+temppassword+"</h1>");
                    int k = statement.executeUpdate("UPDATE rest_registration "
                            + "SET rest_password = " + temppassword
                            + ",rest_status = 'n' where rest_email ='"
                            + remail + "'");
                    if (reply && k!=0) {
                        out.println("<h1>Password is sent to your email..</h1>");
                        session.setAttribute("xyz",temppassword);
                        response.sendRedirect("xyz.html");
                    } else {
                        out.println("unsuccessful..!");
                    }
 }
        } catch (SQLException e) {
            out.println(e);
        } catch (ClassNotFoundException c) {
            out.println(c);
        } catch (NullPointerException n) {
            out.println(n);
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
