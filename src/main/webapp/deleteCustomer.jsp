<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="repository.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%

  CustomerRepository customerRepo = new CustomerRepository();

  String id = request.getParameter("id").toString();
  int status = customerRepo.deleteCustomer(Integer.parseInt(id));
  if (status > 0) {
	  response.sendRedirect("customerLists.jsp");
  } else {
	  out.print("There is some problems!!!");
  }
 %>
</body>
</html>