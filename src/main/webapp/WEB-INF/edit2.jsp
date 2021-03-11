<%@ page isErrorPage="true" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>edit</title>
</head>
<body>
    <div class="container">
        <p>Edit an event</p>
        <form:form action="edit/${event.id}" method="post" modelAttribute="event" class="container">
        <input type="hidden" name="_method" value="put">
        <p>
            <form:label path="name">name</form:label>
            <form:errors path="name"/>
            <form:input path="name"/>
        </p>
        <p>
            <form:label path="creator">creator</form:label>
            <form:errors path="creator"/>
            <form:input path="creator"/>
        </p>
        <p>
            <form:label path="currentVersion">currentVersion</form:label>
            <form:errors path="currentVersion"/>     
            <form:input type="number" path="currentVersion"/>
        </p>    
        <input type="submit" value="Submit"/>
    </form:form>
</div>    
</body>
</html>