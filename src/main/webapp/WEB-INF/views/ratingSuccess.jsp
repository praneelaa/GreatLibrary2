<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Ratings Submission</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
    <div class="container">
        <h2 class="thank-you"> Your Rating Was Submitted Successfully!</h2>

        <div class="separator"></div>

        <div>
            <form action="/catalog/details/${bookId}" method="get" style="display:inline;">
                <button type="submit" class="btn"> View Book Details</button>
            </form>

            <form action="/home" method="get" style="display:inline;">
                <button type="submit" class="btn"> Go to Home</button>
            </form>
        </div>
    </div>
</body>
</html>
