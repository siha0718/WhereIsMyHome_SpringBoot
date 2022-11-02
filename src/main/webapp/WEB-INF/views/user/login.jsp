<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="${root }/css/login.css" />
</head>
<body>
<div class="wrap">
      <div class="login">
        <h2>로그인</h2>
        <div class="login_sns">
          <li>
            <a href="#"><i class="fab fa-instagram"></i></a>
          </li>
          <li>
            <a href="#"><i class="fab fa-facebook-f"></i></a>
          </li>
          <li>
            <a href="#"><i class="fab fa-twitter"></i></a>
          </li>
        </div>
        <form method="POST" action="${root }/user">
        <input type="hidden" name="action" value="login">
        <div class="login_id">
          <h4>ID</h4>
          <input type="text" class="form-control" id="id" placeholder="ID 입력" value="${cookie.rememberid.value}" name="userId">
        </div>
        <div class="login_pw">
          <h4>Password</h4>
          <input type="password" id="pw" placeholder="비밀번호 입력" name="userPwd">
        </div>
        <div class="login_etc">
          <div class="checkbox">
            <input type="checkbox" name="remember" value="ok"> 아이디 기억하기
          </div>
        </div>
        <div class="submit">
          <input type="submit" value="submit" />
        </div>
        <div class="join">
        	<a href="${root }/user/join.jsp">회원가입</a>
        </div>
      </div>
    </div>
</body>
</html>