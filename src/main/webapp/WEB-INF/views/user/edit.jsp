<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" ></c:set>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
      rel="stylesheet"
    />
    <script
      src="https://kit.fontawesome.com/53a8c415f1.js"
      crossorigin="anonymous"
    ></script>
    <link rel="stylesheet" href="/css/makeId.css" />
</head>
<body>
<form action="" id="form-join" method="POST" class="joinForm" onsubmit="DoJoinForm__submit(this); return false;">
	<input type="hidden" name="action" value="edit">                                                                                     
    <h2>회원정보 수정</h2>
   	<div class="textForm">
      <input name="userid" id="userId" type="hidden" class="id" placeholder="아이디" value="${userinfo.userid}">
    </div>
    <div class="textForm">
      <input name="password" id="userPwd" type="password" class="pw" placeholder="비밀번호">
    </div>
    <div class="textForm">
      <input name="username" id="userName" type="text" class="name" placeholder="이름">
    </div>
     <div class="textForm">
      <input name="address" id="address" type="text" class="address" placeholder="주소">
    </div>
    <div class="textForm">
      <input name="phone" id="phone" type="text" class="phone" placeholder="전화번호">
    </div>
    <input type="submit" id="btn-join" class="btn" value="E D I T"/>
</form>
</body>
<script>
document.querySelector("#btn-join").addEventListener("click", function () {
    if (!document.querySelector("#userId").value) {
      alert("아이디 입력!!");
      return;
    } else if (!document.querySelector("#userPwd").value) {
      alert("비밀번호 입력!!");
      return;
    } else if (!document.querySelector("#userName").value) {
      alert("이름 입력!!");
      return;
    } else if (!document.querySelector("#address").value) {
      alert("주소 입력!!");
      return;
    } else if (!document.querySelector("#phone").value) {
      alert("전화번호 확인!!");
      return;
    } else {
      let form = document.querySelector("#form-join");
      form.setAttribute("action", "/user/regist");
      form.submit();
    }
  });
</script>
</html>