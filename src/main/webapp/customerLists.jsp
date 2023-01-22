<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="repository.*" %>
<%@page import="java.sql.ResultSet" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customers</title>
<link rel="stylesheet" href="./css/style.css">
<style>
table {
  border-collapse: collapse;
  width: 1200px;
  margin: auto;
}

th, td {
  text-align: left;
  padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}

th {
  background-color: #62aff2;
  color: white;
}
</style>
</head>
<body>
<!-- Header Menu of the Page -->
<%@ include file="header.html" %>

	<table>
		<thead>
			<tr>
				<th>id</th>
				<th>First Name</th>
				<th>Middle Name</th>
				<th>Last Name</th>
				<th>Telephone No.</th>
				<th>Email</th>
				<th>House No.</th>
				<th></th>
			</tr>
		</thead>
		
		<tbody>
		<%
			CustomerRepository customerRep = new CustomerRepository();
			ResultSet rs = customerRep.getCustomers();
			
			while(rs.next()) {
				%>
					<tr>
						<td><%= rs.getInt(1) %></td>
						<td><%= rs.getString(2) %></td>
						<td><%= rs.getString(3) %></td>
						<td><%= rs.getString(4) %></td>
						<td><%= rs.getString(5) %></td>
						<td><%= rs.getString(6) %></td>
						<td><%= rs.getString(7) %></td>
						<td><a href="deleteCustomer.jsp?id=<%=rs.getInt(1)%>" >Delete</a></td>
					</tr>
				<%
			}
		%>
			<tr>
		</tbody>
	</table>

</body>
</html>