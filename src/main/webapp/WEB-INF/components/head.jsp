<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<title>Battleship</title>
	<link rel="stylesheet" href="<c:out value="${pageContext.request.contextPath}"/>/css/style.css" type="text/css"/>
	<script src="<c:out value="${pageContext.request.contextPath}"/>/js/updateDataWithoutPageRefresh.js" type="text/javascript"></script>
	<script src="<c:out value="${pageContext.request.contextPath}"/>/js/postFormDataWithoutPageRefresh.js" type="text/javascript"></script>
	<script>let refreshInterval;</script>
</head>