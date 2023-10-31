/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.test.custom;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

/**
 *
 * @author akshaydatir
 */
public class CustomHandler extends SimpleTagSupport {

    String csvData;

    public CustomHandler() {

    }

    public CustomHandler(String csvData) {
        this.csvData = csvData;
    }

    public String getCsvData() {
        return csvData;
    }

    public void setCsvData(String csvData) {
        this.csvData = csvData;
    }

    @Override
    public void doTag() throws JspException, IOException {

        JspWriter out = getJspContext().getOut();

        out.print("Hello from Akshay!!!! " + csvData);
        ResultSet rs = null;

        try {

            String csvDirectory = "/Users/akshaydatir/NetBeansProjects/HW3-part9/src/main/webapp/WEB-INF/csv/";
            Class.forName("org.relique.jdbc.csv.CsvDriver");
            Connection conn = DriverManager.getConnection("jdbc:relique:csv:" + csvDirectory);
            Statement stmt = conn.createStatement();

            rs = stmt.executeQuery("SELECT * FROM " + csvData);
            
            List<String[]> csvData1 = new ArrayList<>();
            while (rs.next()) {

                String[] string1 = new String[12];
                string1[0] = rs.getString("Facility Type");
                string1[1] = rs.getString("License Number");
                string1[2] = rs.getString("Entity Name");
                string1[3] = rs.getString("Camis Trade Name");
                string1[4] = rs.getString("Address Bldg");
                string1[5] = rs.getString("Address Street Name");
                string1[6] = rs.getString("Address Location");
                string1[7] = rs.getString("Address City");
                string1[8] = rs.getString("Address State");
                string1[9] = rs.getString("Address Zip Code");
                string1[10] = rs.getString("Telephone Number");
                string1[11] = rs.getString("Number of Spaces");
                csvData1.add(string1);
            }
            
        

                    out.print("<table border='1'>");
                    out.print("<tr>");
                    out.print("<th>Facility Type</th>");
                    out.print("<th>License Number</th>");
                    out.print("<th>Entity Name</th>");
                    out.print("<th>Camis Trade Name</th>");
                    out.print("<th>Address Bldg</th>");
                    out.print("<th>Address Street Name</th>");
                    out.print("<th>Address Location</th>");
                    out.print("<th>Address City</th>");
                    out.print("<th>Address State</th>");
                    out.print("<th>Address Zip Code</th>");
                    out.print("<th>Telephone Number</th>");
                    out.print("<th>Number of Spaces</th>");
                    out.print("</tr>");
                    out.print("<tr>");
                    for (String[] row : csvData1) {
                        
                        
                        for (String cell : row) {
                            out.print("<td>" + cell + "</td>");
                        }
                        out.print("</tr>");
                    }
                    
                    out.print("<br>");
                    out.print("</table>");
                    
                
        } catch (SQLException ex) {
            Logger.getLogger(CustomHandler.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CustomHandler.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
