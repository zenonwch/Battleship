<%--
  Created by IntelliJ IDEA.
  User: andrey.veshtard
  Date: 10/4/2017
  Time: 16:17
  To change this template use File | Settings | File Templates.
--%>
<%--@elvariable id="playerManager" type="lv.ctco.battleship.model.PlayerManager"--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
	<head>
		<title>Battleship</title>
		<meta http-equiv="refresh" content="3">
	</head>
	<body>
		<h1><c:out value="${playerManager.player.name}"/></h1>
		<h2>Please wait for opponent...</h2>
	</body>
</html>
