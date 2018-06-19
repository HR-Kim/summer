

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
	searchDiv = StringUtil.nvl(searchVO.getSearchDiv(),"2018/06");
	
	searchTrade = StringUtil.nvl(searchVO.getSearchTrade(),"");
	searchCategory = StringUtil.nvl(searchVO.getSearchCategory(),"");
	searchAccount =  StringUtil.nvl(searchVO.getSearchAccount(),"");

	String searchYear = searchDiv.substring(0, searchDiv.indexOf("/"));
	String searchMonth = searchDiv.substring(searchDiv.indexOf("/")+1);
	
	searchMonth=StringUtil.nvl(searchMonth,"");
	
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
    <title>:::주간 가계부:::</title>

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
	   	<table class="table">
	   			<tr>
	   				<td class="text-left">
	   					<div class="form-group col-lg6 col-sm6">
							<select id="searchYear" name="searchYear" onchange="makeWeekSelectOptions();">
					          <c:set var="now" value="<%=new java.util.Date()%>" />
					          <fmt:formatDate value="${now}" pattern="yyyy" var="yearStart"/> 
					          <c:forEach begin="0" end="10" var="result" step="1">
					           <option value="<c:out value="${yearStart - result}" />" 
					           	<c:if test="${(yearStart - result) == searchYear}"> selected="selected"</c:if>><c:out value="${yearStart - result}" />
					           </option>
					          </c:forEach>  
					          	                        
					        </select>
					        
					        <select id="searchMonth" name="searchMonth" onchange="makeWeekSelectOptions();">
					          <c:forEach begin="1" end="12" var="result" step="1">
					           <option value=<fmt:formatNumber value="${result}" pattern="00"/>
					           	<c:if test="${result == searchMonth}"> selected="selected"</c:if>>
					           		<fmt:formatNumber value="${result}" pattern="00"/>
					           </option>
					          </c:forEach>  
					                            
					        </select>
					        
					        <select name="sh_week" id="sh_week">
</select>
	
	   					</div>
	   			</tr>
   		</table>
   	</form> 
   	<button class="btn btn-sm btn-success" id="doSelectWeek">검색</button>

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

	function makeWeekSelectOptions() {
	    var year =  document.getElementById("searchYear").value;
	    var month =  document.getElementById("searchMonth").value;
	 
	    var today = new Date();
	 
	    var sdate = new Date(year, month-1, 01);
	    var lastDay = (new Date(sdate.getFullYear(), sdate.getMonth()+1, 0)).getDate();
	    var endDate = new Date(sdate.getFullYear(), sdate.getMonth(), lastDay);
	 
	    var week = sdate.getDay();
	    sdate.setDate(sdate.getDate() - week);
	    var edate = new Date(sdate.getFullYear(), sdate.getMonth(), sdate.getDate());
	 
	    var obj = document.getElementById("sh_week");
	    obj.options.length = 0;
	    var seled = "";
	    while(endDate.getTime() >= edate.getTime()) {
	 
	        var sYear = sdate.getFullYear();
	        var sMonth = (sdate.getMonth()+1);
	        var sDay = sdate.getDate();
	 
	        sMonth = (sMonth < 10) ? "0"+sMonth : sMonth;
	        sDay = (sDay < 10) ? "0"+sDay : sDay;
	 
	        var stxt = sYear + "-" + sMonth + "-" + sDay;
	 
	        edate.setDate(sdate.getDate() + 6);
	 
	        var eYear = edate.getFullYear();
	        var eMonth = (edate.getMonth()+1);
	        var eDay = edate.getDate();
	 
	        eMonth = (eMonth < 10) ? "0"+eMonth : eMonth;
	        eDay = (eDay < 10) ? "0"+eDay : eDay;
	 
	        var etxt = eYear + "-" + eMonth + "-" + eDay;
	 
	        if(today.getTime() >= sdate.getTime() && today.getTime() <= edate.getTime()) {
	            seled = stxt+"|"+etxt;
	        }
	 
	        obj.options[obj.options.length] = new Option(stxt+"~"+etxt, stxt+"|"+etxt);
	 
	        sdate = new Date(edate.getFullYear(), edate.getMonth(), edate.getDate() + 1);
	        edate = new Date(sdate.getFullYear(), sdate.getMonth(), sdate.getDate());
	    }
	 
	    if(seled) obj.value = seled;
	}
	
	
	
	
	
	
	//천단위 콤마
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	
	$(document).ready(function(){
				

		$("#doSelectWeek").on("click",function(){
			$.ajax({
	    			      	 type:"GET",
		                 url:"doSelectListWeek.do",   
		                 dataType:"html",// JSON/html
		                 async: false,
		                 data:{
		                    	"searchDiv":$("#searchYear").val() +"/"+ $("#searchMonth").val()
			                 },
		                 success: function(data){//통신이 성공적으로 이루어 졌을때 받을 함수
		                	 console.log("data="+data); 
		                 
		                 	//json parsing
		                 	var parseData = $.parseJSON(data); //데이터 들어있음.
		                 
		                 	$('#listTable > tbody > tr').remove();
		                 	
		                 	$.each(parseData , function(idx, val) {
		                 		 $('#listTable > tbody').append("<tr><td>" + val[0] + "</td><td class='text-right' style='color: red;'>" + numberWithCommas(val[1]) + "</td><td class='text-right' style='color: blue;'>" + numberWithCommas(val[2])+ "</td><td class='text-right'>"+ numberWithCommas(val[3]) + "</td></tr>");
		                 		
		                 		});
		                 		
			                 },
			                complete: function(data){//무조건 수행
			                 },
			                error: function(xhr,status,error){
			                console.log("do_checkedDelete error: "+error);
			                 }
  			   }); //--그리드 클릭> ajax
			})
			
	});
			
		
	
		
	</script>
	
  </body>
</html>