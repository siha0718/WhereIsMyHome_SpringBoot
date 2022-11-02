<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="author" content="Untree.co" />
<link rel="shortcut icon" href="favicon.png" />

<meta name="description" content="" />
<meta name="keywords" content="bootstrap, bootstrap5" />

<title>
구해줘 홈즈
</title>

<%-- 부트스트랩 사용을 위한 코드 --%>
<!-- CSS only -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@400;500;600;700&display=swap"
	rel="stylesheet"
/>

<link rel="stylesheet" href="/fonts/icomoon/style.css" />
<link rel="stylesheet" href="/fonts/flaticon/font/flaticon.css" />

<link rel="stylesheet" href="/css/tiny-slider.css" />
<link rel="stylesheet" href="/css/aos.css" />
<link rel="stylesheet" href="/css/style.css" />
<script>
	<c:if test="${!empty msg}">
		alert("${msg}");
	</c:if>
</script>