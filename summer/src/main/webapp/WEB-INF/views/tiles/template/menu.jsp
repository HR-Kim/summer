<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--CONTEXT --%>
<c:set var = "CONTEXT"  value = "${pageContext.request.contextPath}"></c:set>
<nav class="sidebar sidebar-offcanvas" id="sidebar">
	<form class="form-inline" name="frm" id="frm" method="get">
          <ul class="nav">
            <li class="nav-item nav-category">
              <span class="nav-link">내 가계부</span>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#" onclick="javascript:doSelectList();">
                <span class="menu-title">일간</span>
                <i class="icon-speedometer menu-icon"></i>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#" onclick="javascript:doSelectListWeek();">
                <span class="menu-title">주간</span>
                <i class="icon-wrench menu-icon"></i>
              </a>
            </li>
              <li class="nav-item">
              <a class="nav-link" href="#" onclick="javascript:doSelectListMonth();">
              	<input type="hidden" id="searchDiv" name="searchDiv"/>
                <span class="menu-title">월간</span>
                <i class="icon-wrench menu-icon"></i>
              </a>
            </li>
            <li class="nav-item nav-category">
              <span class="nav-link">남의 가계부 </span>
            </li>
            <li class="nav-item">
              <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
                <span class="menu-title">일간</span>
                <i class="icon-layers menu-icon"></i>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="pages/tables/basic-table.html">
                <span class="menu-title">주간</span>
                <i class="icon-grid menu-icon"></i>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="pages/icons/font-awesome.html">
                <span class="menu-title">월간</span>
                <i class="icon-globe menu-icon"></i>
              </a>
            </li>
            <li class="nav-item nav-category">
              <span class="nav-link">최저가 검색</span>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="pages/forms/basic_elements.html">
                <span class="menu-title">검색하기</span>
                <i class="icon-flag menu-icon"></i>
              </a>
            </li>
            <li class="nav-item nav-category">
              <span class="nav-link">금융상품 추천</span>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="pages/charts/flot-chart.html">
                <span class="menu-title">적금</span>
                <i class="icon-pie-chart menu-icon"></i>
              </a>
            </li>
                        <li class="nav-item">
              <a class="nav-link" href="pages/charts/flot-chart.html">
                <span class="menu-title">전세대출</span>
                <i class="icon-pie-chart menu-icon"></i>
              </a>
            </li>
            <li class="nav-item nav-category">
              <span class="nav-link">커뮤니티</span>
            </li>
            <li class="nav-item">
              <a class="nav-link" data-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
                <span class="menu-title">자유게시판</span>
                <i class="icon-bubbles menu-icon"></i>
              </a>
              <div class="collapse" id="auth">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"> <a class="nav-link" href="pages/samples/login.html"> Login </a></li>
                  <li class="nav-item"> <a class="nav-link" href="pages/samples/register.html"> Register </a></li>
                  <li class="nav-item"> <a class="nav-link" href="pages/samples/error-404.html"> 404 </a></li>
                  <li class="nav-item"> <a class="nav-link" href="pages/samples/error-500.html"> 500 </a></li>
                  <li class="nav-item"> <a class="nav-link" href="pages/samples/blank-page.html"> Blank Page </a></li>
                </ul>
              </div>
            </li>
          </ul>
	</form>
        </nav>
        
        
	<script src="${CONTEXT}/resources/js/jquery-1.12.4.js"></script>
	<script src="${CONTEXT}/resources/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		
		//일간리스트 조회
		function doSelectList(){
			var frm = document.frm;
			frm.action = "accounts/doSelectList.do";
			frm.submit();
		}
		
		//월간리스트 조회
		function doSelectListMonth(){
			var frm = document.frm;
			frm.searchDiv.value = "2018";
			frm.action = "accounts/doSelectListMonth.do";
			frm.submit();
		}
		
		//주간리스트 조회
		function doSelectListWeek(){
			var frm = document.frm;
			frm.searchDiv.value="2018/06/11";
			frm.action = "accounts/doSelectListWeek.do";
			frm.submit();
		}
	
	
	</script>