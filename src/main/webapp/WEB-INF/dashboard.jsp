<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html>

        <head>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
                crossorigin="anonymous">
            <meta charset="UTF-8">
            <link rel="stylesheet" href="css/main.css" />
            <title>display</title>
            <style>
                .wrapper {
                    width: 500px;
                    height: 540px;
                    position: absolute;
                    left: 50%;
                    top: 50%;
                    transform: translate(-50%, -50%);
                    background: #fdfeff;
                    transition: background 0.6s ease;
                    border-radius: 10px;
                    padding: 20px 20px 20px 20px;
                    box-shadow: 0 8px 40px rgba(0, 0, 0, .2);
                    overflow-y: scroll;
                    background-color: rgba(0, 0, 0, 0.89);
                    border-radius: 3px;
                    padding: 70px 100px;
                }
                a{
                    color:white;
                    text-decoration: none;
                }
                .text-center {
                    color: #fff;
                    /* text-transform: uppercase; */
                    font-size: 23px;
                    margin: -50px 0 80px 0;
                    display: block;
                    text-align: center;
                    display: table;

                }
            </style>
        </head>

        <body>
            <p><a href="/logout">Logout</a> | <a href="/profile/${user.id}">My profile</a></p>
                <div class="wrapper">
                    <div class="text-center">
                    <p >Posts</p>
                <c:forEach items="${ posts }" var="post">
                    <p class="item">
                        <p><b><a href="/profile/${post.user.id}">
                                    <c:out value="${post.user.name}" /></b></p>
                        <p><a href="/posts/${post.id}">
                                <c:out value="${post.content}" />
                            </a></p>
                        <p style="color: white;">Likes:
                            <c:out value="${post.users.size()}" /> Comments:
                            <c:out value="${post.comments.size()}" />
                        </p>
                        <c:choose>
                            <c:when test="${ post.users.contains(user) }">
                                <td><a href="/unjoin/${post.id}">💔</a></td>
                            </c:when>
                            <c:otherwise>
                                <td><a href="/join/${post.id}">❤️</a></td>
                            </c:otherwise>
                        </c:choose>
                    </p>
                    <hr/>
                </c:forEach>
            </div>
            </div>
            </div>
        </body>

        </html>