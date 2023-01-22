<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model.*"%>
<%@page import="repository.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<jsp:useBean id="customer"
  class="model.Customer" />

 <jsp:setProperty property="*" name="customer" />

 <%
  CustomerRepository customerRepo = new CustomerRepository();
  int status = customerRepo.saveCustomer(customer);
  if (status > 0) {
	  response.sendRedirect("customerLists.jsp");
  } else {
	  out.print("There is some problems!!!");
  }
 %>


</body>
</html>