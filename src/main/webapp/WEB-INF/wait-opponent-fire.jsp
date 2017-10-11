<%--
  Created by IntelliJ IDEA.
  User: andrey.veshtard
  Date: 10/11/2017
  Time: 14:53
  To change this template use File | Settings | File Templates.
--%>
<%--@elvariable id="playerManager" type="lv.ctco.battleship.model.PlayerManager"--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
	<head>
		<title>Battleship</title>
		<meta http-equiv="refresh" content="3">
		<style>
			table.field {
				border: 1px solid black;
			}

			table.field td {
				width: 25px;
				height: 25px;
				border: 1px dotted gray;
				text-align: center;
			}

			table.field td.SHIP {
				background-color: gray;
			}

			table.field td.HIT {
				background-color: darkred;
			}

			table.field td.MISS {
				background-color: aqua;
			}
		</style>
	</head>
	<body>
		<table>
			<tr>
				<td>
					<table class="field">
						<td></td>
						<c:forEach var="col" items="A,B,C,D,E,F,G,H,I,J">
							<td><c:out value="${col}"/></td>
						</c:forEach>
						<c:forEach var="row" items="1,2,3,4,5,6,7,8,9,10">
							<tr>
								<td><c:out value="${row}"/></td>
								<c:forEach var="col" items="A,B,C,D,E,F,G,H,I,J">
									<c:set var="addr" value="${col}${row}"/>
									<td class="<c:out value="${playerManager.player.myField.content[addr]}"/>">
									</td>
								</c:forEach>
							</tr>
						</c:forEach>
					</table>
				</td>
				<td>
					<table class="field">
						<td></td>
						<c:forEach var="col" items="A,B,C,D,E,F,G,H,I,J">
							<td><c:out value="${col}"/></td>
						</c:forEach>
						<c:forEach var="row" items="1,2,3,4,5,6,7,8,9,10">
							<tr>
								<td><c:out value="${row}"/></td>
								<c:forEach var="col" items="A,B,C,D,E,F,G,H,I,J">
									<c:set var="addr" value="${col}${row}"/>
									<td class="<c:out value="${playerManager.player.opponentField.content[addr]}"/>">
									</td>
								</c:forEach>
							</tr>
						</c:forEach>
					</table>
				</td>
			</tr>
		</table>
	</body>
</html>
