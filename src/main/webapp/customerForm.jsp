<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Form</title>
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" href="./css/form.css">
</head>
<body>

<!-- Header Menu of the Page -->
<%@ include file="header.html" %>

<div class="form"> 

	<h2>Customer Register Form</h2>
 	<form action = "addCustomer.jsp" method = "POST">
         First Name: <input type = "text" name = "firstName">
         <br /><br />
         
         Middle Name: <input type = "text" name = "middleName" />
         <br /><br />
         
         Last Name: <input type = "text" name = "lastName" />
         <br /><br />
         
         Telephone No.: <input type = "text" name = "telephoneNo" />
         <br /><br />
         
         Email: <input type = "text" name = "email" />
         <br /><br />
         
         House No.: <input type = "text" name = "houseNo" />
         <br /><br />
         
         <input type = "submit" value = "Submit" />
      </form>
      </div>
</body>
</html>