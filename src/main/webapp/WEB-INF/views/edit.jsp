<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>Edit Book</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link href="https://fonts.googleapis.com/css2?family=Crimson+Text&display=swap" rel="stylesheet">

</head>
<body>


<div class="logo-banner">
    <img src="https://i.pinimg.com/originals/38/4e/c7/384ec74949c68b3829d34a3c4e22dcc3.jpg" alt="Ancient Library Logo" class="logo-img">
    <h1 class="site-title">The Grand Ancient Library</h1>
</div>

<h2>Edit Book</h2>
<div class="container">
<form action="/update" method="post">
    <input type="hidden" name="id" value="${book.id}">
    Title: <input type="text" name="title" placeholder="Enter Book name" value="${book.title}"><br>
    Author: <input type="text" name="author" placeholder="Enter name of Author" value="${book.author}"><br>
    Publisher: <input type="text" name="publisher" placeholder="Enter name of Publisher" value="${book.publisher}"><br>
    Price: <input type="text" name="price" placeholder="Enter Price" value="${book.price}"><br>
    Stock: <input type="text" name="stock" placeholder="Enter no. of books" value="${book.stock}"><br>
    <button type="submit">Update</button>
</form>
<div style="margin-top: 20px;">
    <a href="/home" style="background-color:#a0522d; color:white; padding:8px 15px; border-radius:6px; text-decoration:none;"> Back to Library Hall</a>
</div>

</div>
<iframe src="${pageContext.request.contextPath}/music" style="display:none;" allow="autoplay"></iframe>

</body>
</html>
