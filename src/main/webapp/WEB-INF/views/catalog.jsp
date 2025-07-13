<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Catalog</title>
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Crimson+Text&display=swap" rel="stylesheet">
</head>
<body>

<div class="logo-banner">
    <img src="https://i.pinimg.com/originals/38/4e/c7/384ec74949c68b3829d34a3c4e22dcc3.jpg" alt="Ancient Library Logo" class="logo-img">
    <h1 class="site-title">The Grand Ancient Library</h1>
</div>

<div class="container">
    <h2>Ancient Scrolls Catalog</h2>

    <form action="/catalog/search" method="get" class="search-bar">
        <input type="text" name="keyword" placeholder="Search by title" required>
        <button type="submit">Search</button>
    </form>

    <c:if test="${not empty keyword && empty bookList}">
        <p style="color:red;">No results found for "<strong>${keyword}</strong>"</p>
    </c:if>

    <table>
        <tr>
            <th>Title</th>
            <th>Author</th>
            <th>Publisher</th>
            <th>Price</th>
            <th>Stock</th>
            <th>Add to Cart</th>
            <th>⭐ Rate</th> <!-- New column -->
        </tr>
        <c:forEach items="${bookList}" var="b">
            <tr>
                <td>${b.title}</td>
                <td>${b.author}</td>
                <td>${b.publisher}</td>
                <td>${b.price}</td>
                <td style="color: ${b.stock <= 2 ? 'red' : 'black'};">
                    ${b.stock}
                    <c:if test="${b.stock <= 2}">(Low!)</c:if>
                </td>
                <td>
                    <form action="/cart/add" method="post">
                        <input type="hidden" name="bookId" value="${b.id}">
                        <input type="number" name="quantity" value="1" min="1" max="${b.stock}">
                        <button type="submit">Add</button>
                    </form>
                </td>
                <td>
                    <a href="${pageContext.request.contextPath}/catalog/details/${b.id}" class="btn"> Rate</a>
                </td>
            </tr>
        </c:forEach>
    </table>

    <br>
    <a href="/cart/view" class="btn">View Cart</a>
    <a href="/home" class="btn">Back to Home</a>
</div>

<iframe src="${pageContext.request.contextPath}/music" style="display:none;" allow="autoplay"></iframe>

</body>
</html>
