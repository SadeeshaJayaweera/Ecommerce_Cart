<%-- 
    Document   : index
    Created on : Apr 28, 2024, 7:32:22 PM
    Author     : mnuwa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="style/style.css">

</head>
<body>
    <div class="hero">
        <nav>
            <img src="images/logo.png" class="logo">
            <ul>
                <li><a href="#">Home</a></li>
                <li><a href="#">Features</a></li>
                <li><a href="#">About</a></li>
                <li><a href="#">Contact Us</a></li>
            </ul>
            <img src="images/user.png" class="user-pic" onclick="toggleMenu()">
            <div class="sub-menu-wrap" id="subMenu"> 
                <div class="sub-menu">
                    <div class="user-info">
                        <img src="images/user.png">
                        <h3>Nuwan</h3>
                    </div>
                    <hr>
                    <a href="edit.jsp" class="sub-menu-link">
                        <img src="images/profile.png">
                        <p>Edit Profile</p>
                        <span>></span>
                    </a>
                      <a href="#" class="sub-menu-link">
                        <img src="images/logout.png">
                        <p>Logout</p>
                        <span>></span>
                    </a>
                </div>
            </div>
        </nav>
    </div>
    <script>
        let subMenu = document.getElementById("subMenu");
        function toggleMenu(){
            subMenu.classList.toggle("open-menu");
        }
    </script>
</body>
</html>
