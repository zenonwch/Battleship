<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<%@ include file="components/head.jsp" %>
	<body>
		<form id="fire">
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
		</form>
		<br>
		<button onclick="postForm()" id="fire-button" class="submit">Fire!</button>
		<button onclick="cancel()">Cancel</button>
		<%@ include file="click-button-on-enter.jsp" %>
		<script>let timeout = 1;</script>
		<%@ include file="autorefresh.jsp" %>
	</body>
</html>
