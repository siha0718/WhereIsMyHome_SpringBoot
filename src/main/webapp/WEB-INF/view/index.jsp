<%@page import="com.ssafy.sample.dto.Apt"%>
<%@page import="com.ssafy.sample.dto.User"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>메인페이지</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
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
      	
      .card-header{
      	display: flex;
      	justify-content: space-between;
      }
      .count{
      	width: 1.8rem;
    	aspect-ratio: 1;
    	border-radius: 100px;
    	background-color: #4B8Ef7;
  	  	display: flex;
 	   	justify-content: center;
  	  	align-items: center;
  	  	font-size: 0.8rem;
    	font-weight: 600;
      }
      .count-container{
        display: flex;
    	align-items: center;
    	font-size: 0.8rem;
    	font-weight: 600;
    }
    .dong-name{
    	margin-bottom: 1rem;
    	font-weight: 600;
    	font-size: 2rem;
    	color: #333;
    	text-shadow: 3px 3px 2px #aaa, -2px 1px 3px #aaa;
    }
    </style>
  </head>
<body style="overflow-x:hidden">

   <% User user =(User)request.getSession().getAttribute("userinfo");%>
  

    <header >
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
    <main>
 
      <form action="main?action=showApt" method="POST" class="container-fluid" id="my-form">

		
        <div style="height: 70px"></div>
        <h2 class="text-center title" }>Find it. Tour it. Own it.</h2>
        <div style="display:flex;justify-content: center;">
          
          <div class="form-group col-md-2">
            <select class="form-select " id="sido" name="sido" form="my-form">
              <option value="">시도선택</option>
            </select>
          </div>
          
          <div class="form-group col-md-2">
            <select class="form-select " id="gugun" name="gugun" form="my-form">
              <option value="">구군선택</option>
            </select>
          </div>
          <div class="form-group col-md-2">
            <select class="form-select " id="dong" name="dong" form="my-form">
              <option value="">동선택</option>
            </select>
          </div>
          
          <div >
            <button type="submit" id="list-btn" class="btn btn-light">찾기</button>
          </div>
        </div>
      </form>
       
       <% ArrayList<Apt> apts=(ArrayList<Apt>)request.getAttribute("list");
          if(apts==null){%>
          
       <div class="boards-container">
      	<div class="card" style="box-shadow: rgba(0, 0, 0, 0.15) 1.95px 1.95px 2.6px">
  		<img src="./assets/Sell_a_home.webp" class="card-img-top" alt="...">
  		<div class="card-body">
    	<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
  		</div>
		</div>
		
		<div class="card" style="box-shadow: rgba(0, 0, 0, 0.15) 1.95px 1.95px 2.6px">
  		<img src="./assets/Buy_a_home.webp" class="card-img-top" alt="...">
  		<div class="card-body">
    	<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
  		</div>
		</div>
		
		<div class="card" style="box-shadow: rgba(0, 0, 0, 0.15) 1.95px 1.95px 2.6px">
  		<img src="./assets/Rent_a_home.webp" class="card-img-top" alt="...">
  		<div class="card-body">
    	<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
  		</div>
		</div>
		
	</div>
	<%} %>
	
      <%if(apts!=null && apts.size()==0){ %>
          	<div>
          		검색결과가 없습니다.
          	</div>
          <%} %>
          
      <div class="content">
   
        <div class="map-container" id="map-id"></div>
        <div class="container">
          <h1 class="dong-name"><%=request.getAttribute("dongName") %></h1>
          <div class="controller">
            <!-- <div class="btn-group" role="group" aria-label="Button group name">
              <button type="button" class="btn btn-primary">First One</button>
              <button type="button" class="btn btn-primary">Second One</button>
            </div> -->
            <button type="button" class="btn btn-primary">
              총 거래량 <span id="total-cnt" class="badge text-bg-secondary">4</span>
            </button>
            <div class="center">
              <button id="star-btn" type="button" class="btn btn-warning">즐겨찾기 추가</button>
            </div>
          </div>
          
          <%String dongCode = (String)request.getAttribute("dongCode"); %>
          <% ArrayList<Apt> aptlist =(ArrayList<Apt>)request.getAttribute("list");%>
		<% int row = 0;
			if(aptlist != null){
				row = aptlist.size();
			}			
		%>
         
         <%if(apts!=null){%>
          <div class="card-container">
          <%for(Apt apt:apts){%>	
            <div class="card">
              <h5 class="card-header">
              <span><%=apt.getAptName() %></span>
              <%if(apt.getCount()>0){ %>
              <span class="count-container">
              <span class="count"><%=apt.getCount() %></span>
				건
              </span>
              <%} %>
              </h5>
              <div class="card-body">
                <h5 class="card-title"><%if(apt.getCount()>0){ %> 평균<%} %> <%=apt.getDealAmount() %>만원</h5>
               <%if(apt.getCount()>0){ %> <a href="./main?action=next&dong=<%=dongCode%>&aptName=<%=apt.getAptName() %>" class="btn btn-primary">자세히 보기</a>
              <%} %>
              </div>
            </div>
          <% } %>
          </div>
          <%}%>
          <div class="center">
          
          
          <a href="./main?action=next&dong=<%=dongCode%>&listSize=<%=row%>">
              <button id="nextPage" type="button" class="btn btn-warning">더보기</button>
          </a>
           </div>
          
          </div>
          
      
          
        </div>
      </div>
    </main>

     <script
    type="text/javascript"
    src="//dapi.kakao.com/v2/maps/sdk.js?appkey=df09d49229d4b893dec59e75fc646014&libraries=services"
  ></script>
  <script src="" type="module"></script>
  <script src="./js/index.js" type="module"></script>
  <script>
  <%if(apts!=null&&apts.size()>0 ){ %>

	  const content = document.querySelector(".content");
	  content.style.display = "grid";

	  var mapContainer = document.getElementById("map-id");

	  var mapOption = {
	    center: new kakao.maps.LatLng("<%=apts.get(0).getLat()%>", "<%=apts.get(0).getLng()%>"),
	    level: 3,
	  };
	 

	  var map = new kakao.maps.Map(mapContainer, mapOption);
	  var geocoder = new kakao.maps.services.Geocoder();

	  var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
	 // const addressText = `${address[0]} ${address[1]} ${address[2]}`;

	  // 나중에 대학로 00047 을 addressText 로 바꿔야함
	
	  document.getElementById("total-cnt").innerHTML = <%=apts.size()%>;
	  <%}%>
	
	  // apts 들 지도에 표시하는 코드
	<% if(apts!=null){
	for(Apt apt:apts){%>
	          var imageSize = new kakao.maps.Size(24, 35);
	          var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
	  
	          var marker = new kakao.maps.Marker({
	            map: map, // 마커를 표시할 지도
	            position: new kakao.maps.LatLng("<%=apt.getLat()%>", "<%=apt.getLng()%>"), // 마커를 표시할 위치
	            title: "<%=apt.getAptName()%>", // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	            image: markerImage, // 마커 이미지
	            clickable: true,
	          });


	<%}}%>
	
	document.querySelector("#star-btn").addEventListener("click",()=>{
		fetch("./user?action=star&dongCode="+<%=dongCode%>)
	})
	
	

	  
	  
  
  </script>
</body>
</html>