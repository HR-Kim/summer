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
		 <h3>회원정보수정</h3>
		<!--// Title------------------------------------------ -->
		

		<!-- Input Form--------------------------------------- -->
		<div class="container">
			<div class="col-lg-12"></div>
			<div class="col-lg-12"></div>
			<div class="panel panel-default"></div>
			<form class="form-horizontal" name="frm" id="frm"
				method="post">				
				<div class="form-group">
					<label class="col-lg-4 control-label">아이디</label>
					<div class="col-lg-8">
						<input type="text" disabled="disabled" name="id" id="id"
							class="form-control input-sm" value="${User.id}" maxlength="20" />
					</div>
				</div>

				<div class="form-group">
					<label class="col-lg-4 control-label">이름</label>
					<div class="col-lg-8">
						<input type="text" name="name" id="name"
							class="form-control input-sm" value="${User.name}" maxlength="20" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-4 control-label">별명</label>
					<div class="col-lg-8">
						<input type="text" name="nickname" id="nickname"
							class="form-control input-sm" value="${User.nickname}" maxlength="20" />
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-lg-4 control-label">이메일</label>
					<div class="col-lg-8">
						<input type="text" name="email" id="email"
							class="form-control input-sm" value="${User.email}" maxlength="20" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-4 control-label">연락처</label>
					<div class="col-lg-8">
						<input type="text" name="phone" id="phone"
							class="form-control input-sm" value="${User.phone}" maxlength="20" />
					</div>
				</div>
			</form>
		</div>
		<!--// Input Form------------------------------------- -->
		
		<!-- Button-------------------------------------------- -->
		 <div class="form-inline pull-right">
		 	<button class="btn btn-success btn-sm" id="do_update">수정</button>
		 	<button class="btn btn-success btn-sm" onclick="location.href='${CONTEXT}/hello.do'">취소</button>
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
			//수정
			$("#do_update").on("click", function() {
				console.log("do_update")

				if (false == confirm("수정 하시겠습니까?"))
					return;
				
				$.ajax({
					type : "POST",
					url : "do_update.do",
					dataType : "html",// JSON/Html
					async : false,
					data : {
						"id" : $("#id").val(),
						"name" : $("#name").val(),
						"nickname" : $("#nickname").val(),
						"email" : $("#email").val(),
						"phone" : $("#phone").val(),
						"grade" : ${User.grade}
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
						console.log("do_update error: " + error);
					}
				});//--그리드 click -> ajax
			});//--등록
		});//--document.ready
	</script>