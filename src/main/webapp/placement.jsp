<%--@elvariable id="playerManager" type="lv.ctco.battleship.model.PlayerManager"--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
	<%@ include file="WEB-INF/components/head.jsp" %>
	<body>
		<h1>Hello, <c:out value="${playerManager.player.name}"/>!!!</h1>
		<h2>Please set your ships.</h2>
		<%@ include file="WEB-INF/components/errors.jsp"%>
		<form method="post" action="<c:url value="/placement"/>">
			<c:set var="mode" value="place" scope="page"/>
			<c:set var="fieldContent" value="my" scope="page"/>
			<%@ include file="WEB-INF/components/field.jsp" %>
			<br>
			<button>Ready</button>
		</form>
	</body>
</html>
