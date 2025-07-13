<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Books</title>
    <link href="https://fonts.googleapis.com/css2?family=Crimson+Text&display=swap" rel="stylesheet">
    
    <link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>


<div class="logo-banner">
    <img src="https://i.pinimg.com/originals/38/4e/c7/384ec74949c68b3829d34a3c4e22dcc3.jpg" alt="Ancient Library Logo" class="logo-img">
    <h1 class="site-title">The Grand Ancient Library</h1>
</div>

<div class="container">
    <h2>Available Books</h2>

    <!-- Search Form -->
    <form class="search-bar" action="/search" method="get">
        <input type="text" name="keyword" placeholder="Search by title" value="${keyword}">
        <button type="submit">Search</button>
    </form>

    <!-- Alert if no result -->
    <c:if test="${notFound}">
        <script>
            alert("No book found with title: '${keyword}'");
        </script>
    </c:if>

    <!-- Book of the Day (optional, needs controller support) -->
    <c:if test="${not empty featured}">
        <div style="background-color:#f4e2cd; padding:10px; margin:20px 0; border-left:6px solid #a97453;">
            <strong> Book of the Day:</strong><br>
            <em>${featured.title}</em> by <em>${featured.author}</em>
        </div>
    </c:if>

    <div style="margin-bottom: 20px;">
        <a href="/add" class="btn"> Add Book</a>
        <a href="/home" class="btn"> Back to Library Hall</a>
    </div>
    
    
    

    <!-- Book Table -->
    <table>
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Author</th>
            <th>Publisher</th>
            <th>Price</th>
            <th>Stock</th>
            <th>Action</th>
        </tr>
        <c:forEach items="${bookList}" var="b">
            <tr>
                <td>${b.id}</td>
                <td>${b.title}</td>
                <td>${b.author}</td>
                <td>${b.publisher}</td>
                <td>${b.price}</td>
                <td style="color: ${b.stock <= 2 ? 'red' : 'black'};">
                    ${b.stock}
                    <c:if test="${b.stock <= 2}">(Low!)</c:if>
                </td>
                <td>
                    <a href="/edit/${b.id}">Edit</a> |
                    <a href="/delete/${b.id}" onclick="return confirm('Delete this book?')">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

<iframe src="${pageContext.request.contextPath}/music" style="display:none;" allow="autoplay"></iframe>

</body>
</html>
