<%@page import="com.summer.comm.StringUtil"%>
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
%>

<%-- CONTEXT --%>
<c:set var ="CONTEXT" value="${pageContext.request.contextPath}" ></c:set>
	<div class="container">
		<!-- Title-------------------------------------------- -->
		 <h3>비밀번호 변경</h3>
		<!--// Title------------------------------------------ -->


		<!-- Input Form--------------------------------------- -->
		<div class="container">
			<div class="col-lg-12"></div>
			<div class="col-lg-12"></div>
			<div class="panel panel-default"></div>
			<form class="form-horizontal" name="frm" id="frm"
				method="post">				
				<div class="form-group">
					<div class="col-lg-8">
						<input type="text" name="currentPwd" id="currentPwd"
							class="form-control input-sm" placeholder="현재 비밀번호" maxlength="20" />
					</div>
				</div>
				<div class="form-group">
					<div class="col-lg-8">
						<input type="password" name="pwd" id="pwd"
							class="form-control input-sm" placeholder="새 비밀번호" maxlength="20" />
					</div>
				</div>
				<div class="form-group">
					<div class="col-lg-8">
						<input type="text" name="newPwdCheck" id="newPwdCheck"
							class="form-control input-sm" placeholder="비밀번호 확인" maxlength="20" />
					</div>
				</div>

			</form>
		</div>
		<!--// Input Form------------------------------------- -->
		
		<!-- Button-------------------------------------------- -->
		 <div class="form-inline pull-right">
		 	<button class="btn btn-default btn-sm" id="do_updatePwd">변경</button>
		 	<button class="btn btn-default btn-sm" onclick="location.href='${CONTEXT}/hello.do'">취소</button>
		 </div>
		<!--// Button------------------------------------------ -->
		
		
		</div>
		<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="${CONTEXT}/resources/js/jquery-1.12.4.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="${CONTEXT}/resources/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	
		//Null check
		function isEmpty(value) {
			if (!value) {
				alert("값을 입력하세요.");
				return true;
			}
		}

		$(document).ready(function() {			
			//등록
			$("#do_updatePwd").on("click", function() {
				console.log("do_updatePwd")
				var sessionId = "<%= session.getAttribute("id") %>";

				if (false == confirm("변경 하시겠습니까?"))
					return;
				
				$.ajax({
					type : "POST",
					url : "do_updatePwd.do",
					dataType : "html",// JSON/Html
					async : false,
					data : {
						"pwd" : $("#pwd").val(),
						"id" : sessionId
					},
					success : function(data) {//통신이 성공적으로 이루어 졌을때 받을 함수
						console.log("data=" + data);
						//json parsing
						var parseData = $.parseJSON(data);
						console.log("parseData=" + parseData);
						
						if (parseData.msgId == "1") {
							alert(parseData.message);
// 							var frm = document.frm;
// 							frm.action = '${CONTEXT}'+"/user/infoUser.do";
// 							frm.submit();	
						} else {
							alert(parseData.message);
						}

					},
					complete : function(data) {//무조건 수행

					},
					error : function(xhr, status, error) {
						console.log("do_updatePwd error: " + error);
					}
				});//--그리드 click -> ajax
			});//--등록
		});//--document.ready
	</script>