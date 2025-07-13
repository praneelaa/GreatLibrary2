<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
    <title>Library Home</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link href="https://fonts.googleapis.com/css2?family=Crimson+Text&display=swap" rel="stylesheet"></head>
<body>




   
        <div class="logo-banner">
    <img src="https://i.pinimg.com/originals/38/4e/c7/384ec74949c68b3829d34a3c4e22dcc3.jpg" alt="Ancient Library Logo" class="logo-img">
    <h1 class="site-title">The Grand Ancient Library</h1>
</div>

<div class="container">

        <h2> Welcome to the Grand Ancient Library</h2>
        <p>Hello, <strong>${user.username}</strong>! You are logged in as <strong>${user.role}</strong>.</p>

        <div class="separator"></div>

        <c:if test="${user.role == 'admin'}">
            <a href="/books" class="btn">View All Books</a>
            <a href="/add" class="btn"> Add New Book</a>
        </c:if>

        <c:if test="${user.role == 'user'}">
            <a href="/catalog" class="btn"> Browse the Scrolls</a>
        </c:if>

        <div class="separator"></div>

        <form action="/logout" method="get">
            <button type="submit" class="btn"> Logout</button>
        </form>
    </div>
    <iframe src="${pageContext.request.contextPath}/music" style="display:none;" allow="autoplay"></iframe>
    
</body>
</html>
