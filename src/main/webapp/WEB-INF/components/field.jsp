<%--@elvariable id="playerManager" type="lv.ctco.battleship.model.PlayerManager"--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table class="field">
	<tr>
		<td></td>
		<c:forEach var="col" items="A,B,C,D,E,F,G,H,I,J">
			<td><c:out value="${col}"/></td>
		</c:forEach>
	</tr>
	<c:forEach var="row" items="1,2,3,4,5,6,7,8,9,10">
		<tr>
			<td><c:out value="${row}"/></td>
			<c:forEach var="col" items="A,B,C,D,E,F,G,H,I,J">
				<c:set var="addr" value="${col}${row}"/>
				<td class="
				<c:if test="${fieldContent.equals('my') && mode.equals('show')}">
							<c:out value="${playerManager.player.myField.content[addr]}"/>
				</c:if>
				<c:if test="${fieldContent.equals('opponent')}">
					<c:out value="${playerManager.player.opponentField.content[addr]}"/>
				</c:if>
						">
					<c:if test="${!mode.equals('show')}">
						<label class="cell">
							<c:if test="${mode.equals('fire')}">
								<%@ include file="single-selection.jsp" %>
							</c:if>
							<c:if test="${mode.equals('place')}">
								<%@ include file="multi-selection.jsp" %>
							</c:if>
							<span></span>
						</label>
					</c:if>
				</td>
			</c:forEach>
		</tr>
	</c:forEach>
</table>
