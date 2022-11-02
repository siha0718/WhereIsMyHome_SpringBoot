<%@page import="com.ssafy.sample.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>오늘의 뉴스</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,600,600i,700,700i" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="vendor/boxicons/css/boxicons.min.css" rel="stylesheet">

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


    <!-- Template Main CSS File -->
    <style>
        @import url("./style/style.css");       
    </style>
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
    </style>

    
</head>
<body>
<% User user =(User)request.getSession().getAttribute("userinfo");%>
 <header>
      <!-- place navbar here -->
      <nav class="nav-container" style="background-color: #fff;width:100vw">
        <ul class="nav justify-content-center">
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
          <%if(user!=null){ %>
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
	<section id="why-us" class="why-us section-bg">

        <h1 class="text-center newsTitle">News</h1>

        <div class="container">
            
            <div class="row">
                <div class="col-lg-4 col-md-6 d-flex align-items-stretch">
                <div class="card">
                    <img src="assets/news1.jpg" class="card-img-top" alt="...">
                    <div class="card-icon">
                    <i class="bx bx-book-reader"></i>
                    </div>
                    <div class="card-body">
                    <h5 class="card-title"><a href="">제주 첫 공공전세주택 10세대 경쟁률 '13.8대 1'</a></h5>
                    <p class="card-text">[한라일보] 제주특별자치도개발공사가 도내 중산층의 주거안정을 위해 처음으로 공급한 공공전세 주택의 입주자 모집 결과 평균 13.8 대 1의 경쟁률을 보였다.

                        접수결과 총 10호 모집에 138호가 지원했다. 제주시지역은 6호(아라동) 모집에 116호가 지원하며 19.3 대 1, 서귀포시 4호(서귀동) 모집에 22호 지원으로 5.5대 1의 경쟁률을 보였다. 특히, 제주시 지역은....</p>
                    </div>
                </div>
                </div>
                <div class="col-lg-4 col-md-6 d-flex align-items-stretch">
                <div class="card">
                    <img src="assets/news2.jpg" class="card-img-top" alt="...">
                    <div class="card-icon">
                    <i class="bx bx-calendar-edit"></i>
                    </div>
                    <div class="card-body">
                    <h5 class="card-title"><a href="">"재산세 보고 깜짝 놀랐다"…상승률 상한 서울 주택, 작년比 급감</a></h5>
                    <p class="card-text">
                        올해 서울에서 공시가격 6억원 초과 주택 가운데 재산세 상한까지 오른 가구가 급감한 것으로 조사됐다. 주택분 재산세 과세표준 기준인 공정시장가액비율을 60%에서 45%로 낮춘 지방세법 시행령(6월 30일)의 효과 때문으로 풀이된다. 개정 당시 윤석열 정부는 공시가격 9억원 이하 1주택자에 대한 세율 특례도 추가로 적용했다.
                    </p>
                    </div>
                </div>
                </div>
                <div class="col-lg-4 col-md-6 d-flex align-items-stretch">
                <div class="card">
                    <img src="assets/news3.jpg" class="card-img-top" alt="...">
                    <div class="card-icon">
                    <i class="bx bx-landscape"></i>
                    </div>
                    <div class="card-body">
                    <h5 class="card-title"><a href="">시흥시 '공동주택 RFID 종량기' 설치사업 수요조사 시행</a></h5>
                    <p class="card-text">
                        경기 시흥시는 음식물류 폐기물 감량과 배출 환경 개선을 위해 '2023년 공동주택 음식물류 폐기물 종량기(RFID) 설치사업에 대한 수요조사를 실시한다고 7일 밝혔다.

RFID 방식은 가정에서 음식물류 폐기물을 배출할 때 카드를 먼저 인식시킨 후, 버린 무게만큼 수수료를 부담하는 방식이다.
                    </p>
                    </div>
                </div>
                </div>
            </div>
  
        </div>
      </section><!-- End News Section -->
<!-- Vendor JS Files -->
<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="assets/vendor/php-email-form/validate.js"></script>

<!-- Template Main JS File -->
<script src="assets/js/main.js"></script>

</body>
</html>