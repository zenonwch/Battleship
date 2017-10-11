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
		<style>
			.custom-rb > input:checked +div {
				display: block !important;
			}

			.custom-rb {
				display: block;
				height: 23px;
				width: 23px;
				margin: 0px;
				padding: 0px;
				position: relative;
			}

			.custom-rb > input {
				display: none;
				width: 0;
				height: 0;
				margin: 0;
				padding: 0;
			}

			.div-rb {
				display: none;
				width: 20px;
				height: 20px;
				background-color: gray;
				align-content: center;
				margin: -10px 0 0 -10px;
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
		<form method="post" action="<c:url value="/fire"/>">
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
											<label class="custom-rb">
												<input type="radio" id="radio" name="addr" value="<c:out value="${addr}"/>"/>
												<div class="div-rb"></div>
											</label>
										</td>
									</c:forEach>
								</tr>
							</c:forEach>
						</table>
					</td>
				</tr>

			</table>
			<button>Fire!</button>
		</form>
	</body>
</html>
