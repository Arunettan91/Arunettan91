<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import = "com.sap.Database.DatabaseConnection" %>
    <%@page import = "java.sql.Connection" %>
    <%@page import = "java.sql.PreparedStatement" %>
    <%@page import = "java.sql.ResultSet" %>
      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style >
html,
body {
	height: 100%;
}

body {
	margin: 0;
	background: linear-gradient(45deg, #49a09d, #5f2c82);
	font-family: sans-serif;
	font-weight: 100;
}

.container {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

table {
	width: 800px;
	border-collapse: collapse;
	overflow: hidden;
	box-shadow: 0 0 20px rgba(0,0,0,0.1);
}

th,
td {
	padding: 15px;
	background-color: rgba(255,255,255,0.2);
	color: #fff;
}

th {
	text-align: left;
}

thead {
	th {
		background-color: #55608f;
	}
}

tbody {
	tr {
		&:hover {
			background-color: rgba(255,255,255,0.3);
		}
	}
	td {
		position: relative;
		&:hover {
			&:before {
				content: "";
				position: absolute;
				left: 0;
				right: 0;
				top: -9999px;
				bottom: -9999px;
				background-color: rgba(255,255,255,0.2);
				z-index: -1;
			}
		}
	}
}
</style>
</head>
<body>
<h2> User Information </h2>
<div class="container">
	<table>
		<thead>
			<tr>
				<th>S.No</th>
				<th>Name</th>
				<th>Username</th>
				<th>Email</th>
				<th>Mobile.No</th>
			</tr>
		</thead>
		
		<% 
		
		try{
			Connection con1 = null;
			con1 = DatabaseConnection.createConnection();
			PreparedStatement ps1 = con1.prepareStatement("SELECT * FROM `register` ");
			ResultSet rs = ps1.executeQuery();
			
		%>
		
		<tbody>
		<%
		int ii =1;
		while(rs.next()){
		%>
			<tr>
				<td><%=ii %></td>
				<td><%=rs.getString("name") %></td>
				<td><%=rs.getString("username") %></td>
				<td><%=rs.getString("email") %></td>
				<td><%=rs.getString("mobileno") %></td>
			</tr>
			<%
			ii++;
		}
			%>
		</tbody>
	</table>
	<%
	 con1.close();
	
	%><br>
	
	<%
	} catch(Exception e) {
		e.printStackTrace();
		
	}
	%>
</div>
</body>
</html>