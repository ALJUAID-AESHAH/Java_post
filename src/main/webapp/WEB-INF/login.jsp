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
        <link rel="stylesheet" href="css/main.css" />

        <title>Register</title>
        <!-- <style>
            @import url("https://fonts.googleapis.com/css?family=Noto+Sans:400,400i,700,700i&subset=greek-ext");
            .text-center {
                color: #fff;
                text-transform: uppercase;
                font-size: 23px;
                margin: -50px 0 80px 0;
                display: block;
                text-align: center;
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
            .box {
                position: absolute;
                left: 50%;
                top: 50%;
                transform: translate(-50%, -50%);
                background-color: rgba(0, 0, 0, 0.89);
                border-radius: 3px;
                padding: 70px 100px;
            }
            .input-container {
                position: relative;
                margin-bottom: 25px;
            }
            .input-container label {
                position: absolute;
                top: 0px;
                left: 0px;
                font-size: 16px;
                color: #fff;
                pointer-events: none;
                transition: all 0.5s ease-in-out;
            }
            .input-container input {
                border: 0;
                border-bottom: 1px solid #555;
                background: transparent;
                width: 100%;
                padding: 8px 0 5px 0;
                font-size: 16px;
                color: #fff;
            }
            .input-container input:focus {
                border: none;
                outline: none;
                border-bottom: 1px solid #e74c3c;
            }
            .btn {
                color: #fff;
                background-color: #e74c3c;
                outline: none;
                border: 0;
                color: #fff;
                padding: 10px 20px;
                text-transform: uppercase;
                margin-top: 50px;
                border-radius: 2px;
                cursor: pointer;
                position: relative;
            }
            /* .btn:after{
                content:"";
                position:absolute;
                background:rgba(0,0,0,0.50);
                top:0;
                right:0;
                width:100%;
                height:100%;
            } */
            .input-container input:focus ~ label,
            .input-container input:valid ~ label {
                top: -12px;
                font-size: 12px;
            }
    </style> -->
</head>
<body>
    <div class="box">
        <form action="/loginuser" method="POST">
            <span class="text-center">login</span>
            <div class="input-container">
                <input type="email" name="email"  />
                <label>Email</label>
            </div>
            <div class="input-container">
                <input type="password" name="password"  />
                <label>passwoed</label>
            </div>
            <button type="submit" class="btn">submit</button>
        </form>
        <a href="/">Don't have account! click here</a>
    </div>
</body>
</html>

