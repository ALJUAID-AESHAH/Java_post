<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Profile</title>
            <style>
                * {
                    margin: 0;
                    padding: 0;
                    box-sizing: border-box;
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

                .customSlider {
                    opacity: 0;
                    display: none;
                }

                .customSlider+label {
                    position: relative;
                    top: 35px;
                    left: 15px;
                    cursor: pointer;
                    margin-top: 10px;

                }

                .customSlider+label:before,
                .customSlider+label:after {
                    background: #fff;
                    position: absolute;
                    content: '';
                    margin-top: 30px;
                    margin-left: 150px;
                }

                .customSlider+label:before {
                    top: -90px;
                    left: -60px;
                    width: 80px;
                    height: 40px;
                    background: #ccc;
                    border-radius: 20px;
                    transition: background 0.75s;
                }

                .customSlider+label:after {
                    height: 34px;
                    width: 34px;
                    top: -87px;
                    left: -55px;
                    border-radius: 50%;
                    transition: all 0.5s;
                }

                .customSlider:checked+label:after {
                    height: 34px;
                    width: 34px;
                    top: -87px;
                    left: -19px;
                    border-radius: 50%;
                }

                .customSlider:checked~.wrapper {
                    color: #fff;
                    transition: background 0.6s ease;
                    background: #31394d;
                }

                .customSlider:checked~.wrapper .top-icons i {
                    color: #fff;
                }

                .customSlider:checked~.wrapper .profile .name {
                    color: #fdfeff;
                }

                .customSlider:checked~.wrapper .profile .title {
                    color: #7c8097;
                }

                .customSlider:checked~.wrapper .profile .description {
                    color: #fdfeff;
                }

                .customSlider:checked~.wrapper .icon h4 {
                    color: #fff;
                }

                .customSlider:checked~.wrapper .icon p {
                    color: #666b7d;
                }

                .wrapper {
                    margin-top: 20px;
                    width: 320px;
                    height: 515px;
                    background: #fdfeff;
                    transition: background 0.6s ease;
                    border-radius: 10px;
                    padding: 20px 20px 20px 20px;
                    box-shadow: 0 8px 40px rgba(0, 0, 0, .2);
                }

                .wrapper .top-icons i {
                    color: #080911;
                }

                .wrapper .top-icons i:nth-of-type(1) {
                    float: left;
                }

                .wrapper .top-icons i:nth-of-type(2) {
                    float: right;
                }

                .wrapper .top-icons i:nth-of-type(3) {
                    float: right;
                    padding-right: 0.8em;
                }

                .wrapper .profile {
                    margin-top: 2.2em;
                    position: relative;
                }

                .wrapper .profile:after {
                    width: 100%;
                    height: 1px;
                    content: ' ';
                    display: block;
                    margin-top: 1.3em;
                    background: #e9eff6;
                }

                .wrapper .profile .check {
                    position: absolute;
                    right: 5em;
                    bottom: 12.7em;
                }

                .wrapper .profile .check i {
                    color: #fff;
                    width: 20px;
                    height: 20px;
                    font-size: 12px;
                    line-height: 20px;
                    text-align: center;
                    border-radius: 100%;
                    background: linear-gradient(to bottom right, #c90a6d, #ff48a0);
                }

                .wrapper .profile .thumbnail {
                    width: 124px;
                    height: 124px;
                    display: flex;
                    margin-left: auto;
                    margin-right: auto;
                    margin-bottom: 1.5em;
                    border-radius: 100%;
                    box-shadow: 0 13px 26px rgba(0, 0, 0, .2), 0 3px 6px rgba(0, 0, 0, .2);
                }

                .wrapper .profile .name {
                    color: #2d354a;
                    font-size: 24px;
                    font-weight: 600;
                    text-align: center;
                }

                .wrapper .profile .title {
                    color: #7c8097;
                    font-size: 0.75em;
                    font-weight: 300;
                    text-align: center;
                    padding-top: 0.5em;
                    padding-bottom: 0.7em;
                    letter-spacing: 1.5px;
                    text-transform: uppercase;
                }

                .wrapper .profile .description {
                    color: #080911;
                    font-size: 14px;
                    font-weight: 300;
                    text-align: center;
                    margin-bottom: 1.3em;
                }

                .wrapper .profile .btn {
                    color: #fff;
                    width: 130px;
                    height: 42px;
                    outline: none;
                    border: none;
                    display: block;
                    cursor: pointer;
                    font-weight: 300;
                    margin-left: auto;
                    margin-right: auto;
                    border-radius: 70px;
                    box-shadow: 0 13px 26px rgba(0, 0, 0, .16), 0 3px 6px rgba(0, 0, 0, .16);
                    background: linear-gradient(to bottom right, #c90a6d, #ff48a0);
                }

                .wrapper .social-icons {
                    display: flex;
                    margin-top: 1.2em;
                    justify-content: space-between;
                }

                .wrapper .social-icons .icon {
                    display: flex;
                    align-items: center;
                    flex-direction: column;
                }

                .wrapper .social-icons .icon a {
                    color: #fff;
                    width: 60px;
                    height: 60px;
                    font-size: 28px;
                    line-height: 60px;
                    text-align: center;
                    border-radius: 30px;
                    box-shadow: 0 13px 26px rgba(0, 0, 0, .2), 0 3px 6px rgba(0, 0, 0, .2);
                }

                .wrapper .social-icons .icon:nth-of-type(1) a {
                    background: linear-gradient(to bottom right, #c90a6d, #ff48a0);
                }

                .wrapper .social-icons .icon:nth-of-type(2) a {
                    background: linear-gradient(to bottom right, #5e5aec, #3f9efc);
                }

                .wrapper .social-icons .icon:nth-of-type(3) a {
                    background: linear-gradient(to bottom right, #6452e9, #639ff9);
                }

                .wrapper .social-icons .icon h4 {
                    color: #080911;
                    font-size: 1em;
                    margin-top: 1.3em;
                    margin-bottom: 0.2em;
                }

                .wrapper .social-icons .icon p {
                    color: #666b7d;
                    font-size: 12px;
                }

                .concept {
                    position: absolute;
                    bottom: 25px;
                    color: #aab0c4;
                    font-size: 0.9em;
                    font-weight: 400;
                }

                .concept a {
                    color: rgba(172, 25, 102, 1);
                    text-decoration: none;
                }

                .up {
                    margin-bottom: 30px;
                }

                .text-center {
                    color: #fff;
                    /* text-transform: uppercase; */
                    font-size: 23px;
                    margin: -50px 0 80px 0;
                    display: block;
                    text-align: center;
                }
            </style>
        </head>

        <body>
            <div class="body">
                <input id="slider" class="customSlider" type="checkbox" />
                <label for="slider"></label>

                <div class="wrapper">
                    <div class="top-icons">
                        <i class="fas fa-long-arrow-alt-left"></i>
                        <i class="fas fa-ellipsis-v"></i>
                        <i class="far fa-heart"></i>
                    </div>

                    <div class="profile">
                        <div class="up">
                            <span class="text-center"><a style="color: black; text-decoration: none;"
                                    href="/posts">Return to Time Line</a></span>
                        </div>
                        <img src="${user.img}" class="thumbnail" />
                        <div class="check"><i class="fas fa-check"></i></div>
                        <h3 class="name">
                            <c:out value="${user.name}" />
                        </h3>
                        <c:choose>
                            <c:when test="${user.id==loggedinUser.id}">
                                <a style="text-decoration: none;" href="/create"><button type="button" class="btn">Add
                                        Post</button></a>
                            </c:when>
                            <c:otherwise>
                                <c:choose>
                                    <c:when test="${loggedinUser.followings.contains(user)}">
                                        <a style="text-decoration: none;" href="/unfollow/${user.id}"><button
                                                type="button" class="btn">Unfollow</button></a>
                                    </c:when>
                                    <c:otherwise>
                                        <a style="text-decoration: none;" href="/follow/${user.id}"><button
                                                type="button" class="btn">Follow</button></a>
                                    </c:otherwise>
                                </c:choose>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <div class="social-icons">
                        <div class="icon">
                            <a href="/list/${user.id}"><i class="fab fa-dribbble"></i></a>
                            <h4>
                                <c:out value="${user.posts.size()}" />
                            </h4>
                            <p>Posts</p>
                        </div>

                        <div class="icon">
                            <a href="#"></a><i class="fab fa-behance"></i></a>
                            <h4>
                                <c:out value="${user.followings.size()}" />
                            </h4>
                            <p>Followings</p>
                        </div>

                        <div class="icon">
                            <a href="#"><i class="fab fa-twitter"></i></a>
                            <h4>
                                <c:out value="${user.followers.size()}" />
                            </h4>
                            <p>Followers</p>
                        </div>
                    </div>
                </div>
            </div>