<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Thank You</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link href="https://fonts.googleapis.com/css2?family=Crimson+Text&display=swap" rel="stylesheet">
</head>
<body>


<div class="logo-banner">
    <img src="https://i.pinimg.com/originals/38/4e/c7/384ec74949c68b3829d34a3c4e22dcc3.jpg" alt="Ancient Library Logo" class="logo-img">
    <h1 class="site-title">The Grand Ancient Library</h1>
</div>
<div class="container">
    <h2>Purchase Successful!</h2>
    <p>Thank you for your purchase. Happy reading, Master Reader! 📖</p>
    <a href="/home" class="btn">Back to Library Hall</a>
</div>
<iframe src="${pageContext.request.contextPath}/music" style="display:none;" allow="autoplay"></iframe>

</body>
</html>
