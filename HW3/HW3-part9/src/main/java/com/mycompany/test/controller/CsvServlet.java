/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.test.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

/**
 *
 * @author akshaydatir
 */
@WebServlet(name = "CsvServlet", urlPatterns = {"/CsvServlet.xls"})
public class CsvServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, Exception {

        HttpSession session = request.getSession();
        String input = request.getParameter("input");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        if (input == null) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CsvServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<form action=/HW3/CsvServlet.xls method=post>");
            out.println("<h1>Hello !!!!</h1>");
            out.println("<label for=" + "file" + ">Enter CSV file name :</label>");
            out.println("<input type=" + "text" + " id=" + "input" + " name=" + "input" + " required>");
            out.println("<input type=" + "submit" + " value=" + "Submit" + ">");
            out.println("</form>");
            out.println("</body>");
            out.println("</html>");
            
        } else if (input.equals("parking")) {
            
            

            request.setAttribute("csvData", input);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/csv.jsp");
            dispatcher.forward(request, response);

        } else {
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CsvServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Invalid</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("Invalid CSV File Name ");
            out.println("</body>");
            out.println("</html>");

        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(CsvServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(CsvServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
