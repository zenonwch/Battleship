<%--
  Created by IntelliJ IDEA.
  User: andrey.veshtard
  Date: 10/4/2017
  Time: 15:01
  To change this template use File | Settings | File Templates.
--%>
<%--@elvariable id="playerManager" type="lv.ctco.battleship.model.PlayerManager"--%>
<%--@elvariable id="errorNotEnough" type="lv.ctco.battleship.controller.PlacementServlet"--%>
<%--@elvariable id="errorTooMany" type="lv.ctco.battleship.controller.PlacementServlet"--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
	<head>
		<title>Battleship</title>
	</head>
	<body>
		<h1>Hello, <c:out value="${playerManager.player.name}"/>!!!</h1>
		<h2>Please set your ships.</h2>
		<c:if test="${errorNotEnough}">
			<div style="width: 250px; background-color: #f7d7de;">
				<h3 style="color: #bf0707;">Not enough ships!</h3>
			</div>
		</c:if>
		<c:if test="${errorTooMany}">
			<div style="width: 250px; background-color: #f7d7de;">
				<h3 style="color: #bf0707;">The are too many ships!</h3>
			</div>
		</c:if>
		<form method="post" action="<c:url value="/placement"/>">
			<table>
				<c:forEach var="row" items="1,2,3,4,5,6,7,8,9,10">
					<tr>
						<c:forEach var="col" items="A,B,C,D,E,F,G,H,I,J">
							<c:set var="addr" value="${col}${row}"/>
							<td>
								<input type="checkbox" name="cell" value="<c:out value="${addr}"/>"
								       <c:if test="${playerManager.player.myField.content[addr] eq 'SHIP'}">checked</c:if>
								       title="cell">
							</td>
						</c:forEach>
					</tr>
				</c:forEach>
			</table>
			<button>Ready</button>
		</form>
	</body>
</html>
