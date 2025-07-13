<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Logged Out</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link href="https://fonts.googleapis.com/css2?family=Crimson+Text&display=swap" rel="stylesheet"></head>
</head>
<body>


    <div class="logo-banner">
    <img src="https://i.pinimg.com/originals/38/4e/c7/384ec74949c68b3829d34a3c4e22dcc3.jpg" alt="Ancient Library Logo" class="logo-img">
    <h1 class="site-title">The Grand Ancient Library</h1>
</div>
    <div class="container">
        <h2>You have been successfully logged out.</h2>
        <p>Thank you for visiting The Grand Ancient Library </p>
        <a href="/login" class="btn">Login Again</a>
    </div>
    <iframe src="${pageContext.request.contextPath}/music" style="display:none;" allow="autoplay"></iframe>
    
</body>
</html>
