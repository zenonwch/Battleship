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
		<style>
			.custom-cb > input:checked +div {
				display: block !important;
			}

			.custom-cb {
				display: block;
				height: 23px;
				width: 23px;
				margin: 0px;
				padding: 0px;
				position: relative;
			}

			.custom-cb > input {
				display: none;
				width: 0;
				height: 0;
				margin: 0;
				padding: 0;
			}

			.div-cb {
				display: none;
				width: 21px;
				height: 21px;
				background-color: gray;
				align-content: center;
				margin: -11px 0 0 -10px;
				top: 50%;
				left: 50%;
				position: absolute;
			}

			table.field {
				border: 1px solid black;
			}

			table.field td {
				width: 25px;
				height: 25px;
				margin: 0px;
				padding: 0px;
				border: 1px dotted gray;
				text-align: center;
			}
		</style>
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
			<table class="field">
				<c:forEach var="row" items="1,2,3,4,5,6,7,8,9,10">
					<tr>
						<c:forEach var="col" items="A,B,C,D,E,F,G,H,I,J">
							<c:set var="addr" value="${col}${row}"/>
							<td>
								<label class="custom-cb">
									<input type="checkbox" id="checkbox" name="cell" value="<c:out value="${addr}"/>"
									       <c:if test="${playerManager.player.myField.content[addr] eq 'SHIP'}">checked</c:if>
									       title="cell">
									<div class="div-cb"></div>
								</label>
							</td>
						</c:forEach>
					</tr>
				</c:forEach>
			</table>
			<br>
			<button>Ready</button>
		</form>
	</body>
</html>
