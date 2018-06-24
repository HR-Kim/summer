<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--CONTEXT --%>
<c:set var = "CONTEXT"  value = "${pageContext.request.contextPath}"></c:set>
<div class="col-sm-3 col-md-2 sidebar">
			<h4>내 가계부</h4>
			<br>
          <ul class="nav nav-sidebar">
            <li><a href="${CONTEXT}/accounts/doSelectList.do?searchWord=<%=session.getAttribute("id")%>">일간 <span class="sr-only">(current)</span></a></li>
            <li><a href="${CONTEXT}/accounts/doWeek.do?searchWord=<%=session.getAttribute("id")%>">주간
            	</a></li>
            <li><a href="${CONTEXT}/accounts/doSelectListMonth.do?searchWord=<%=session.getAttribute("id")%>">
            		<input type="hidden" id="searchDiv" name="searchDiv" value="2018"/>월간
            </a></li>
          </ul>
          <br>
          <h4>최저가 검색</h4>
          <br>
          <ul class="nav nav-sidebar">
            <li><a href="${CONTEXT}/good/doSelectList.do">검색하기</a></li>
            <li><a href="${CONTEXT}/favo/favoLoginCheck.jsp">장바구니</a></li>
          </ul>
          <br>
          <h4>금융상품 추천</h4>
          <br>
          <ul class="nav nav-sidebar">
            <li><a href="${CONTEXT}/finrec/saving/showViewList.do">적금</a></li>
            <li><a href="${CONTEXT}/finrec/deposit/showViewList.do">정기예금</a></li>
           	<li><a href="${CONTEXT}/finfavs/favsLoginCheck.jsp">즐겨찾기</a></li>
          </ul>
          <br>
          <h4>커뮤니티</h4>
          <br>
			<ul class="nav nav-sidebar">
            <li><a href="${CONTEXT}/board/do_selectList.do">자유게시판</a></li>
          </ul>
          
</div>