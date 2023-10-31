/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.hw3.part6;

import com.mycompany.hw3.model.Movie;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author akshaydatir
 */
@WebServlet(name = "MovieServlet", urlPatterns = {"/MovieServlet.htm"})
public class MovieServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String param = request.getParameter("browse");
        String addMovie = request.getParameter("param");
        
        if (param.equals("browse")) {
            RequestDispatcher rd = request.getRequestDispatcher("/browse.html");
            rd.forward(request, response);
        } else if (param.equals("add")) {
            RequestDispatcher rd = request.getRequestDispatcher("/add.html");
            rd.forward(request, response);
        } else if(param.equals("addMovie")){
           
            Movie movie = new Movie();
            movie.setTitle(request.getParameter("title"));
            movie.setActor(request.getParameter("actor"));
            movie.setActress(request.getParameter("actress"));
            movie.setGenre(request.getParameter("genre"));
            movie.setYear(Integer.parseInt(request.getParameter("Year")));
            
            request.setAttribute("movie", movie);
            RequestDispatcher rd = request.getRequestDispatcher("/addMovie.jsp");
            rd.forward(request, response);
        }else if(param.equals("search")){
            
            String keyword = request.getParameter("keyword");
            String searchType = request.getParameter("searchType");
            request.setAttribute("searchType", searchType);
            request.setAttribute("keyword", keyword);
            RequestDispatcher rd = request.getRequestDispatcher("/search.jsp");
            rd.forward(request, response);
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
        processRequest(request, response);
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
        processRequest(request, response);
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
