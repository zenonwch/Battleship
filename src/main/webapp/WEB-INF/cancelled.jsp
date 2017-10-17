<%--@elvariable id="playerManager" type="lv.ctco.battleship.model.PlayerManager"--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
	<%@ include file="components/head.jsp" %>
	<body>
		<h1>Sorry, <c:out value="${playerManager.player.name}"/>!</h1>
		<h2>Your opponent cancelled the game!</h2>
	</body>
</html>
