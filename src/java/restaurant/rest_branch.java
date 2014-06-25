/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package restaurant;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.jms.Session;
import javax.servlet.http.HttpSession;

/**
 *
 * @author v
 */
public class rest_branch extends HttpServlet {

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
            String[] rest_address = request.getParameterValues("address");
            String[] rest_postcode = request.getParameterValues("postcode");
            String[] rest_phoneno = request.getParameterValues("phoneno");
            String q;
            String rest_id = (String) session.getAttribute("rest_id");
            for (int i = 0; i < rest_address.length; i++) {
                q = "insert into rest_branch(rest_id,branch_address,branch_postcode,branch_phoneno) values('" +rest_id +"','" + rest_address[i] + "','" + rest_postcode[i] + "','" + rest_phoneno[i] + "')";
                statement.executeQuery(q);
                
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
