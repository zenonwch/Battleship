<%--@elvariable id="playerManager" type="lv.ctco.battleship.model.PlayerManager"--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<%@ include file="components/head.jsp" %>
	<body>
		<h1>Hello, <c:out value="${playerManager.player.name}"/>!!!</h1>
		<h2>Please wait for opponent...</h2>
		<script>let timeout = 3;</script>
		<%@ include file="autorefresh.jsp" %>
	</body>
</html>
