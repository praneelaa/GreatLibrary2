<html>
<head>
<title>Add Book</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link href="https://fonts.googleapis.com/css2?family=Crimson+Text&display=swap" rel="stylesheet">

</head>
<body>


<div class="logo-banner">
    <img src="https://i.pinimg.com/originals/38/4e/c7/384ec74949c68b3829d34a3c4e22dcc3.jpg" alt="Ancient Library Logo" class="logo-img">
    <h1 class="site-title">The Grand Ancient Library</h1>
</div>

<div class="container">

<h2>Add Book</h2>


<form action="/save" method="post">
    <input type="hidden" name="id" value="0">
    Title: <input type="text" placeholder="Enter Book name" name="title"><br>
    Author: <input type="text" placeholder="Enter name of Author" name="author"><br>
    Publisher: <input type="text" placeholder="Enter name of Publisher" name="publisher"><br>
    Price: <input type="text" placeholder="Enter Price" name="price"><br>
    Stock: <input type="text" placeholder="Enter no. of books" name="stock"><br>
    <button type="submit">Submit</button>
</form>
</div>
<div style="margin-top: 20px;">
    <a href="/home" style="background-color:#a0522d; color:white; padding:8px 15px; border-radius:6px; text-decoration:none;">Back to Library Hall</a>
</div>
<iframe src="${pageContext.request.contextPath}/music" style="display:none;" allow="autoplay"></iframe>

</body>
</html>
