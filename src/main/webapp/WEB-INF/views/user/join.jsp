<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" ></c:set>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/include/head.jsp" %>
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
    <link rel="stylesheet" href="${root }/css/makeId.css" />
</head>
<body>
<form action="" id="form-join" method="POST" class="joinForm" onsubmit="DoJoinForm__submit(this); return false;">
	<input type="hidden" name="action" value="join">                                                                                     
    <h2>회원가입</h2>
    <div class="textForm">
      <input name="userId" id="userId" type="text" class="id" placeholder="아이디">
      </input>
    </div>
    <div class="textForm">
      <input name="userPwd" id="userPwd" type="password" class="pw" placeholder="비밀번호">
    </div>
    <div class="textForm">
      <input name="userName" id="userName" type="text" class="name" placeholder="이름">
    </div>
     <div class="textForm">
      <input name="emailid" id="emailid" type="text" class="email" placeholder="이메일아이디">
    </div>
    <div class="textForm">
      <input name="emailDomain" id="emailDomain" type="text" class="name" placeholder="이메일도메인">
    </div>
    <input type="submit" id="btn-join" class="btn" value="J O I N"/>
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
    } else if (!document.querySelector("#emailid").value) {
      alert("이메일 아이디 입력!!");
      return;
    } else if (!document.querySelector("#emailDomain").value) {
      alert("이메일 확인!!");
      return;
    } else {
      let form = document.querySelector("#form-join");
      form.setAttribute("action", "${root}/user");
      form.submit();
    }
  });
</script>
</html>