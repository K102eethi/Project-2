<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Hello World - CI/CD Demo</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f8ff;
            text-align: center;
            padding: 50px;
        }
        .container {
            background-color: white;
            border-radius: 10px;
            padding: 40px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            max-width: 600px;
            margin: 0 auto;
        }
        h1 {
            color: #333;
        }
        .button {
            background-color: #4CAF50;
            color: white;
            padding: 15px 25px;
            text-decoration: none;
            border-radius: 5px;
            margin: 10px;
            display: inline-block;
        }
        .button:hover {
            background-color: #45a049;
        }
        .info {
            background-color: #e7f3ff;
            border: 1px solid #b3d9ff;
            padding: 15px;
            margin: 20px 0;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>🎉 Welcome to My First CI/CD Project!</h1>
        
        <div class="info">
            <h3>What is this?</h3>
            <p>This is a simple Java web application that demonstrates:</p>
            <ul style="text-align: left; max-width: 400px; margin: 0 auto;">
                <li>✅ Git version control</li>
                <li>✅ Jenkins for automation</li>
                <li>✅ Ansible for deployment</li>
                <li>✅ Tomcat web server</li>
            </ul>
        </div>
        
        <p><strong>Current Date:</strong> <%= new java.util.Date() %></p>
        <p><strong>Status:</strong> 🟢 Application is running successfully!</p>
        
        <div>
            <a href="hello" class="button">Test My Servlet</a>
            <a href="#" onclick="location.reload()" class="button">Refresh Page</a>
        </div>
        
        <div style="margin-top: 30px; font-size: 14px; color: #666;">
            <p>🚀 Deployed automatically using Jenkins CI/CD Pipeline</p>
        </div>
    </div>
</body>
</html>
