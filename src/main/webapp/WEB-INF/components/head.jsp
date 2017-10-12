<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<title>Battleship</title>
	<link rel="stylesheet" href="<c:out value="${pageContext.request.contextPath}"/>/css/style.css" type="text/css">
	<c:if test="${refreshTimeout != null}">
		<meta http-equiv="refresh" content="<c:out value="${refreshTimeout}"/>">
	</c:if>
</head>