<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link rel="shortcut icon" href="https://imgur.com/JXZUiWz.jpg"/>
    <%--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />--%>
    <link rel="stylesheet" type="text/css" href="<c:url value="${pageContext.request.contextPath}resources/myCss.css"/>">
    <%--<script src="../scripts.js"></script>--%>
    <meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1" />
    <title>Rotten Potatoes</title>
</head>
<body>
    <div class="topnav" id="topnav">
        <ul>
            <li><a href="#home">Home</a></li>
            <li class="dropdown">
                <a href="javascript:void(0)"class="dropbutton">Database</a>
                <!--<div class="dropdown-content">
                    <a href="#">Link 1</a>
                    <a href="#">Link 2</a>
                    <a href="#">Link 3</a>
                </div>-->
            </li>
            <li><a href="#repertoir">Repertoir</a></li>
            <li><a href="#movies">Movies</a></li>
            <li><a href="#about">About</a></li>
            <li><a href="#contact">Contact</a></li>
            <div class="search-container">
                <form action="/needs_to_be_filled.jsp">
                    <input type="text" placeholder="Search..." name="search" />
                    <button type="submit"><i class="fa fa-search"></i></button>
                </form>
            </div>
            <li class="login-container">
                <a href="#signin">Sign In</a>
                <!--<a href="#account"><img src="https://gladstoneentertainment.com/wp-content/uploads/2018/05/avatar-placeholder.gif" alt="avatar" /></a>-->
            </li>
            <!--<li>
                <a href="javascript:void(0);" class="hamburger" onclick="showHamburger()">
                    <i class="fa fa-bars"></i>
                </a>
            </li>-->
        </ul>
    </div>
  <main>
      <div class="movie-page-first-row">
          <div class="column left">
              <img src="https://via.placeholder.com/350x450" alt="movieTitle" />
          </div>
          <div class="column middle">
              <h1>Movie Title</h1>
              <p class="year">(2012)</p>
              <p class="duration">3 h 22 min</p>
              <p class="description">

                  LOREM IPSUM
                  <%--<c:out value="${movie}"/>--%>

              </p>
          </div>
          <div class="column right">
              <h3>Rating</h3>
              <p>8/10</p>
          </div>
      </div>

  </main>


</body>
</html>