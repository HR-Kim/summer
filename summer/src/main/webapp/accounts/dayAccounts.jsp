

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
	
	pageSize = StringUtil.nvl(searchVO.getPageSize(),"10");
	pageNum = StringUtil.nvl(searchVO.getPageNum(),"1");		
	searchWord = StringUtil.nvl(searchVO.getSearchWord(),"");
	searchDiv = StringUtil.nvl(searchVO.getSearchDiv(),"");
	
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
    <title>:::일간 가계부:::</title>

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
  <!-- Button ----------------------------------------------------------->
    
   <div class="form-inline pull-right">
		<button class="btn btn-sm" id="expenses" name="plus" value="10">+지출</button>
   		<button class="btn btn-sm" id="incomes" name="plus" value="20">+수입</button>
   		<button class="btn btn-sm" onclick="javascript:doExcelDown();">엑셀다운</button>
   </div>
   <!--// Button --------------------------------------------------------->
    
    
    
   <!--지출 Modal  --------------------------------------------------------->
    <div id="expenseModal" class="modal fade" role="dialog">
    	<div class="modal-dialog">
    		<div class="modal-content col-lg-10">
    		 	<form class="form-horizontal" name="frmEdit" id="frmEdit" method="post">
    		 	
					<div class="modal-body">
						<input type="hidden" name="ano" id="ano" class="form-control input-sm" maxlength="20" />
	 					
			    		<div class="form-group">
			    			<label class="col-lg-3 control-label">날짜</label>
				    			<div class="col-lg-7">
				    				<input type="date" name="aDate" id="aDate" class="form-control input-sm" maxlength="20" required pattern="[0-9]{4}-[0-9]{2}-[0-9]{2}"/> 
								</div>		
			    		</div>
			    		
			    		<div class="form-group">
			    			<label class="col-lg-3 control-label">구분</label>
				    			<div class="col-lg-7">
						    		<c:choose>
						        		<c:when test="${list4.size()>0 }">
								        		<select name="searchAccount" id="searchAccount" class="form-control input-sm">
									        		<c:forEach var="code" items="${list4 }">
									        			<option value="${code.cdDtlId }"
									        				<c:if test="${searchVO.searchAccount}==${code.cdDtlId }">selected='selected'</c:if>
									        			>${code.cdDtlNm}</option>
									        		</c:forEach>
								        		</select>
							         	</c:when>
						         </c:choose>
				         		</div>		
			    		</div>

			    		<div class="form-group">
			    			<label class="col-lg-3 control-label">카테고리</label>
			    				<div class="col-lg-7">
					  				<select name="searchCategory" id="searchCategory" class="form-control input-sm">
                                    <option value=""> -- Select Category -- </option>
									</select>
								</div>		
			    		</div>
			    		
			    		<div class="form-group">
			    			<label class="col-lg-3 control-label">항목</label>
			    			<div class="col-lg-7">
			    				<input type="text" name="item" id="item" class="form-control input-sm" maxlength="50" >
							</div>		
			    		</div>
			    		
			    		<div class="form-group">
			    			<label class="col-lg-3 control-label">금액</label>
			    			<div class="col-lg-7">
			    				<input type="text" name="amount" id="amount" class="form-control input-sm" placeholder="원" maxlength="50"/>
							</div>		
			    		</div>
			    		
			    		<div class="form-group">
			    			<label class="col-lg-3 control-label">메모</label>
			    			<div class="col-lg-7">
			    				<textarea name="memo" id="memo" class="form-control input-sm" placeholder="메모"></textarea>
							</div>		
			    		</div>
					</div>
					
						<div class="form-group" id="submitBtn" align="right">
				    		<div class="col-lg-10">
				    			<button class="btn btn-sm" id="doUpsert">등록</button>
				    			<button class="btn btn-sm" id="doDelete">삭제</button>
				    			
				    		</div>
			    		</div> 
				</form>
    		</div>
    	</div>
   	</div>
    
   <!-- //Modal --------------------------------------------------------->
  
   <!-- Search ----------------------------------------------------------->
   	<form class="form-inline" name="frm" id="frm" method="get">
   		<input type="hidden" name="pageNum" id="pageNum" value="${searchVO.pageNum}"/>


   		<table class="table">
   			<tr>
   				<td class="text-left">
   					<div class="form-group col-lg6 col-sm6">

						<c:choose>
			        		<c:when test="${list1.size()>0 }">
					        		<select name="searchTrade" id="searchTrade">
					        			<option>전체</option>
						        		<c:forEach var="code" items="${list1 }">
						        			<option value="${code.cdDtlId }"
						        				<c:if test="${searchVO.searchTrade}==${code.cdDtlId }">selected='selected'</c:if>
						        			>${code.cdDtlNm}</option>
						        		</c:forEach>
					        		</select>
				         	</c:when>
			         </c:choose>
    					<select name="pageSize" id="pageSize">
   							<option value="10"
   								<c:if test="${searchVO.pageSize=='10'}">selected='selected'</c:if> 
   							>10</option>
   							<option value="30"
   								<c:if test="${searchVO.pageSize=='30'}">selected='selected'</c:if> 
   							>30</option>
   							<option value="100"
   								<c:if test="${searchVO.pageSize=='100'}">selected='selected'</c:if> 
   							>100</option>
   						</select>
    					
    					<button class="btn btn-sm btn-success" onclick="javascript:doSelectList();">검색</button>
							
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
	        			<th class="text-center" style="display:none;">번호</th>
	        			<th class="text-center" style="display:none;">거래구분</th>
		         		<th class="text-center">카테고리</th>
		         		<th class="text-center">날짜</th>
		         		<th class="text-center">항목</th>
		         		<th class="text-center">구분</th>
		         		<th class="text-center">금액</th>
		         		<th class="text-center">메모</th>
	         		</tr>
	        	</thead>
	        	<tbody>
	        		
	        	<c:choose>
	        		<c:when test="${list.size()>0 }">
	        			<c:forEach var="AccountsVO" items="${list }">
			        		<tr>
			        			<td class="text-center" style="display:none;">${AccountsVO.ano }</td>
			        			<td class="text-center" style="display:none;">${AccountsVO.tradeId }</td>
			          		<td class="text-center"><label class="badge badge-danger" style="border: 1px solid #fd3258; background-color: #fd3258">${AccountsVO.categoryId }</label></td>
					          <td class="text-left">${AccountsVO.aDate }</td>
					          <td class="text-left">${AccountsVO.item }</td>
					          <td class="text-left">${AccountsVO.accountId }</td>
     							<c:choose>
						          <c:when test="${AccountsVO.tradeId eq '지출'}">
						          	<td class="text-right" style="color: red;">
						          			<fmt:formatNumber value="${AccountsVO.amount}" pattern="#,###"/>원
						          	</td>
						          </c:when>
						          
						          <c:when test="${AccountsVO.tradeId eq '수입'}">
					          		<td class="text-right" style="color: blue;">
											<fmt:formatNumber value="${AccountsVO.amount}" pattern="#,###"/>원
										</td>
						          </c:when>

					         	</c:choose>
					          <td class="text-left">${AccountsVO.memo }</td>
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
		function doSelectList(){
			var frm = document.frm;
			frm.action = "doSelectList.do";
			frm.submit();
		}
		
		//페이지 이동
		function search_page(url,pageNum){
			var frm = document.frm;
			frm.action = url;
			frm.pageNum.value = pageNum;
			frm.submit();
		}

		$(document).ready(function(){
		
			//그리드 클릭
    		$("#listTable>tbody").on("dblclick","tr",function(){
    			
    			var tr = $(this);
    			var tds = tr.children();
    			
    			var ano = tds.eq(0).text();
    			if(ano=="")return;
    			
    			var trade = tds.eq(1).text();
    			
    			$.get( "doSearchTrade.do", {"searchTrade" : trade},function(categoryList) {
    			}, 'json' /* xml, text, script, html */)
    			.done(function(categoryList) {
    				$('#searchCategory > option').remove();
    				
    				$.each(categoryList , function(idx, val) {
               		$('#searchCategory').append($('<option >', {
                            value: val[1],
                            text : val[1],
                            
                       }));
               		});
    				
    				
      			  if(false==confirm("("+ano+")"+"조회 하시겠습니까?"))return;
      			  $("#expenseModal").modal();
      			  $.ajax({
  	    			      	 type:"GET",
  		                 url:"doSearchOne.do",   
  		                 dataType:"html",// JSON/html
  		                 async: false,
  		                 data:{
  		                    "ano" :ano
  			                 },
  		                 success: function(data){//통신이 성공적으로 이루어 졌을때 받을 함수
  		                	 console.log("data="+data); 
  		                 	//json parsing
  		                 	var parseData = $.parseJSON(data); //데이터 들어있음.
  		                 	var date = new Date(parseInt(parseData.aDate));
  		                 		
  		                 	console.log("parseData"+parseData);
  		                 	console.log("parseData.categoryId"+parseData.categoryId);
  		             			
  		                 		//화면에 정보 뿌리기.
  		                 		$("#ano").val(parseData.ano);
  		                 		
  		                 		$("#account").val(parseData.accountId);
  		                 		
    							$("#searchCategory").val(parseData.categoryId).attr("selected", "selected");
    							
  								$("#aDate").val(parseData.aDate);
  								
  								$("#item").val(parseData.item);
  								$("#amount").val(parseData.amount);
  								$("#memo").val(parseData.memo);
  								
  			                 },
  			                complete: function(data){//무조건 수행
  			                 },
  			                error: function(xhr,status,error){
  			                console.log("do_checkedDelete error: "+error);
  			                 }
      			   }); //--그리드 클릭> ajax
    			})
    			.fail(function(categoryList) {
    			    alert( "error" );
    			})
    			.always(function(categoryList) {
    			});


    			
    		});
			
			//등록수정
    			$("#expenses,#incomes").on("click",function(){
    				
    				var trade = this.value;
    				
    				$.ajax({	
				      	type:"GET",
	                url:"doSearchTrade.do",   
	                dataType:"html",// JSON/html
	                async: false,
	                data:{ 
	                	 "searchTrade" :trade
		                 },
	                success: function(data){//통신이 성공적으로 이루어 졌을때 받을 함수	
	               	console.log("data="+data); 
	                	//json parsing
	                	var parseData = $.parseJSON(data); //데이터 들어있음.
	                	console.log("parseData"+parseData);
	              
	                	$('#searchCategory > option').remove();
	               
	                	$.each(parseData , function(idx, val) {
	                		 $('#searchCategory').append($('<option>', { 
	                             value: val[0],
	                             text : val[1],
	                         }));
	                	});
	               		
		                 },
		                complete: function(data){//무조건 수행
		                	 $("#expenseModal").modal();
		 					
		                 },
		                error: function(xhr,status,error){
		                console.log("do_checkedDelete error: "+error);
		                 }
			   		}); //--ajax
    				
    				
			      	   		
    				$("#doUpsert").on("click",function(){
		    			if(false==confirm("등록 하시겠습니까?"))return;
		    			$.ajax({	
					      	 type:"POST",
		                url:"doUpsert.do",   
		                dataType:"html",// JSON/html
		                async: false,
		                data:{ 
		                	"id": "a",
								"categoryId"			:$("#searchCategory").val(),
								"aDate"		:$("#aDate").val(),
								"item"		:$("#item").val(),
								"accountId"		:$("#searchAccount").val(),
								"tradeId"	:trade,
								"amount"		:$("#amount").val(),
								"memo"	:$("#memo").val()
			                 },
		                success: function(data){//통신이 성공적으로 이루어 졌을때 받을 함수
		               	 console.log("data="+data); 
		                	//json parsing
		                	var parseData = $.parseJSON(data); //데이터 들어있음.
		                	console.log("parseData"+parseData);
		                		
		                	if(parseData.msgId == "1"){
		                		alert(parseData.message);	
		                		doSearch();
		                	}else{
		                		alert(parseData.message);	
		                		}
		               		
			                 },
			                complete: function(data){//무조건 수행
			                 },
			                error: function(xhr,status,error){
			                console.log("do_checkedDelete error: "+error);
			                 }
				   		}); //--ajax
    				});//--등록
    			});
    		
			
     		//삭제
			$("#doDelete").on("click",function(){
    			console.log($("#ano").val());
    			
				
    			if(false==confirm("삭제 하시겠습니까?"))return;
    			$.ajax({	
			      	 type:"POST",
                url:"doDelete.do",   
                dataType:"html",// JSON/html
                async: false,
                data:{ 
						"ano"	:$("#ano").val()
	                 },
                success: function(data){//통신이 성공적으로 이루어 졌을때 받을 함수
               	 console.log("data="+data); 
                	//json parsing
                	var parseData = $.parseJSON(data); //데이터 들어있음.
                	console.log("parseData"+parseData);
                		
                	if(parseData.msgId == "1"){
                		alert(parseData.message);	
                		doSearch();
                	}else{
                		alert(parseData.message);	
                		}
               		
	                 },
	                complete: function(data){//무조건 수행
	                     
	                 },
	                error: function(xhr,status,error){
	                console.log("do_checkedDelete error: "+error);
	                 }
		   		}); //--ajax
    		});//--삭제
    		
		});
		
	
		
	</script>
	
  </body>
</html>