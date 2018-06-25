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
	
	
	String id = session.getAttribute("id").toString();
	
	log.debug("infouserid="+id);
	
	
	

	if (session.getAttribute("id") == null) {
		response.sendRedirect("user/login");
	}
	
%>

<%-- CONTEXT --%>
<c:set var ="CONTEXT" value="${pageContext.request.contextPath}" ></c:set>
	<div class="container">
		<!-- Title-------------------------------------------- -->
		 <h3>회원정보</h3>
		 
		<!--// Title------------------------------------------ -->
		<!-- Test -->
		
		<h2><%= session.getAttribute("name") %>님 환영합니다</h2>
		
		<!-- //Test -->


		<!-- Input Form--------------------------------------- -->
		<div class="container">
			<div class="col-lg-12"></div>
			<div class="col-lg-12"></div>
			<div class="panel panel-default"></div>
			<form class="form-horizontal" name="frmEdit" id="frmEdit"
				method="post">				
				<div class="form-group">
					<label class="col-lg-4 control-label">아이디</label>
					<div class="col-lg-8">
						<input type="text" disabled="disabled" name="id" id="id"
							class="form-control input-sm" value="<%= session.getAttribute("id") %>" maxlength="20"  style="background-color:white"/>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-lg-4 control-label">이름</label>
					<div class="col-lg-8">
						<input type="text" name="name" id="name" disabled="disabled"
							class="form-control input-sm" value="<%= session.getAttribute("name") %>" maxlength="20"  style="background-color:white"/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-4 control-label">별명</label>
					<div class="col-lg-8">
						<input type="text" name="nickname" id="nickname" disabled="disabled"
							class="form-control input-sm" value="<%= session.getAttribute("nickname") %>" maxlength="20"  style="background-color:white"/>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-lg-4 control-label">성별</label>
					<div class="col-lg-8">
						<input type="text" name="gender" id="gender" disabled="disabled"
							class="form-control input-sm" value="<%= session.getAttribute("gender") %>" maxlength="20"  style="background-color:white"/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-4 control-label">생년월일</label>
					<div class="col-lg-8">
						<input type="text" name="birth" id="birth" disabled="disabled"
							class="form-control input-sm" value="<%= session.getAttribute("birth") %>" maxlength="20"  style="background-color:white"/>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-lg-4 control-label">이메일</label>
					<div class="col-lg-8">
						<input type="text" name="email" id="email" disabled="disabled"
							class="form-control input-sm" value="<%= session.getAttribute("email") %>" maxlength="20"  style="background-color:white"/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-4 control-label">연락처</label>
					<div class="col-lg-8">
						<input type="text" name="phone" id="phone" disabled="disabled"
							class="form-control input-sm" value="<%= session.getAttribute("phone") %>" maxlength="20"  style="background-color:white"/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-4 control-label">등급</label>
					<div class="col-lg-8">
						<input type="text" name="grade" id="grade" disabled="disabled"
							class="form-control input-sm" value="<%= session.getAttribute("grade") %>" maxlength="50"  style="background-color:white"/>
					</div>
				</div>
			</form>
		</div>
		<!--// Input Form------------------------------------- -->
		
		<!-- Button-------------------------------------------- -->
		 <div class="form-inline pull-right">
		 	<button class="btn btn-default btn-sm" id="do_getUpdateUser">회원정보 수정</button>
		 	<button class="btn btn-default btn-sm" id="do_getUpdatePwd">비밀번호 변경</button>
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
			//회원정보 수정
			$("#do_getUpdateUser").on("click", function() {
				console.log("do_getUpdateUser")
				var id = $("#id").val();

				location.href="/summer/user/do_getUpdateUser.do?id="+id;						
			});//--그리드 click -> ajax
			//비밀번호 수정
			$("#do_getUpdatePwd").on("click", function() {
				console.log("do_getUpdatePwd")
				var id = $("#id").val();

				location.href="/summer/user/do_getUpdatePwd.do?id="+id;						
			});//--그리드 click -> ajax
		});//--document.ready
	</script>