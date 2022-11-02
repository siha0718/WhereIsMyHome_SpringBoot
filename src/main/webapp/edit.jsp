<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.ssafy.sample.dto.User"%>
<!DOCTYPE html>
<html>
<head>
  <title>회원정보 수정</title>
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
      @import url("./style/signup.css");
      
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
          
         <% if(user!=null){ %>
          <li class="nav-item">
            <a class="nav-link" href="./edit.jsp">회원수정</a>           
          </li>
          <li class="nav-item">
            <a class="nav-link" href="./user?action=logout">로그아웃</a>
          </li>
          <%} %>
        </ul>
      </nav>
    </header>
  <main>
    <div  class="container">
        <label id="signup">회원정보 수정</label>
        <form action="./user" method="post" autocomplete="on" >
        	<input type="hidden" name="action" value="edit">
            <table border="0">
                
                <tr>
                    <td>이름</td>
                    <td><input type="text" name="username" value=<%=user.getUsername() %>></td>
                    <td></td>
                </tr>
                <tr>
                    <td>주소</td>
                    <td><input type="address" name="address" value=<%=user.getAddress() %>></td>
                </tr>
                <tr>
                    <td>전화번호</td>
                    <td><input type="tel" name="phone" value=<%=user.getPhone() %>></td>
                </tr>
            </table>
            <input id="button" type="submit" value="수정하기" >
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