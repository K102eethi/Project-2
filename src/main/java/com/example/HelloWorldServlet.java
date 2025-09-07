package com.example;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

@WebServlet("/hello")
public class HelloWorldServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Set response type
        response.setContentType("text/html");
        
        // Get writer to send response
        PrintWriter out = response.getWriter();
        
        // Get current date
        Date currentDate = new Date();
        
        // Send HTML response
        out.println("<html>");
        out.println("<head><title>Hello World Servlet</title></head>");
        out.println("<body>");
        out.println("<h1>Hello World from Servlet!</h1>");
        out.println("<h2>CI/CD Pipeline Works!</h2>");
        out.println("<p>Current time: " + currentDate + "</p>");
        out.println("<p>This page was created by a Java Servlet</p>");
        out.println("<a href='../hello-world/'>Go Back to Home</a>");
        out.println("</body>");
        out.println("</html>");
    }
}
