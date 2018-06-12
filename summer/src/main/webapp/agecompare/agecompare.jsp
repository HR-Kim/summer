<%@page import="org.slf4j.Logger"%>
<%@page import="org.slf4j.LoggerFactory"%>
<%@page import="java.util.List"%>
<%@page import="com.summer.comm.StringUtil"%>
<%@page import="com.summer.comm.SearchVO"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.summer.agecompare.dao.AgecompareDao"%>
<%@page import="com.summer.agecompare.domain.Agecompare"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	Logger log = LoggerFactory.getLogger(this.getClass());
	log.debug("===========================");
	log.debug("this.getClass()="+this.getClass());
	log.debug("===========================");
	
	String searchWord = ""; //검색어
	String searchDiv = ""; //검색구분
	String pageSize = "10"; //페이지 사이즈
	String pageNum = "1";  //현재 페이지
	
	SearchVO searchVO = new SearchVO();
	if(null != request.getAttribute("searchVO")){
		searchVO = (SearchVO)request.getAttribute("searchVO");
	}
	log.debug("=searchVO="+searchVO.toString());
	
	searchWord = StringUtil.nvl(searchVO.getSearchWord(),"");
	searchDiv = StringUtil.nvl(searchVO.getSearchDiv(),"");
	
	String trade = //request.getAttribute("searchVO");
	(null == request.getAttribute("searchVO")) ? "0":request.getAttribute("searchVO").toString();
	String tradee = trade;	
	
	
	AgecompareDao dao = new AgecompareDao();
	List<Agecompare> list = null;
	String a = 
			(null == request.getAttribute("list")) ? "0":request.getAttribute("list").toString();
	
	String allLine = "";
	//allLine = a.substring(a.indexOf("id=")+3, a.indexOf(","));
	//allLine += "," + a.substring(a.indexOf("aDate=")+6,
	//		a.indexOf("aDate=")+(a.substring(a.indexOf("aDate="))).indexOf(","));
	
	allLine =
			(null == request.getAttribute("dataList")) ? "0":
			request.getAttribute("dataList").toString();
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
	<input type="button" id="btn" onclick="doSearch();" value="조회" />
	
	<form class="form-inline" name="frm" id="frm" method="get">
		<input type="hidden"  name="searchDiv" id="searchDiv" />

		<input type="text" class="form-control input-sm" name="searchWord" 
		id="searchWord" value="${searchVO.searchWord}"/>
											
	</form>
	
	<input type="text" id="tradee" value="<%=tradee%>"/>
	<input type="text" id="allLine" value="<%=allLine%>"/>
		
	<button class="btn btn-success btn-sm" id="btn20">20대</button> 
	<button class="btn btn-success btn-sm" id="btn30">30대</button> 
		
	<table>
	<tr>
			<td>id</td>
			<td>date</td>
			<td>tradeid</td>
			<td>amount</td>
			<td>age</td>
			<td>tradetotal</td>
		</tr>
	 <c:choose>
		 
         	<c:when test="${list.size()>0}">
         		<c:forEach var="ageVO" items="${list}">
   <!-- id,adate,accountid,tradeid,amount,age,tradetotal,idtradetotal,idtotal -->
					<tr>
					<td>${ageVO.id}</td>
					<td>${ageVO.aDate}</td>
					<td>${ageVO.tradeId}</td>
					<td>${ageVO.amount}</td>
					<td>${ageVO.age}</td>
					<td>${ageVO.tradeTotal}</td>
					</tr>
         		</c:forEach>
         	</c:when>
         	
         	<c:otherwise>
         		<tr><td>등록된 게시글이 없습니다.</td></tr>
         	</c:otherwise>
      </c:choose>
	</table>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="${CONTEXT}/resources/js/jquery-1.12.4.js"></script>
	<script src="${CONTEXT}/resources/js/bootstrap.min.js"></script>
	<script type="text/javascript">
    	  
	//조회
	function doSearch(){
		var frm = document.frm;
		frm.action = "do_selectAgeList.do";
		frm.submit();
	}
	
	 $(document).ready(function(){
		 $("#btn20").on("click",function(){
	    		alert("20");
		 });
		 $("#btn30").on("click",function(){
			 alert("30");
		 });
		 
	 });
    
    </script>
</body>
</html>