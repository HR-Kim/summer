<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--CONTEXT --%>
<c:set var = "CONTEXT"  value = "${pageContext.request.contextPath}"></c:set>
<div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class="active"><a href="${CONTEXT}/accounts/doSelectList.do">일간 <span class="sr-only">(current)</span></a></li>
            <li><a href="#">주간</a></li>
            <li><a href="${CONTEXT}/accounts/doSelectListMonth.do">
            	<input type="hidden" id="searchDiv" name="searchDiv" value="2018"/>월간
            </a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="${CONTEXT}/good/doSelectList.do">최저가 검색</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="">적금</a></li>
            <li><a href="">정기예금</a></li>
          </ul>
			<ul class="nav nav-sidebar">
            <li><a href="${CONTEXT}/board/do_selectList.do">자유게시판</a></li>
          </ul>
          
</div>