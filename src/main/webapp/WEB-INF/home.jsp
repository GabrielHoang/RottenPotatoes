<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/myCss.css"/>">
    <script src="scripts.js"></script>
    <meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1" />
    <title>Rotten Potatoes</title>
</head>
<body>
<div class="topnav" id="topnav">
    <a href="#home">Home</a>
    <a href="javascript:void(0)"class="dropbutton">Database</a>
    <div class="dropdown">
        <div class="dropdown-content">
            <a href="#">Link 1</a>
            <a href="#">Link 2</a>
            <a href="#">Link 3</a>
        </div>
    </div>

    <a href="#repertoir">Repertoir</a>
    <a href="#movies">Movies</a>
    <a href="#about">About</a>
    <a href="#contact">Contact</a>
    <div class="search-container">
        <form action="/needs_to_be_filled.jsp">
            <input type="text" placeholder="Search..." name="search" />
            <button type="submit"><i class="fa fa-search"></i></button>
        </form>
    </div>
    <a href="#signin">Sign In</a>
    <!--<a href="#account"><img src="https://gladstoneentertainment.com/wp-content/uploads/2018/05/avatar-placeholder.gif" alt="avatar" /></a>-->
    <a href="javascript:void(0);" class="hamburger" onclick="showHamburger()">
        <i class="fa fa-bars"></i>
    </a>

</div>
<div class="bodyWrapper">
    <div class="mainColumnWrapper">
        <div class="pageBox">
            <h2>Homepage</h2>
        </div>
    </div>
</div>

</body>
</html>