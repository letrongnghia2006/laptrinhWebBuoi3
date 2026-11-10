<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Murach Java Servlet and JSP</title>
    <link rel="stylesheet" href = "style.css" >
</head>

<body>
<h1> Thanks for joining our email list</h1>
<p>Here is the information that you entered:</p>
<label>Email:</label>
<span>${user.email}</span><br>
<label>First Name: </label>
<span>${user.firstName}</span><br>
<label>Last name: </label>
<span>${user.lastName}</span><br>
<label>Date of Birth: </label>
<span>${user.dateOfBirth}</span><br>
<label>Search :</label>
<span>${survey.search}</span><br>
<label>Announcement</label>
<span>${survey.announcement}</span><br>
<label>Offer: </label>
<span>${survey.offer}</span><br>
<label>Contact Method: </label>
<span>${survey.contactMethod}</span>
<p>to enter another email address, click on the Back
    button in your brower or the return button show
    below.</p>

<form action="emailList" method="get">

    <input type="hidden" name="action" value="join">

    <input type="submit" value="Return">

</form>

</body>
</html>