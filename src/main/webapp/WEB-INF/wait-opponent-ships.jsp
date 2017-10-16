<%--@elvariable id="playerManager" type="lv.ctco.battleship.model.PlayerManager"--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
	<%@ include file="components/head.jsp" %>
	<body>
		<h1><c:out value="${playerManager.player.name}"/></h1>
		<h2>Please wait for opponent...</h2>
		<script>let timeout = 3;</script>
		<%@ include file="autorefresh.jsp" %>
	</body>
</html>
