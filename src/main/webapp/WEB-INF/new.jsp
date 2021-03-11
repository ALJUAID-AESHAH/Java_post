<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>New</title>
        <style>
            .box {      
                color:aliceblue;
                position: absolute;
                left: 50%;
                top: 50%;
                transform: translate(-50%, -50%);
                background-color: rgba(51, 51, 51, 0.467);
                border-radius: 3px;
                padding: 70px 100px;
            }

body {
    width: 100%;
    height: 100vh;
    display: flex;
    position: relative;
    /* background: #eeeeec; */
    background-image: url("https://images.pexels.com/photos/891252/pexels-photo-891252.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260");
    align-items: center;
    flex-direction: column;
    justify-content: center;
    font-family: 'Open Sans', sans-serif;
    font-size: 100%;
}
a{
            color:white;
            text-decoration: none;
    }
</style>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>new</title>
</head>
<body>
    
</body>
<div class="box">
    <p><a href="/posts">Back To Time Line</a></p>
    <p>Create post</p>
    
	<form action="/createpost" method="POST">
        <p>content: <input type="textarea" name="content"/></p>
        <input type="submit" value="Create"/>
	</form>
</div>

</body>
</html>