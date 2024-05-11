<link rel="stylesheet" href="style/style.css">
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">E-Commerce Cart</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse"
            data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
    
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="cart.jsp">Cart <span class="badge badge-danger">${cart_list.size()}</span> </a></li>
                <% if (auth != null) { %>
                    <li class="nav-item"><a class="nav-link" href="orders.jsp">Orders</a></li>
                    <nav>
                        <img src="images/1.png" class="user-pic" onclick="toggleMenu()">
                        <div class="sub-menu-wrap" id="subMenu"> 
                            <div class="sub-menu">
                                <div class="user-info">
                                    <!-- User Info here -->
                                </div>
                                <hr>
                                <a href="edit.jsp" class="sub-menu-link">
                                    <img src="images/profile.png">
                                    <p>Edit Profile</p>
                                    <span>></span>
                                </a>
                                <a href="log-out" class="sub-menu-link">
                                    <img src="images/logout.png">
                                    <p>Logout</p>
                                    <span>></span>
                                </a>
                            </div>
                        </div>
                    </nav>
                <% } else { %>
                    <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                    <li class="nav-item"><a class="nav-link" href="register.jsp">Register</a></li>
                <% } %>
            </ul>
        </div>
    </div>
</nav>

<script>
    let subMenu = document.getElementById("subMenu");
    function toggleMenu(){
        subMenu.classList.toggle("open-menu");
    }
</script>
