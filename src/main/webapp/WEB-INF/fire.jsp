<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<%@ include file="components/head.jsp" %>
	<body>
		<form method="post" action="<c:url value="/fire"/>">
			<table>
				<tr>
					<td>
						<c:set var="mode" value="show" scope="page"/>
						<c:set var="fieldContent" value="my" scope="page"/>
						<%@ include file="components/field.jsp" %>
					</td>
					<td>
						<c:set var="mode" value="fire" scope="page"/>
						<c:set var="fieldContent" value="opponent" scope="page"/>
						<%@ include file="components/field.jsp" %>
					</td>
				</tr>
			</table>
			<button>Fire!</button>
		</form>
	</body>
</html>
