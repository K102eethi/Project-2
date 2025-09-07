package com.example;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet("/hello")
public class HelloWorldServlet extends HttpServlet {
    
    private static final String HTML_TEMPLATE = """
        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Hello World - CI/CD Demo</title>
            <style>
                * {
                    margin: 0;
                    padding: 0;
                    box-sizing: border-box;
                }
                
                body {
                    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                    background: linear-gradient(135deg, #667eea 0%%, #764ba2 100%%);
                    color: white;
                    min-height: 100vh;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    padding: 20px;
                }
                
                .container {
                    background: rgba(255, 255, 255, 0.1);
                    backdrop-filter: blur(20px);
                    border: 1px solid rgba(255, 255, 255, 0.2);
                    border-radius: 20px;
                    padding: 40px;
                    max-width: 600px;
                    text-align: center;
                    box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
                }
                
                .emoji {
                    font-size: 4em;
                    margin-bottom: 20px;
                    display: block;
                }
                
                h1 {
                    font-size: 2.5em;
                    margin-bottom: 10px;
                    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
                }
                
                h2 {
                    font-size: 1.5em;
                    margin-bottom: 20px;
                    opacity: 0.9;
                }
                
                .info {
                    background: rgba(255, 255, 255, 0.1);
                    border-radius: 10px;
                    padding: 20px;
                    margin: 20px 0;
                }
                
                .tech-list {
                    text-align: left;
                    display: inline-block;
                    margin: 20px 0;
                }
                
                .tech-list li {
                    margin: 10px 0;
                    font-size: 1.1em;
                    list-style: none;
                }
                
                .time {
                    font-size: 1.2em;
                    font-weight: bold;
                    color: #ffd700;
                    margin: 20px 0;
                }
                
                .btn {
                    background: rgba(255, 255, 255, 0.2);
                    color: white;
                    padding: 12px 25px;
                    text-decoration: none;
                    border-radius: 25px;
                    display: inline-block;
                    margin: 10px;
                    transition: all 0.3s ease;
                    border: 2px solid rgba(255, 255, 255, 0.3);
                    cursor: pointer;
                }
                
                .btn:hover {
                    background: rgba(255, 255, 255, 0.3);
                    transform: translateY(-2px);
                    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
                }
                
                @keyframes fadeIn {
                    from { opacity: 0; transform: translateY(20px); }
                    to { opacity: 1; transform: translateY(0); }
                }
                
                .container {
                    animation: fadeIn 0.8s ease-out;
                }
            </style>
        </head>
        <body>
            <div class="container">
                <span class="emoji">🎉</span>
                <h1>Hello World!</h1>
                <h2>CI/CD Pipeline Success!</h2>
                
                <div class="info">
                    <div class="time">Deployed at: %s</div>
                    <p>This application was automatically deployed using:</p>
                    <ul class="tech-list">
                        <li>✅ Git for version control</li>
                        <li>✅ Jenkins for continuous integration</li>
                        <li>✅ Ansible for automated deployment</li>
                        <li>✅ Apache Tomcat as web server</li>
                        <li>✅ Maven for build management</li>
                    </ul>
                </div>
                
                <div>
                    <a href="../hello-world/" class="btn">🏠 Home</a>
                    <a href="#" onclick="location.reload()" class="btn">🔄 Refresh</a>
                </div>
            </div>
        </body>
        </html>
        """;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        // Get current timestamp
        String currentTime = LocalDateTime.now()
            .format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        
        // Write response
        try (PrintWriter out = response.getWriter()) {
            out.printf(HTML_TEMPLATE, currentTime);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
}
