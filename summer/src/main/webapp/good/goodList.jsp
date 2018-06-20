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
<%-- CONTEXT --%>
<c:set var="CONTEXT" value="${pageContext.request.contextPath}"/>
	<div class="container">
	
	<!-- search -->
	<form class="form-inline" name="frm" id="frm" method="get">
		<input type="hidden" name="pageNum" value="${searchVO.pageNum}"/>
		<input type="hidden" name="goodId"/>
		
		<table class="table">
			<tr>
				<td class="text-center">
				<div class="form-group col-lg5 col-sm6">
				<select name="pageSize" id="pageSize">
						<option value="10" <c:if test="${searchVO.pageSize == '10'}">selected='selected'</c:if>>10</option>
	  						<option value="30" <c:if test="${searchVO.pageSize == '30'}">selected='selected'</c:if>>30</option>
	  						<option value="50" <c:if test="${searchVO.pageSize == '50'}">selected='selected'</c:if>>50</option>
	  						<option value="100" <c:if test="${searchVO.pageSize == '100'}">selected='selected'</c:if>>100</option>
					</select>
					<input type="text" class="form-control input-sm" name="searchWord" id="searchWord" value="${searchVO.searchWord}">
					<button class="btn btn-sm" id="goodlist" onclick="javascript:doSearch();">검색</button>
					
					
				</div>
				</td>
			</tr>
		</table>
		
	</form>
	<!-- search end -->
	
	
	<!-- list -->
	<div class="table-responsive">
		<table class="table  table-striped table-bordered table-hover" id="listTable">
       	<thead class="bg-primary">
       		<th class="text-center">번호</th>
       		<th class="text-center">Product Name</th>
       		<th class="text-center">The lower price</th>
       		<th class="text-center" style="display:none;">goodID</th>
       	</thead>
       	<tbody>
       		<c:choose>
       		<c:when test="${list.size() > 0}">
       			<c:forEach var="goodVO" items="${list}">
		         		<tr>
		         			<td class="text-center">${goodVO.no}</td>
		         			<td class="text-left">${goodVO.goodName}</td>
		         			<td class="text-left">${goodVO.goodPrice}</td>
		         			<td class="text-left" style="display:none;">${goodVO.goodId}</td>
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
	
	<!-- paging -->
  	<div class="form-inline text-center">
  	<%= StringUtil.renderPaging(totalCnt, o_pageNum, o_pageSize, bottomCnt, "doSelectList.do", "search_page") %>
  	</div>
  	<!--// paging -->
	
	</div>

	<script src="${CONTEXT}/resources/js/jquery-1.12.4.js"></script>
	<script src="${CONTEXT}/resources/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	
	function doSearch(){
		var frm = document.frm;
		frm.action = "doSelectList.do";
		frm.submit();
	}
	
	function search_page(url,pageNum){
    	//console.log("=url="+url);
    	var frm = document.frm;
		frm.action = url;
		frm.pageNum.value = pageNum;
		frm.submit();
    }
	
	$(document).ready(function(){		
		$("#listTable>tbody").on("click","tr",function(){
			var tr = $(this);
			var tds = tr.children();
			
			var ano = tds.eq(3).text();
			
			alert(ano);
			
			var frm = document.frm;
			frm.goodId.value = ano;
			frm.action = "doSearchOne.do";
			frm.submit();
		
		});
	});
	
	
	
	</script>