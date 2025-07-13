<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>Books</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">

</head>
<body>


<h2>Available Books</h2>
<form action="/search" method="get">
    <input type="text" name="keyword" placeholder="Search by title">
    <button type="submit">Search</button>
</form>
<a href="/add">Add Book</a>
<table border="1">
    <tr><th>ID</th><th>Title</th><th>Author</th><th>Publisher</th><th>Price</th><th>Stock</th><th>Action</th></tr>
    <c:forEach items="${bookList}" var="b">
        <tr>
            <td>${b.id}</td>
            <td>${b.title}</td>
            <td>${b.author}</td>
            <td>${b.publisher}</td>
            <td>${b.price}</td>
            <td>${b.stock}</td>
            <td>
                <a href="/edit/${b.id}">Edit</a> |
                <a href="/delete/${b.id}" onclick="return confirm('Delete this book?')">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>
<iframe src="${pageContext.request.contextPath}/music" style="display:none;" allow="autoplay"></iframe>

</body></html>
