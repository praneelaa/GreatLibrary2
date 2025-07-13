<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Book Details</title>
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Crimson+Text&display=swap" rel="stylesheet">

</head>
<body>
    <div class="book-box">
        <h2>${book.title}</h2>
        <p><b>Author:</b> ${book.author}</p>
        <p><b>Price:</b> ₹${book.price}</p>

        <h3> Average Rating: 
            <span class="stars">
                <c:forEach begin="1" end="5" var="i">
                    <c:choose>
                        <c:when test="${i <= avgRating}">★</c:when>
                        <c:otherwise>☆</c:otherwise>
                    </c:choose>
                </c:forEach>
            </span> (${avgRating}/5)
        </h3>

        <!-- Rating Form -->
        <form action="${pageContext.request.contextPath}/rate" method="post">
            <input type="hidden" name="bookId" value="${book.id}" />
            <label>Rate this Book:</label>
            <input type="number" name="stars" min="1" max="5" required />
            <label>Comment:</label>
            <textarea name="comment" rows="3" placeholder="Share your thoughts..."></textarea>
            <button type="submit">Submit Rating</button>
        </form>

        <div class="review-box">
            <h3>User Reviews</h3>
            <c:forEach var="r" items="${ratings}">
                <p class="stars">
                    <c:forEach begin="1" end="5" var="i">
                        <c:choose>
                            <c:when test="${i <= r.stars}">★</c:when>
                            <c:otherwise>☆</c:otherwise>
                        </c:choose>
                    </c:forEach>
                </p>
                <p><i>${r.comment}</i></p>
                <hr/>
            </c:forEach>
        </div>

        <a href="${pageContext.request.contextPath}/catalog"> Back to Catalog</a>
    </div>
</body>
</html>
