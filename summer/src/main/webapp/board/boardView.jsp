<%@page import="com.summer.board.domain.Board"%>
<%@page import="com.summer.comm.StringUtil"%>
<%@page import="com.summer.comm.SearchVO"%>
<%@page import="org.slf4j.Logger"%>
<%@page import="org.slf4j.LoggerFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	Logger log = LoggerFactory.getLogger(this.getClass());
	log.debug("===================================");
	log.debug("this.getClass()="+this.getClass());
	log.debug("===================================");
	
	String sessionId = (String)session.getAttribute("id");	
	
%>

<%-- CONTEXT --%>
<c:set var ="CONTEXT" value="${pageContext.request.contextPath}" ></c:set>
	<div class="container">
	<br>
	<br>
	<br>
		<!-- Title-------------------------------------------- -->
		 <h3>자유게시판</h3>
		<!--// Title------------------------------------------ -->

		<!-- Button-------------------------------------------- -->
		 <div class="form-inline pull-right">
		 <br>
		 <c:if test="${Board.id == sessionScope.id}">
		 	<button class="btn btn-default btn-sm" id="do_selectOne">수정</button> 
		 											<!-- onclick="location.href='${CONTEXT}/board/boardUpdate.jsp'" -->
		 	<button class="btn btn-default btn-sm" id="do_delete" >삭제</button>
		 </c:if>		
		 </div>
		 
		<!--// Button------------------------------------------ -->

		
		<!-- Input Form--------------------------------------- -->
		<div class="container">
			<div class="col-lg-12"></div>
			<div class="col-lg-12"></div>
			<div class="panel panel-default"></div>
			<form class="form-horizontal" name="frm" id="frm"
				method="get">
				<div class="form-group">
					<label class="col-lg-4 control-label" style="display:none;">구분</label>
					<div class="col-lg-8">
						<input type="hidden"  name="category" id="category"
							class="form-control input-sm" value="${Board.category}" maxlength="20" />
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-lg-4 control-label">제목</label>
					<div class="col-lg-8">
						<input type="text" name="title" id="title" disabled="disabled"
							class="form-control input-sm" value="${Board.title}" maxlength="20" style="background-color:white"/>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-lg-4 control-label">작성자</label>
					<div class="col-lg-8">
						<input type="text" name="id" id="id" disabled="disabled"
							class="form-control input-sm" value="${Board.id}" maxlength="200" style="background-color:white"/>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-lg-4 control-label">글내용</label>
					<div class="col-lg-8">
						<textarea readonly class="form-control" id="content" name="content"  rows="15" style="background-color:white">${Board.content}</textarea>
					</div>
				</div>
			</form>
		</div>
		<!--// Input Form------------------------------------- -->
		
				
		<!-- Button-------------------------------------------- -->

		 <div class="form-inline pull-right">
		 	<button class="btn btn-default btn-sm" onclick="location.href='${CONTEXT}/board/do_selectList.do'" >취소</button>	
		 </div>
		 <br>
		 <br>
		 
		<!--// Button------------------------------------------ -->
	</div>
<div class="table-responsive container-fluid text-left">
<!-- 댓글 리스트 -->
<table  id="CommlistTable" class="table  table-striped table-bordered table-hover table-condensed">
    			<c:choose>
    			    <c:when test="${list2.size()>0}">
    					<c:forEach  var="CommentVO"  items="${list2}" varStatus="theCount">
    						<tr>
    							<td class="text-center col-md-1 col-xs-12"><c:out value="${CommentVO.commNum}"/></td>     						    
    						    <td class="text-center col-md-1 col-xs-12"><c:out value="${CommentVO.commRegId}"/></td>   						    
    							<td class="text-center col-md-1 col-xs-12"><c:out value="${CommentVO.commRegDate}"/></td>
    							<td class="text-center col-md-1 col-xs-12"><c:out value="${CommentVO.commContents}"/></td>
    							<c:if test="${param.regId == CommentVO.commRegId}">
    							<td class="text-center col-md-1 col-xs-12"><input type="button" class="btn btn-default btn-sm" title="<c:out value="${CommentVO.commNum}"/>" value="수정" id="update_comm_btn${theCount.count}" />  	
									<input type="button" class="btn btn-default btn-sm"  title="<c:out value="${CommentVO.commNum}"/>" value="삭제" id="del_comm_btn${theCount.count}" />
								</td>
								</c:if>	
    						</tr>
    					</c:forEach>  
    				</c:when>
    				<c:otherwise>
    					<tr>
    						<td class="text-center col-md-1 col-xs-12" colspan="99">등록된 댓글이 없습니다.</td>
    					</tr>
    				</c:otherwise>
    			</c:choose>
    	</table> 
<!--// 댓글 리스트 -->
</div> 
		<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="${CONTEXT}/resources/js/jquery-1.12.4.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="${CONTEXT}/resources/js/bootstrap.min.js"></script>
	<script type="text/javascript">


		
		$(document).ready(function() {

			//등록
			$("#do_add").on("click", function() {
				console.log("do_add")
				if (false == confirm("등록 하시겠습니까?"))
					return;

				$.ajax({
					type : "POST",
					url : "do_add.do",
					dataType : "html",// JSON/Html
					async : false,
					data : {
						"category" : $("#category").val(),
						"title" : $("#title").val(),
						"id" : $("#id").val(),
						"content" : $("#content").val()
					},
					success : function(data) {//통신이 성공적으로 이루어 졌을때 받을 함수
						console.log("data=" + data);
						//json parsing
						var parseData = $.parseJSON(data);
						console.log("parseData=" + parseData);

						if (parseData.msgId == "1") {
							alert(parseData.message);
							
							var frm = document.frm;
							frm.action = '${CONTEXT}'+"/board/do_selectList.do";
							frm.submit();	
						} else {
							alert(parseData.message);
						}

					},
					complete : function(data) {//무조건 수행

					},
					error : function(xhr, status, error) {
						console.log("do_save error: " + error);
					}

				});//--그리드 click -> ajax
			});//--등록
			
			//삭제
			$("#do_delete").on("click", function() {
				console.log("do_delete")
				var boardViewNum = ${Board.num};

				if (false == confirm("삭제 하시겠습니까?"))
					return;

				$.ajax({
					type : "POST",
					url : "do_delete.do",
					dataType : "html",// JSON/Html
					async : false,
					data : {
						"num" : boardViewNum,					
					},
					success : function(data) {//통신이 성공적으로 이루어 졌을때 받을 함수
						console.log("data=" + data);
						//json parsing
						var parseData = $.parseJSON(data);
						console.log("parseData=" + parseData);

						if (parseData.msgId == "1") {
							alert(parseData.message);
							
							var frm = document.frm;
							frm.action = '${CONTEXT}'+"/board/do_selectList.do";
							frm.submit();	
							
						} else {
							alert(parseData.message);
						}

					},
					complete : function(data) {//무조건 수행

					},
					error : function(xhr, status, error) {
						console.log("do_delete error: " + error);
					}

				});//--그리드 click -> ajax
			});//--삭제
			
			//수정
			$("#do_selectOne").on("click", function() {
				console.log("do_selectOne_update")
				
				if (false == confirm("수정 하시겠습니까?"))
					return;
				
				var num = ${Board.num};
				//location.href="/summer/board/do_selectOne.do?num="+num+"&id="+sessionId;
				location.href="/summer/board/do_selectUpdate.do?num="+num;
			});
			
			
		});//--document.ready
	</script>