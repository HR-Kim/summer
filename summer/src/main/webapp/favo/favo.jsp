<%@page import="com.summer.comm.StringUtil"%>
<%@page import="com.summer.comm.SearchVO"%>
<%@page import="org.slf4j.LoggerFactory"%>
<%@page import="org.slf4j.Logger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	Logger log = LoggerFactory.getLogger(this.getClass());

	log.debug("==================================");
	log.debug("this.getClass()"+this.getClass());
	log.debug("==================================");
	
	String pageSize = "10";// 페이지 사이즈
	String pageNum = "1";// 현재페이지
	String searchWord = "";// 검색어
	String searchDiv = "";// 검색구분
	
	int totalCnt = 0;
	int bottomCnt = 10; //바닥에 보여줄 숫자
	
	SearchVO searchVO = new SearchVO();
	
	if(null != request.getAttribute("searchVO")) {
		searchVO = (SearchVO)request.getAttribute("searchVO");
	}
	log.debug("==searchVO=="+searchVO.toString());	
	

	pageSize = StringUtil.nvl(searchVO.getPageSize(),"10");
	pageNum = StringUtil.nvl(searchVO.getPageNum(),"1");
	searchWord = StringUtil.nvl(searchVO.getSearchWord(),"");
	searchDiv = StringUtil.nvl(searchVO.getSearchDiv(),"");
	
	int o_pageSize = Integer.parseInt(pageSize);
	int o_pageNum = Integer.parseInt(pageNum);
	
	String o_totalCnt =  (null == request.getAttribute("totalCnt"))?"0":request.getAttribute("totalCnt").toString();
	
	totalCnt = Integer.parseInt(o_totalCnt);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- list -->
	<div class="table-responsive">
		<table class="table table-striped table-bordered table-hover" id="listTable">
       	<thead class="bg-primary">
       		<th class="text-center">번호</th>
       		<th class="text-center">상품명</th>
       		<th class="text-center">매장명</th>
       		<th class="text-center">수량</th>
       		<th class="text-center">가격</th>
       		<th class="text-center">삭제</th>
       		<th class="text-center" style="display:none;">goodID</th>
       		<th class="text-center" style="display:none;">entpID</th>
       	</thead>
       	<tbody>
       		<c:choose>
       		<c:when test="${list.size() > 0}">
       			<c:forEach var="favoVO" items="${list}">
		         		<tr>
		         			<td class="text-center">${favoVO.no}</td>
		         			<td class="text-left">${favoVO.goodName}</td>
		         			<td class="text-left">${favoVO.entpName}</td>
		         			<td class="text-left">${favoVO.goodNum}</td>
		         			<td class="text-left">${favoVO.goodPrice}</td>
		         			<td><input type='button' value='취소'></td>
		         			<td class="text-left" style="display:none;">${favoVO.goodId}</td>
		         			<td class="text-left" style="display:none;">${favoVO.entpId}</td>
		         		</tr>
	         		</c:forEach>
	         	</c:when>
	         	<c:otherwise>
	         		<tr>
	         			<td colspan="99" class="text-center">no data</td>
	         		</tr>
	         	</c:otherwise>
         		</c:choose>
         	</tbody>
       </table>
	</div>
	<!-- list end -->
	
	<script type="text/javascript">
	
	function doSearch(){
		var frm = document.frm;
		frm.action = "doSelectList.do";
		frm.submit();
	}
	
	</script>
</body>
</html>