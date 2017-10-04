<%--
  Created by IntelliJ IDEA.
  User: andrey.veshtard
  Date: 10/2/2017
  Time: 14:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<title>Battleship</title>
	</head>
	<body>
		<h1>Welcome to Battleship!</h1>
		<form method="post" action="<c:url value="/registration"/>">
			<label>Enter your name</label>
			<input type="text" placeholder="UserName" name="username">
			<button>Start</button>
		</form>
	</body>
</html>
