<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<c:set var="CONTEXT" value="${pageContext.request.contextPath}"/>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <link href="${CONTEXT}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${CONTEXT}/resources/css/dashboard.css" rel="stylesheet">
    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="${CONTEXT}/resources/js/jquery-1.12.4.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="${CONTEXT}/resources/js/bootstrap.min.js"></script>
  
<title>***<tiles:getAsString name="title"/>***</title>
</head>
<body>
<div class="container-fluid">

<tiles:insertAttribute name = "header" />
	<div class="row">
		<tiles:insertAttribute name = "menu" />
		<div class="content-wrapper">
        	<tiles:insertAttribute name = "body" />
		</div>
	</div> <!--  row row-offcanvas ends -->
</div> <!--  container-scroller ends -->
						
		      
</body>
</html>