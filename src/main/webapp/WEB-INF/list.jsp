<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List</title>
</head>
<style>
    .top{
                overflow-y: scroll;
                position: absolute;
                left: 50%;
                top: 50%;
    }
    .box {      
                color:aliceblue;
                overflow-y: scroll;
                position: absolute;
                left: 50%;
                top: 50%;
                transform: translate(-50%, -50%);
                background-color: rgba(0, 0, 0, 0.89);
                border-radius: 3px;
                padding: 70px 100px;
            }
            
    body {
                background-image: url("https://images.pexels.com/photos/891252/pexels-photo-891252.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260");
                background-position: center;
                background-origin: content-box;
                background-repeat: no-repeat;
                background-size: cover;
                min-height: 100vh;
                font-family: "Noto Sans", sans-serif;
            }
    a{
            color:white;
            text-decoration: none;
    }
</style>

<body>
    <p><a href="/posts">back</a> | <a href="/profile/${user.id}">My profile</a></p>
    <div class="top" > 
        <h3>Hello <c:out value="${user.name}" /></h3>
        <p>Here are your posts:</p>
    </div>
    <div class="box">
    <c:forEach items="${ user.posts }" var="post">
				<h2 class="headline"><a style="text-decoration: none; color:aliceblue" href="/posts/${post.id}"><c:out value="${post.content}" /></a></h2>
                <p>Likes:<c:out value="${post.users.size()}" /> Comments:<c:out value="${post.comments.size()}" /></p>
                <c:choose>
						<c:when test="${ post.users.contains(user) }">
							<td><a href="/unjoinlist/${post.id}">💔</a></td>
						</c:when>
						<c:otherwise>
							<td><a href="/joinlist/${post.id}">❤️</a></td>
						</c:otherwise>
                </c:choose>
			</c:forEach>
        </div>
</body>
</html>