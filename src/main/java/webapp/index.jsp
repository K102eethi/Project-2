<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
    // Get current date and time
    Date currentDate = new Date();
    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String formattedDate = formatter.format(currentDate);
    
    // Get server info
    String serverInfo = application.getServerInfo();
    String javaVersion = System.getProperty("java.version");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CI/CD Pipeline Demo - Welcome</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #ff6b6b, #4ecdc4, #45b7d1, #96ceb4);
            background-size: 400% 400%;
            animation: gradientShift 8s ease infinite;
            color: white;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }
        
        @keyframes gradientShift {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }
        
        .container {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 25px;
            padding: 50px;
            max-width: 800px;
            text-align: center;
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.1);
            animation: floatUp 0.8s ease-out;
        }
        
        @keyframes floatUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        .logo {
            font-size: 5em;
            margin-bottom: 20px;
            animation: bounce 2s ease-in-out infinite;
        }
        
        @keyframes bounce {
            0%, 20%, 50%, 80%, 100% { transform: translateY(0); }
            40% { transform: translateY(-10px); }
            60% { transform: translateY(-5px); }
        }
        
        h1 {
            font-size: 3.5em;
            margin-bottom: 15px;
            text-shadow: 3px 3px 6px rgba(0, 0, 0, 0.3);
            background: linear-gradient(45deg, #fff, #f0f0f0);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }
        
        .subtitle {
            font-size: 1.3em;
            margin-bottom: 30px;
            opacity: 0.9;
            font-weight: 300;
        }
        
        .info-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin: 30px 0;
        }
        
        .info-card {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 15px;
            padding: 25px;
            border: 1px solid rgba(255, 255, 255, 0.2);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        
        .info-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
        }
        
        .info-card h3 {
            font-size: 1.2em;
            margin-bottom: 10px;
            color: #ffd700;
        }
        
        .info-card p {
            font-size: 1em;
            line-height: 1.5;
        }
        
        .tech-stack {
            margin: 30px 0;
        }
        
        .tech-items {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 15px;
            margin-top: 20px;
        }
        
        .tech-item {
            background: rgba(255, 255, 255, 0.2);
            padding: 10px 20px;
            border-radius: 25px;
            font-size: 0.9em;
            border: 1px solid rgba(255, 255, 255, 0.3);
            transition: all 0.3s ease;
        }
        
        .tech-item:hover {
            background: rgba(255, 255, 255, 0.3);
            transform: scale(1.05);
        }
        
        .buttons {
            margin-top: 40px;
        }
        
        .btn {
            background: linear-gradient(45deg, rgba(255, 255, 255, 0.2), rgba(255, 255, 255, 0.1));
            color: white;
            padding: 15px 30px;
            text-decoration: none;
            border-radius: 50px;
            display: inline-block;
            margin: 10px;
            transition: all 0.3s ease;
            border: 2px solid rgba(255, 255, 255, 0.3);
            font-weight: 500;
            text-transform: uppercase;
            letter-spacing: 1px;
            position: relative;
            overflow: hidden;
        }
        
        .btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: left 0.5s;
        }
        
        .btn:hover::before {
            left: 100%;
        }
        
        .btn:hover {
            background: rgba(255, 255, 255, 0.3);
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }
        
        .btn.primary {
            background: linear-gradient(45deg, #ff6b6b, #ee5a24);
            border-color: #ff6b6b;
        }
        
        .btn.secondary {
            background: linear-gradient(45deg, #4ecdc4, #26de81);
            border-color: #4ecdc4;
        }
        
        .footer {
            margin-top: 30px;
            font-size: 0.9em;
            opacity: 0.7;
        }
        
        @media (max-width: 768px) {
            .container {
                padding: 30px;
                margin: 10px;
            }
            
            h1 {
                font-size: 2.5em;
            }
            
            .logo {
                font-size: 3em;
            }
            
            .info-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="logo">🚀</div>
        <h1>Welcome to CI/CD Demo</h1>
        <p class="subtitle">Automated Deployment Pipeline in Action</p>
        
        <div class="info-grid">
            <div class="info-card">
                <h3>⏰ Current Time</h3>
                <p><%= formattedDate %></p>
            </div>
            
            <div class="info-card">
                <h3>🖥️ Server Info</h3>
                <p><%= serverInfo %></p>
            </div>
            
            <div class="info-card">
                <h3>☕ Java Version</h3>
                <p><%= javaVersion %></p>
            </div>
            
            <div class="info-card">
                <h3>📊 Status</h3>
                <p>✅ Deployment Successful</p>
            </div>
        </div>
        
        <div class="tech-stack">
            <h3>🛠️ Technology Stack</h3>
            <div class="tech-items">
                <span class="tech-item">☕ Java 11</span>
                <span class="tech-item">🔧 Maven</span>
                <span class="tech-item">🐙 Git</span>
                <span class="tech-item">🔄 Jenkins</span>
                <span class="tech-item">📦 Ansible</span>
                <span class="tech-item">🐱 Apache Tomcat</span>
                <span class="tech-item">🎯 JSP/Servlets</span>
            </div>
        </div>
        
        <div class="buttons">
            <a href="hello" class="btn primary">🎯 Test Servlet</a>
            <a href="#" onclick="location.reload(); return false;" class="btn secondary">🔄 Refresh Page</a>
        </div>
        
        <div class="footer">
            <p>🎉 This application was automatically deployed using Jenkins CI/CD Pipeline</p>
            <p>Built with ❤️ for DevOps Learning</p>
        </div>
    </div>

    <script>
        // Add some interactivity
        document.addEventListener('DOMContentLoaded', function() {
            // Animate tech items on load
            const techItems = document.querySelectorAll('.tech-item');
            techItems.forEach((item, index) => {
                setTimeout(() => {
                    item.style.transform = 'scale(1.1)';
                    setTimeout(() => {
                        item.style.transform = 'scale(1)';
                    }, 200);
                }, index * 100);
            });
            
            // Add click effect to buttons
            const buttons = document.querySelectorAll('.btn');
            buttons.forEach(button => {
                button.addEventListener('click', function(e) {
                    // Create ripple effect
                    const ripple = document.createElement('div');
                    ripple.style.position = 'absolute';
                    ripple.style.borderRadius = '50%';
                    ripple.style.background = 'rgba(255, 255, 255, 0.6)';
                    ripple.style.transform = 'scale(0)';
                    ripple.style.animation = 'ripple 0.6s linear';
                    ripple.style.left = (e.clientX - button.offsetLeft) + 'px';
                    ripple.style.top = (e.clientY - button.offsetTop) + 'px';
                    
                    button.appendChild(ripple);
                    
                    setTimeout(() => {
                        ripple.remove();
                    }, 600);
                });
            });
        });
    </script>
    
    <style>
        @keyframes ripple {
            to {
                transform: scale(4);
                opacity: 0;
            }
        }
    </style>
</body>
</html>
