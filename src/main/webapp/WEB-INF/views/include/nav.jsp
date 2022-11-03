<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="site-nav">
      <div class="container">
        <div class="menu-bg-wrap">
          <div class="site-navigation">
            <a href="index.jsp" class="logo m-0 float-start">${root }</a>

            <c:choose>
			<%-- session에 userInfo 객체 없는 경우(로그인 X) --%>
				<c:when test="${empty userinfo}">
					<ul class="js-clone-nav d-none d-lg-inline-block text-start site-menu float-end">
						<li><a href="/user/login">로그인</a></li>
					</ul>
					<ul class="js-clone-nav d-none d-lg-inline-block text-start site-menu float-end">
						<li><a href="/user/regist">회원가입</a></li>
					</ul>
				</c:when>
			<%-- session에 userInfo 객체 있는 경우(로그인 O) --%>
				<c:otherwise>
					<ul class="js-clone-nav d-none d-lg-inline-block text-start site-menu float-end">
						<li><a>${userinfo.username}님 반갑습니다.</a></li>
						<li><a href="/user/edit">회원정보 수정</a></li>					
						<li><a href="/user/logout">로그아웃</a>
						</li>
					</ul>
				</c:otherwise>
	</c:choose>
          </div>
        </div>
      </div>
    </nav>
