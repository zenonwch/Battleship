<%--@elvariable id="errorNotEnough" type="lv.ctco.battleship.controller.PlacementServlet"--%>
<%--@elvariable id="errorTooMany" type="lv.ctco.battleship.controller.PlacementServlet"--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="error">
	<h3>
		<c:if test="${errorNotEnough}">Not enough ships!</c:if>
		<c:if test="${errorTooMany}">The are too many ships!</c:if>
	</h3>
</div>
