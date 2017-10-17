<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<title>Battleship</title>
	<link rel="stylesheet" href="<c:out value="${pageContext.request.contextPath}"/>/static/css/style.css" type="text/css"/>
	<script src="<c:out value="${pageContext.request.contextPath}"/>/static/js/updateDataWithoutPageRefresh.js" type="text/javascript"></script>
	<script src="<c:out value="${pageContext.request.contextPath}"/>/static/js/postFormDataWithoutPageRefresh.js" type="text/javascript"></script>
	<script src="<c:out value="${pageContext.request.contextPath}"/>/static/js/cancelGame.js" type="text/javascript"></script>
	<script>let refreshInterval;</script>
</head>