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
@WebServlet(name = "user_registration", urlPatterns = {"/user_registration"})
public class user_registration extends HttpServlet {

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
                String fname = request.getParameter("fname");
                String lname = request.getParameter("lname");
                String email = request.getParameter("email");
                String gen = request.getParameter("gender");
                String gender = null;
                String location_country = request.getParameter("lcountry");
                String location_state = request.getParameter("lstate");
                String location_city = request.getParameter("lcity");
                String bdate = request.getParameter("bdate");
                String[] birthdate = bdate.split("-");
               
                if (gen.equals("male")) {
                    gender = "m";
                }
                if (gen.equals("female")) {
                    gender = "f";
                }
                if (fname.length() > 12 || fname == null) {
                    out.println("Your First Name is not valid");
                }
                if (lname.length() > 12) {
                    out.println("Your Last Name is not valid");
                }
                if (email == null) {
                    out.println("Your Password Should not be blank");
                }
                if (bdate == null) {
                    out.println("Please Enter Valid Birthdate");
                }
                if (location_country == null) {
                    out.println("please Enter your Location");
                }

                int i = statement.executeUpdate("INSERT INTO user_registration "
                        + "(user_fname,user_lname,user_email,user_gender,user_birthdate,user_location_country,user_location_state,user_location_city)"
                        + "VALUES"
                        + "('" + fname + "','" + lname + "','" + email + "','" + gender + "','" + birthdate[2] +"-"+birthdate[1]+"-"+birthdate[0]+ "','" + location_country + "','" + location_state + "','" + location_city +"')");
                session.setAttribute("email",email);
                if (i != 0) {
                    double x = 1000000 * Math.random();
                    int temppassword = (int) x;
                    SendingEmail e = new SendingEmail();
                    Boolean reply = e.send_email("restaurantjunction@gmail.com", "madamtussads",
                            email,"<h1>your password is "+temppassword+"</h1>");
                    int k = statement.executeUpdate("UPDATE user_registration "
                            + "SET user_password = " + temppassword
                            + ",user_status = 'n' where user_email ='"
                            + email + "'");
                    if (reply && k!=0) {
                        //out.println("<h1>Password is sent to your email..</h1>");
                        response.sendRedirect("verify.jsp");
                        
                    } else {
                        out.println("unsuccessful..!");
                    }
                    } else {
                    out.println("unsuccessful");
                }
            } catch (SQLException e) {
                out.println(e);
            } catch (ClassNotFoundException c) {
                out.println(c);
            } catch (NullPointerException n) {
                out.println(n);
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
