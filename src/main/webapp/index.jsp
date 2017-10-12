<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<%@ include file="WEB-INF/components/head.jsp" %>
	<body>
		<h1>Welcome to Battleship!</h1>
		<form method="post" action="<c:url value="/registration"/>">
			<label>Enter your name</label>
			<input type="text" placeholder="UserName" name="username">
			<button class="start">Start</button>
		</form>
	</body>
</html>
