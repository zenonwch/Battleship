<%--@elvariable id="playerManager" type="lv.ctco.battleship.model.PlayerManager"--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<c:set var="refreshTimeout" value="3" scope="page"/>
	<%@ include file="components/head.jsp" %>
	<body>
		<h1>Hello, <c:out value="${playerManager.player.name}"/>!!!</h1>
		<h2>Please wait for opponent...</h2>
	</body>
</html>
