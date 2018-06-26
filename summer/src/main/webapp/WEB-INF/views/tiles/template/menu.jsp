<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--CONTEXT --%>
<c:set var = "CONTEXT"  value = "${pageContext.request.contextPath}"></c:set>
<!-- <div class="col-sm-3 col-md-2 sidebar"> -->
<br>
<br>
<br>
			<h4 style="margin: 10px;">나의 가계부</h4>
			<br>
          <ul class="nav nav-sidebar">
            <li><a style="margin: 10px; color:grey;" href="${CONTEXT}/accounts/dayLoginCheck.jsp">일간 <span class="sr-only">(current)</span></a></li>
            <li><a style="margin: 10px; color:grey;" href="${CONTEXT}/accounts/weekLoginCheck.jsp">주간
            	</a></li>
            <li><a style="margin: 10px; color:grey;" href="${CONTEXT}/accounts/monthLoginCheck.jsp">
            		<input type="hidden" id="searchDiv" name="searchDiv" value="2018"/>월간
            </a></li>
          </ul>
          <br>
          <h4 style="margin: 10px;">최저가 검색</h4>
          <br>
          <ul class="nav nav-sidebar">
            <li><a style="margin: 10px; color:grey;" href="${CONTEXT}/good/doSelectList.do">검색하기</a></li>
            <li><a style="margin: 10px; color:grey;" href="${CONTEXT}/favo/favoLoginCheck.jsp">장바구니</a></li>
          </ul>
          <br>
          <h4 style="margin: 10px;">금융상품 추천</h4>
          <br>
          <ul class="nav nav-sidebar">
            <li><a style="margin: 10px; color:grey;" href="${CONTEXT}/finrec/saving/showViewList.do">적금</a></li>
            <li><a style="margin: 10px; color:grey;" href="${CONTEXT}/finrec/deposit/showViewList.do">정기예금</a></li>
           	<li><a style="margin: 10px; color:grey;" href="${CONTEXT}/finfavs/favsLoginCheck.jsp">즐겨찾기</a></li>
          </ul>
          <br>
          <h4 style="margin: 10px;">커뮤니티</h4>
          <br>
			<ul class="nav nav-sidebar">
            <li><a style="margin: 10px; color:grey;" href="${CONTEXT}/board/do_selectList.do">자유게시판</a></li>
          </ul>
          
<!-- </div> -->