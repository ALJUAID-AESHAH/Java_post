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
                body {
                    background-image: url("https://images.pexels.com/photos/891252/pexels-photo-891252.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260");
                }
                .wrapper {
                    color:white;
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
                h3{
                    color:white;
                }
                p{
                    color:white;
                }
                .text-center {
                    color: #fff;
                    /* text-transform: uppercase; */
                    font-size: 23px;
                    margin: -50px 0 80px 0;
                    display: block;
                    text-align: center;
                }
                a{
                    color:white;
                    text-decoration: none;
                }
            </style>
        </head>

        <body>
            <p><a href="/posts">back</a> | <a href="/profile/${user.id}">My profile</a></p>
            <div class="wrapper" >
                <div class="text-center">
                <h3>
                    <c:out value="${post.user.name}" />
                </h3>
                <h3>
                    <c:out value="${post.content}" />
                </h3>
                <p>Likes:
                    <c:out value="${post.users.size()}" /> Comments:
                    <c:out value="${post.comments.size()}" />
                </p>
                <c:if test="${user.id == post.user.id}">
                    <form action="/delete/${post.id}" method="POST">
                        <input type="hidden" name="_method" value="delete">
                        <input type="submit" value="Delete">
                    </form>
                </c:if>
                <form action="/comment" method="POST">
                    <p>Add comment: <input type="text" name="comment" required /></p>
                    <input type="hidden" name="id" value="${post.id}" />
                    <input type="submit" value="Submit" />
                </form>
                <hr/>
                <div class="messages">
                    <h3>Comments:</h3>
                    <c:forEach items="${ comments }" var="comment">
                        <p><b>
                                <c:out value="${comment.user.name}" />:
                            </b></p>
                        <p>
                            <c:out value="${comment.comment}" />
                        </p>
                        <c:if test="${user.id == comment.user.id}">
                        <form action="/deletecomment/${comment.id}" method="POST">
                            <input type="hidden" name="postid" value="${post.id}">
                            <input type="hidden" name="_method" value="delete">
                            <input type="submit" value="Delete">
                        </form>
                        </c:if>
                    </c:forEach>
                </div>
                </div>
            </div>
        </body>

        </html>