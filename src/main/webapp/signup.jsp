<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.ssafy.sample.dto.User"%>
<!DOCTYPE html>
<html>
<head>
  <title>회원가입</title>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <!-- Bootstrap CSS v5.2.0-beta1 -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
    integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
      crossorigin="anonymous"	
    />
    
    <style>
      @import url("./style/search.css");
      .container-fluid {
        height: 450px;
        background-image: url("./assets/mainbg4.webp");
        background-repeat: no-repeat;
        background-size: cover;
        background-position: center;
      }
      .title{
      margin-bottom:5vh;
      	font-weight:600;
      	font-size:3rem;
      	color: #fff;
      	  text-shadow: 3px 3px 20px #aaa,
    -2px 1px 30px #aaa;
      }
      .nav{

      	box-shadow: rgba(99, 99, 99, 0.2) 0px 2px 8px 0px;
      	display: flex;
      	align-items: center;
      	height:5rem;
      }
      *{
      font-family: 'Open Sans', sans-serif;
      	}
      	form{
      	display: flex;
    	width: 90vw;
    	padding: 20px 20px;
	    flex-direction: column;
   	 	justify-content: center;
    	align-items: center;
    	border: none;
      	}
      	#login-font {
    position: relative;
    font-size: 3rem;
    font-weight: bold;
    color: #444;
    text-align: center;
}
input {
    width: 60%;
    height: 100%;
    /* margin-top: 5px; */
    border: 1px solid rgba(216,216,216,1);
    border-radius: 8px;
    padding-left: 20px;
    margin: 1rem 0;
    padding: 1rem;
}
.loginbutton{
    padding: 1rem;
    display: flex;
    align-items: center;
    justify-content: center;
    width: 50%;
}
    </style>
</head>





<body>
  <header >
      <!-- place navbar here -->
      <nav class="nav-container" style="background-color: #fff;width:100vw">
        <ul class="nav justify-content-center">
          <% User user =(User)request.getSession().getAttribute("userinfo");%>
          <% if(user!=null){ %>
          <li class="nav-item" >
            <a  class="nav-link" aria-current="page" href="./main?action=likes">즐겨찾기</a>
          </li>
          <%} %>
          <li class="nav-item">
            <a class="nav-link" href="./main?action=news">오늘의 뉴스</a>
          </li>
          <li class="nav-item">
          <a  class = "nav-link"href="./index.jsp">
          <img style="width:160px" src="./assets/logo.svg"/></a>
          </li>
          <%if(request.getSession().getAttribute("userinfo")==null){ %>
      <li class="nav-item">
            <a class="nav-link" href="./login.jsp">로그인</a>           
          </li>
          <li class="nav-item">
            <a class="nav-link" href="./signup.jsp">회원가입</a>
          </li>
          <%} %>
          
         
         <%  if(user!=null){ %>
          <li class="nav-item">
            <a class="nav-link" href="./edit.jsp">회원수정</a>           
          </li>
          <li class="nav-item">
            <a class="loginbutton" href="./user?action=logout">로그아웃</a>
          </li>
          <%} %>
        </ul>
      </nav>
    </header>
  <main>
    <div  class="container">
        <form action="./user" method="post" autocomplete="on" >
        	<input type="hidden" name="action" value="regist">
        	<label id="login-font">환영합니다</label>
           <input id = "ID" type="text" name="userid" placeholder="아이디 (영문/숫자, 6~16자)" minlength="6" maxlength="16" required pattern="[a-z0-9]+">
            <input id = "PW" type="password" name="password" placeholder="비밀번호 (영문/숫자 조합, 8~16자)"  minlength="8" maxlength="16" autocomplete="off" required pattern="[a-zA-Z0-9]+">
            <input id = "PW" type="password" name="username" placeholder="이름">
            <input id = "PW" type="password" name="address" placeholder="주소">
            <input id = "PW" type="password" name="phone" placeholder="전화번호">

               
           
            <input id="button" type="submit" value="가입하기" onclick="javascript:alert('제출양식이 만족되었다면, 회원가입이 완료 되었습니다. 뒤로가기한 다음 로그인해주세요!');">
        </form>
    </div>



  </main>

  <footer>
    <!-- place footer here -->

  </footer>
  <!-- Bootstrap JavaScript Libraries -->
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js"
    integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk" crossorigin="anonymous">
  </script>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.min.js"
    integrity="sha384-ODmDIVzN+pFdexxHEHFBQH3/9/vQ9uori45z4JjnFsRydbmQbmL5t1tQ0culUzyK" crossorigin="anonymous">
  </script>

</body>
</html>