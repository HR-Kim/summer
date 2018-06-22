

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
    

  <div class="container">
  	<br/>
	<div>
  <!-- Button ----------------------------------------------------------->
    
   <div class="form-inline pull-right">
		<button class="btn btn-success btn-md" id="expenses" name="plus" value="10">+지출</button>
   		<button class="btn btn-success btn-md" id="incomes" name="plus" value="20">+수입</button>
   		<br/>
   </div>
   <!--// Button --------------------------------------------------------->
    
    
    
   <!--지출 Modal  --------------------------------------------------------->
    <div id="expenseModal" class="modal fade" role="dialog">
    	<div class="modal-dialog">
    		<div class="modal-content col-lg-10">
    		 	<form class="form-horizontal" name="frmEdit" id="frmEdit" method="post">
    		 		<div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
			        	<br/>
			        </div>
    		 	
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
					  				<select name="searchAccount" id="searchAccount" class="form-control input-sm">
                                    <option value=""> -- Select Account -- </option>
									</select>
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
					
						<div class="col-lg-10 form-group" id="submitBtn" align="right">
				    		
				    			<button class="btn btn-sm"  class="btn btn-sm btn-success" id="doUpsert">등록</button>
				    			
			    		</div> 
				</form>
    		</div>
    	</div>
   	</div>
    
   <!-- //Modal --------------------------------------------------------->
  
   <!-- Search ----------------------------------------------------------->
   	<form class="form-inline" name="frmSearch" id="frmSearch" method="get">
   		<input type="hidden" name="pageNum" id="pageNum" value="${searchVO.pageNum}"/>


   		<table class="table">
   			<tr>
   				<td class="text-left">
   					<div class="form-group col-lg6 col-sm6">
						<c:choose>
			        		<c:when test="${list1.size()>0 }">
					        		<select name="searchTrade" id="searchTrade" class="form-control input-sm">
					        			<option>전체</option>
						        		<c:forEach var="code" items="${list1 }">
						        			<option value="${code.cdDtlId }"
						        				<c:if test="${searchVO.searchTrade==code.cdDtlId}">selected='selected'</c:if>
						        			>${code.cdDtlNm}</option>
						        		</c:forEach>
					        		</select>
				         	</c:when>
			         </c:choose>
    					<select name="pageSize" id="pageSize" class="form-control input-sm">
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
						<input type="button" class="btn btn-sm btn-success" value="차트보기" onclick="showPopup();"/>	
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
		         		<th class="text-center" width="150">카테고리</th>
		         		<th class="text-center" width="150">날짜</th>
		         		<th class="text-center" width="200">항목</th>
		         		<th class="text-center" width="150">구분</th>
		         		<th class="text-center" width="200">금액</th>
		         		<th class="text-center" width="200">메모</th>
	         		</tr>
	        	</thead>
	        	<tbody>
	        		
	        	<c:choose>
	        		<c:when test="${list.size()>0 }">
	        			<c:forEach var="AccountsVO" items="${list }">
			        		<tr>
			        			<td class="text-center" style="display:none;">${AccountsVO.ano }</td>
			        			<td class="text-center" style="display:none;">${AccountsVO.tradeId }</td>
			          		<td class="text-center">
				          		<label class="badge" style="border: 1px solid #fd3258; background-color:#fd3258;">
				          		${AccountsVO.categoryId }</label>
			          		</td>
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
   </div>
   
   
   <!-- chart ----------------------------------------------------------->
   
	
	<script type="text/javascript">

		function showPopup() { window.open("${CONTEXT}/chart/chart.jsp", "a", "width=1200, height=900, left=100, top=50"); }
		
		//리스트 조회
		function doSelectList(){
			var frm = document.frmSearch;
			frm.action = "doSelectList.do";
			frm.submit();
		}
		
		//페이지 이동
		function search_page(url,pageNum){
			var frm = document.frmSearch;
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
    			
    			var tradeid;
    			if(trade=='지출') tradeid='10'
        		else if(trade == '수입') tradeid='20';
    			

 				//account selectBox
 				$.get( "doSearchTrade2.do", {"searchTrade" : trade},function(accountList) {
	    			}, 'json' /* xml, text, script, html */)
	    			.done(function(accountList) {
	    				
	    				$('#searchAccount > option').remove();
	    				
	       				$.each(accountList , function(idx, val) {
	                  		$('#searchAccount').append($('<option >', {
	                               value: val[0],
	                               text : val[1],
	                               
	                          }));
	                  	});
	    				
	    				//category selectBoxs
	    				$.get( "doSearchTrade.do", {"searchTrade" : trade},function(categoryList) {
	        			}, 'json' /* xml, text, script, html */)
	        			.done(function(categoryList) {
	        				$('#searchCategory > option').remove();
	        				$.each(categoryList , function(idx, val) {
	                   		$('#searchCategory').append($('<option >', {
	                                value: val[0],
	                                text : val[1],
	                                
	                           }));
	                   		
	                   		});
	        				
	        				$('#submitBtn > #doDelete').remove();
	        				$('#submitBtn').append('<button class="btn btn-sm" id="doDelete">삭제</button>');
	        				
	        				
	          			  if(false==confirm("조회 하시겠습니까?"))return;
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
	      		                 	
	      		                 		//화면에 정보 뿌리기.
	      		                 	$("#ano").val(parseData.ano);
	      		                 	$("#searchAccount").val(parseData.accountId).attr("selected", "selected");
	        							$("#searchCategory").val(parseData.categoryId).attr("selected", "selected");
	      								$("#aDate").val(parseData.aDate);
	      								$("#item").val(parseData.item);
	      								$("#amount").val(parseData.amount);
	      								$("#memo").val(parseData.memo);
	      								
	      			                 },
	      			                complete: function(data){
	      			                	
	      			                		//수정
	      			                	$("#doUpsert").on("click",function(){
	      			                		
	      					    			if(false==confirm("수정 하시겠습니까?"))return;
	      					    			
	      					    			$.ajax({	
	      								      	 type:"POST",
	      					                url:"doUpsert.do",   
	      					                dataType:"html",// JSON/html
	      					                async: false,
	      					                data:{ 
	      					                		"id": "a",
	      					                		"ano" : ano,
	      											"categoryId"			:$("#searchCategory option:selected").val(),
	      											"aDate"		:$("#aDate").val(),
	      											"item"		:$("#item").val(),
	      											"accountId"		:$("#searchAccount option:selected").val(),
	      											"tradeId"	:tradeid,
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

	      					                		doSelectList();
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
	      			    				});//--수정
	      			    				
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

	      			    	                		doSelectList();
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
	    			}).always(function(accountList) {
	    			
    			
    			});
 
    		});// --클릭끝
			
			//등록
    			$("#expenses,#incomes").on("click",function(){
    				
    				var trade = this.value;
    				
    				$('#submitBtn > #doDelete').remove();
    				$.ajax({	
				      	type:"GET",
	                url:"doSearchTrade.do",   
	                dataType:"html",// JSON/html
	                async: false,
	                data:{ 
	                	 "searchTrade" :trade
		                 },
	                success: function(data){//통신이 성공적으로 이루어 졌을때 받을 함수	
	                	
	                	$.get( "doSearchTrade2.do", {"searchTrade" : trade},function(accountList) {
		    			}, 'json' /* xml, text, script, html */)
		    			.done(function(accountList) {
		    				
		    				$('#searchAccount > option').remove();
		    				
		       				$.each(accountList , function(idx, val) {
		                  		$('#searchAccount').append($('<option >', {
		                               value: val[0],
		                               text : val[1],
		                               
		                          }));
		                  	});	
		    			
	                	
	                	
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
		    			console.log($("#ano").val());
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

		                		doSelectList();
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
    		
			
    			//모달 값 초기화.
    			$('.modal').on('hidden.bs.modal', function (e) {
    			    $(this).find('form')[0].reset()
    			});

    		
		});
		
		
	</script>
	
  </body>
</html>