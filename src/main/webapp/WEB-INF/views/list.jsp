<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <%@ include file="/WEB-INF/views/include/head.jsp" %>
</head>

<body>
  <%@ include file="/WEB-INF/views/include/nav.jsp" %>

  <div class="section">
    <div class="container">
    
    
      <div class="row mb-5 align-items-center">
        <div class="col-lg-6">
          <h2 class="font-weight-bold text-primary heading" id="houses">
            Result
          </h2>
        </div>
      </div>
      
      <div class="row">
        <div class="col-12">
          <div class="property-slider-wrap" id="result">
            <div class="property-slider" id="slider">
				<c:forEach var="appart" items="${appartList }">
              <div class="property-item">
                
                  <img src="/images/img_1.jpg" alt="Image" class="img-fluid" />
                
                <div class="property-content">
                  <div class="price mb-2" id="price"><span>₩ ${appart.dealAmount}만 </span></div>
                  <div>
                    <!-- <span class="d-block mb-2 text-black-50" id="address">주소 5232 California Fake, Ave. 21BC</span> -->
                    <span class="city d-block mb-3" id="aptName">${appart.apartmentName}</span>

                    <div class="specs d-flex mb-4">
                      <span class="d-block d-flex align-items-center me-3">
                        <span class="caption" id="area">면적 ${appart.area }</span>
                      </span>
                      <span class="d-block d-flex align-items-center">
                        <span class="caption" id="floor">거래년월 ${appart.dealYear }.${appart.dealMonth }</span>
                      </span>
                    </div>

                  </div>
                </div>
              </div>
                </c:forEach>

              <!-- .item -->

            </div>

            <div id="property-nav" class="controls" tabindex="0" aria-label="Carousel Navigation">
              <span class="prev" data-controls="prev" aria-controls="property" tabindex="-1">Prev</span>
              <span class="next" data-controls="next" aria-controls="property" tabindex="-1">Next</span>
            </div>
          </div>
        </div>
      </div>
      
      
    </div>
  </div>

  <div class="col-md-9" style="margin: auto;">
    <!-- Kakao Map start -->
    <div id="map" style="width:100%;height:400px;"></div>
    <script type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7dc6dfcea7606681b8ba90c3f44dffbc&libraries=services"></script>
    <script>
      var container = document.getElementById("map");
      //var myLatLng = new kakao.maps.LatLng(37.5012743, 127.039585);
      //var myLatLng = new kakao.maps.LatLng(33.450701, 126.570667);
      var options = {
        //center: myLatLng,
        // center: new kakao.maps.LatLng(33.450701, 126.570667),
        center: new kakao.maps.LatLng(37.6837277, 127.0318174),
        level: 3,
      };

      //지도 생성
      var map = new kakao.maps.Map(container, options);

		
      var locations = [];
		var size = '${appartList}';
		size = size.slice(0, -1);
		size = size.slice(1);
		
		var appartlist = size.split(", ");
		for(appart of appartlist){
			var appart_split = appart.split("/");
			locations.push([appart_split[1], appart_split[0]]);
		}
       
      // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
      var mapTypeControl = new kakao.maps.MapTypeControl();

      // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
      // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
      map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

      // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
      var zoomControl = new kakao.maps.ZoomControl();
      map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

      // 주소-좌표 변환 객체를 생성합니다
      var geocoder = new kakao.maps.services.Geocoder();

   // 주소로 좌표를 검색합니다 -> 주소 받아오기
   		
      geocoder.addressSearch("${sido} "+"${gugun} "+"${dong}", function (result, status) {

        // 정상적으로 검색이 완료됐으면 
        if (status === kakao.maps.services.Status.OK) {
          //var locations = [];
          /*
          for(){
            location.push([ , ]);
          }
            */
          for (i = 0; i < locations.length; i++) {
            //var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
            coords = new kakao.maps.LatLng(locations[i][0], locations[i][1])
        
            // 결과값으로 받은 위치를 마커로 표시합니다
            var marker = new kakao.maps.Marker({
              map: map,
              position: coords
            });

            // // 인포윈도우로 장소에 대한 설명을 표시합니다
            // var infowindow = new kakao.maps.InfoWindow({
            //   content: `<div style="width:150px;text-align:center;padding:6px 0;">${locations[i][3]}</div>`
            // });

            // // 마커에 마우스오버 이벤트를 등록합니다
            // kakao.maps.event.addListener(marker, "mouseover", function () {
            //   // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
            //   infowindow.open(map, marker);
            // });

            // // 마커에 마우스아웃 이벤트를 등록합니다
            // kakao.maps.event.addListener(marker, "mouseout", function () {
            //   // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
            //   infowindow.close();
            // });
        }


          // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
          coords = new kakao.maps.LatLng(result[0].y, result[0].x);
          map.setCenter(coords);
        }
      });
    </script>
    <!-- Kakao Map end -->
  </div>
  <br>

  <div class="site-footer">
    <div class="container">
      <div class="row">
        <div class="col-lg-4">
          <div class="widget">
            <h3>Contact</h3>
            <address>(SSAFY) 서울시 강남구 테헤란로 멀티스퀘어</address>
            <ul class="list-unstyled links">
              <li><a href="tel://11234567890">1544-9001</a></li>
              <li>
                <a href="mailto:info@mydomain.com">admin@ssafy.com</a>
              </li>
            </ul>
          </div>
          <!-- /.widget -->
        </div>
        <!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <div class="widget">
            <h3>Sources</h3>
            <ul class="list-unstyled float-start links">
              <li><a href="#">About us</a></li>
              <li><a href="#">Services</a></li>
              <li><a href="#">Vision</a></li>
              <li><a href="#">Mission</a></li>
              <li><a href="#">Terms</a></li>
              <li><a href="#">Privacy</a></li>
            </ul>
          </div>
          <!-- /.widget -->
        </div>
        <!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <div class="widget">
            <h3>Links</h3>
            <ul class="list-unstyled links">
              <li><a href="#">Our Vision</a></li>
              <li><a href="#">About us</a></li>
              <li><a href="#">Contact us</a></li>
            </ul>

            <ul class="list-unstyled social">
              <li>
                <a href="#"><span class="icon-instagram"></span></a>
              </li>
              <li>
                <a href="#"><span class="icon-twitter"></span></a>
              </li>
              <li>
                <a href="#"><span class="icon-facebook"></span></a>
              </li>
              <li>
                <a href="#"><span class="icon-linkedin"></span></a>
              </li>
              <li>
                <a href="#"><span class="icon-pinterest"></span></a>
              </li>
              <li>
                <a href="#"><span class="icon-dribbble"></span></a>
              </li>
            </ul>
          </div>
          <!-- /.widget -->
        </div>
        <!-- /.col-lg-4 -->
      </div>
      <!-- /.row -->

      <div class="row mt-5">
        <div class="col-12 text-center">
          <!-- 
              **==========
              NOTE: 
              Please don't remove this copyright link unless you buy the license here https://untree.co/license/  
              **==========
            -->

          <p>
            Copyright &copy;
            <script>
              document.write(new Date().getFullYear());
            </script>
            . All Rights Reserved. &mdash; Designed with love by
            <a href="https://untree.co">Untree.co</a>
            <!-- License information: https://untree.co/license/ -->
          </p>
          <div>
            Distributed by
            <a href="https://themewagon.com/" target="_blank">themewagon</a>
          </div>
        </div>
      </div>
    </div>
    <!-- /.container -->
  </div>
  <!-- /.site-footer -->

  <!-- Preloader -->
  <div id="overlayer"></div>
  <div class="loader">
    <div class="spinner-border" role="status">
      <span class="visually-hidden">Loading...</span>
    </div>
  </div>

  <script src="/js/bootstrap.bundle.min.js"></script>
  <script src="/js/tiny-slider.js"></script>
  <script src="/js/aos.js"></script>
  <script src="/js/navbar.js"></script>
  <script src="/js/counter.js"></script>
  <script src="/js/custom.js"></script>
</body>

</html>
