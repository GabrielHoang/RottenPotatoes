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
        <div class="filmHeader">
            <div class="filmPosterBox">
                <img src="${posterPath}"></img>
            </div>
            <div class="filmMainHeader">
                <div class="bottom-15 filmTitle">
                    ${title}
                </div>
                <div class="s-16 top-5">
                    ${tagline}
                </div>
                <div class="filmTime top-5">
                    ${duration} min
                </div>
                <div class="filmPlot bottom-15">
                    ${description}
                </div>
                <div class="filmInfo bottom-15">
                    <div class="otherInfo">
                        <dl class="table-list">
                            <dt>director:</dt>
                            <dd>
                                <c:forEach items="${crewMemebers.get('Director')}" var="crew">
                                    ${crew.name}<br/>
                                </c:forEach>
                            </dd>
                            <dt>screenplay:</dt>
                            <dd>
                                <c:forEach items="${crewMemebers.get('Screenplay')}" var="crew">
                                    ${crew.name}<br/>
                                </c:forEach>
                            </dd>
                            <dt>genres:</dt>
                            <dd>
                                <c:forEach items="${genres}" var="genre">
                                    ${genre}<br/>
                                </c:forEach>
                            </dd>
                            <dt>production:</dt>
                            <dd>
                                <c:forEach items="${productionCountries}" var="prodCoun">
                                    ${prodCoun}<br/>
                                </c:forEach>
                            </dd>
                            <dt>premiere:</dt>
                            <dd>
                                ${releaseDate}
                            </dd>

                        </dl>
                    </div>
                </div>
            </div>
        </div>
        <div class="pageBox">
            <div class="pageBox movieMedia">
                <h2 class="hdr-big">media</h2>
                <div class="film-videos">
                        <c:forEach items="${youtubeVideos.get('YouTube')}" var="video">
                            <iframe class="iframe-youtube-vid" src="${video.key}"></iframe>
                        </c:forEach>
                </div>
            </div>
            <div class="pageBox filmCastBox top-5">
                <h2 class="hdr-big vertical-align">cast</h2>
                <div class="castGroup">
                    <table>
                        <colgroup>
                            <col width="4%">
                            <col width="48%">
                            <col width="48%">
                        </colgroup>
                        <c:set var="actorsDisplayed" value="8"></c:set>
                        <c:forEach items="${castMembers}" var="castMember" begin="0" end="${actorsDisplayed}">
                        <tr>
                            <td>
                                <img    class="castImg"
                                        src="${castMember.profile_path}"
                                        onerror="this.src='https://via.placeholder.com/50x65'"/>
                            </td>
                            <td>
                                ${castMember.name}
                            </td>
                            <td>
                                ${castMember.character}
                            </td>
                        </tr>
                        </c:forEach>
                    </table>
                    <a href="#">Show all actors</a>
                </div>
            </div>

            <div class="boxContainer">
                <div class="box box-half">
                    <h2 class="hdr-big">other film informations
                        <br>
                        ${title}
                    </h2>
                    <div class="otherInfo">
                        <dl class="table-list">
                            <dt>music:</dt>
                            <dd>
                                <c:forEach items="${crewMemebers.get('Original Music Composer')}" var="crew">
                                    ${crew.name}<br/>
                                </c:forEach>
                            </dd>
                            <dt>photos:</dt>
                            <dd>
                                <c:forEach items="${crewMemebers.get('Director of Photography')}" var="crew">
                                    ${crew.name}<br/>
                                </c:forEach>
                            </dd>
                            <dt>budget:</dt>
                            <dd>
                                $ ${budget}
                            </dd>
                            <dt>boxoffice:</dt>
                            <dd>
                                $ ${revenue}
                            </dd>
                            <dt>studio:</dt>
                            <dd>
                                <c:forEach items="${productionCompanies}" var="prodComp">
                                    ${prodComp}<br/>
                                </c:forEach>
                            </dd>
                        </dl>
                    </div>
                </div>
            </div>
            <div class="forum-main">
                <h2 class="hdr-big">
                    forum
                </h2>
                <div class="comments">
                    <ul>
                        <li>
                            Commentary
                        </li>
                    </ul>
                </div>
            </div>

        </div>
    </div>
    <div class="sidebarWrapper">
        <div id="filmVoteRatingPanel">
            <span>${voteAverage}</span>

        </div>
    </div>
</div>

</body>
</html>