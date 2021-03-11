<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta http-equiv="X-UA-Compatible" content="IE=edge">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Register</title>
                <link rel="stylesheet" href="css/main.css" />
            </head>

            <body>
                <div class="box">
                    <form:form class="user-form" action="/registration" method="post" modelAttribute="registration">
                        <span class="text-center">Register</span>
                        <div class="input-container">
                            <form:label path="name">Name:</form:label>
                            <form:errors path="name" />
                            <form:input class="form-control" path="name" />
                        </div>
                        <div class="input-container">
                            <form:label path="email">Email:</form:label>
                            <form:errors path="email" />
                            <form:input type="email" class="form-control" path="email" />
                        </div>
                        <div class="input-container">
                            <form:label path="password">Password:</form:label>
                            <form:errors path="password" />
                            <form:password class="form-control" path="password" />
                        </div>
                        <div class="input-container">
                            <form:label path="passwordConfirmation">Confirm Password:</form:label>
                            <form:errors path="passwordConfirmation" />
                            <form:password class="form-control" path="passwordConfirmation" />
                        </div>
                        <div class="input-container">
                            <form:label path="img">profile img:</form:label>
                            <form:errors path="img" />
                            <form:input class="form-control" path="img" />
                        </div>
                        <button type="submit" class="btn">submit</button>
                    </form:form>
                    <a href="/login">Already have account! click here</a>
                </div>
            </body>

            </html>