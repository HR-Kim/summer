<%@page import="org.slf4j.Logger"%>
<%@page import="org.slf4j.LoggerFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	Logger log = LoggerFactory.getLogger(this.getClass());
	log.debug("===========================");
	log.debug("this.getClass()="+this.getClass());
	log.debug("===========================");
%>

<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
	<!-- 부트스트랩 -->
	<link href="${CONTEXT}/resources/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
at
	<input type="button" id="btn" onclick="searchbtnclick();"= value="조회" />
	
	<script src="${CONTEXT}/resources/js/jquery-1.12.4.js"></script>
	<script src="${CONTEXT}/resources/js/bootstrap.min.js"></script>
	<script type="text/javascript">
    	  
	function searchbtnclick() {
		alert("버튼1을 누르셨습니다.");
		
		if(false==confirm("조회 하시겠습니까?"))return;
		
	}
    
    </script>
</body>
</html>