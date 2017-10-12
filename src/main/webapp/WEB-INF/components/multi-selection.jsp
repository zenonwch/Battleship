<%--@elvariable id="playerManager" type="lv.ctco.battleship.model.PlayerManager"--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<input type="checkbox" id="checkbox" name="cell" value="<c:out value="${addr}"/>"
       <c:if test="${playerManager.player.myField.content[addr] eq 'SHIP'}">checked</c:if>
       title="cell"/>