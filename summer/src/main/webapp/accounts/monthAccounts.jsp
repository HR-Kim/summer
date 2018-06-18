

<%@page import="com.summer.accounts.domain.Accounts"%>
<%@page import="com.summer.comm.DTO"%>
<%@page import="java.util.List"%>
<%@page import="com.summer.codes.dao.CodeDao"%>
<%@page import="com.summer.codes.domain.CodeVO"%>
<%@page import="com.summer.comm.StringUtil"%>
<%@page import="com.summer.comm.SearchVO"%>
<%@page import="org.slf4j.LoggerFactory"%>
<%@page import="org.slf4j.Logger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
	Logger log = LoggerFactory.getLogger(this.getClass());

	log.debug("===============================");
	log.debug("=this.getClass()="+this.getClass());
	log.debug("===============================");

	String pageSize = "10"; //페이지 사이즈
	String pageNum = "1";  //현재 페이지
	String searchWord = ""; //검색어
	String searchDiv = ""; //검색구분
	
	String searchTrade = "";
	String searchCategory = "";
	String searchAccount = "";
	
	int totalCnt = 0;
	int bottomCount = 10;
	
	SearchVO searchVO = new SearchVO();
	if(null != request.getAttribute("searchVO")){
		searchVO = (SearchVO)request.getAttribute("searchVO");
	}
	log.debug("=searchVO="+searchVO.toString());
	
	searchWord = StringUtil.nvl(searchVO.getSearchWord(),"");
	searchDiv = StringUtil.nvl(searchVO.getSearchDiv(),"2018");
	
	searchTrade = StringUtil.nvl(searchVO.getSearchTrade(),"");
	searchCategory = StringUtil.nvl(searchVO.getSearchCategory(),"");
	searchAccount =  StringUtil.nvl(searchVO.getSearchAccount(),"");
	
	
	
	int o_pageSize = Integer.parseInt(pageSize);
	int o_pageNum = Integer.parseInt(pageNum);
	String o_TotalCnt = 
			(null == request.getAttribute("totalCnt"))?"0":request.getAttribute("totalCnt").toString();
	totalCnt = Integer.parseInt(o_TotalCnt);
	
	log.debug("searchDiv"+searchDiv);
	
%>

<%-- CONTEXT --%>
<c:set var="CONTEXT" value="${pageContext.request.contextPath}"/>
    
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>:::월간 가계부:::</title>

    <!-- 부트스트랩 -->
    <link href="${CONTEXT}/resources/css/bootstrap.min.css" rel="stylesheet">
 
    <!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
    <!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
  </head>
  <body>
  
  <div class="container">
 
   <!-- Search ----------------------------------------------------------->
   	<form class="form-inline" name="frm" id="frm" method="get">
   		<input type="hidden" name="pageNum" id="pageNum" value="${searchVO.pageNum}"/>


   		<table class="table">
   			<tr>
   				<td class="text-left">
   					<div class="form-group col-lg6 col-sm6">
						<select id="searchDiv" name="searchDiv">
				          <c:set var="now" value="<%=new java.util.Date()%>" />
				          <fmt:formatDate value="${now}" pattern="yyyy" var="yearStart"/> 
				          <c:forEach begin="0" end="10" var="result" step="1">
				           <option value="<c:out value="${yearStart - result}" />" 
				           	<c:if test="${(yearStart - result) == searchVO.searchDiv}"> selected="selected"</c:if>><c:out value="${yearStart - result}" />
				           </option>
				          </c:forEach>                          
				        </select>

    					<button class="btn btn-sm btn-success" onclick="javascript:doSelectListMonth();">검색</button>
							
   					</div>
   			</tr>
   		</table>
   	</form> 

   	<!--// Search --------------------------------------------------------->
   
  
   <!-- List ------------------------------------------------------------->
  
	     <div class="table-responsive">
	     	
	       <table id="listTable" class="table  table-striped table-bordered table-hover">
	        	<thead class="bg-primary">
	        		<tr>
	        			<th class="text-center">달</th>
		         		<th class="text-center">지출</th>
		         		<th class="text-center">수입</th>
		         		<th class="text-center">총합</th>
	         		</tr>
	        	</thead>
	        	<tbody>
	        		
	        	<c:choose>
	        		<c:when test="${list.size()>0 }">
	        			<c:forEach var="AccountsVO" items="${list }">
			        		<tr>
			        		<td class="text-center">${AccountsVO.aDate }</td>
			        		 <td class="text-right" style="color: red;">
						          <fmt:formatNumber value="${AccountsVO.sumExp}" pattern="#,###"/>원
						    </td>
			        		<td class="text-right" style="color: blue;">
								<fmt:formatNumber value="${AccountsVO.sumInc}" pattern="#,###"/>원
							</td>
			        		<td class="text-right">
								<fmt:formatNumber value="${AccountsVO.sumTotal}" pattern="#,###"/>원
							</td>
			         		</tr>
		         		</c:forEach>
	         		</c:when>
	         		<c:otherwise>
	         			<tr>
		          		<td colspan="99" class="text-center">데이터가 없습니다.</td>
		         		</tr>
	         		</c:otherwise>
	         	</c:choose>
	         	
	         	
	        	</tbody>
	        </table>
	        
	      </div>
	    

   <!--// List ----------------------------------------------------------->
   
   <!-- Paging ----------------------------------------------------------->
   <div class="form-inline text-center">
   		<%=StringUtil.renderPaging(totalCnt, o_pageNum, o_pageSize, bottomCount, "doSelectList.do", "search_page")%>
   </div>
   <!--// Paging --------------------------------------------------------->
   </div>
   
	<script src="${CONTEXT}/resources/js/jquery-1.12.4.js"></script>
	<script src="${CONTEXT}/resources/js/bootstrap.min.js"></script>
	<script type="text/javascript">

	//리스트 조회
	function doSelectListMonth(){
		var frm = document.frm;
		
		frm.action = "doSelectListMonth.do";
		
		frm.submit();
	}
	
		
	</script>
	
  </body>
</html>