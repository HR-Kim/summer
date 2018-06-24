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
	

	//if (session.getAttribute("id") == null) {
	//	response.sendRedirect("login.jsp");
	//}
	
%>

<%-- CONTEXT --%>
<c:set var ="CONTEXT" value="${pageContext.request.contextPath}" ></c:set>
	<div class="container">
		<!-- Title-------------------------------------------- -->
		 <h3>아이디 찾기</h3>
		 
		<!--// Title------------------------------------------ -->
		<!-- TEST -->

		
		<!--// TEST -->


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
							class="form-control input-sm" value="${User.id}" maxlength="20" />
									<c:if test="${null == User.id}">
		 							일치하는 아이디가 없습니다.
									 </c:if>
					</div>
				</div>
			</form>
		</div>
		
		
		<!--// Input Form------------------------------------- -->
		
		<!-- Button-------------------------------------------- -->
		 <div class="form-inline pull-right">
		 	<button class="btn btn-success btn-sm" onclick="location.href='${CONTEXT}/user/login.do'">로그인</button>
		 	<button class="btn btn-success btn-sm" onclick="location.href='${CONTEXT}/user/signUp.do'">회원가입</button>
		 	<button class="btn btn-success btn-sm" onclick="location.href='${CONTEXT}/user/findPw.do'">비밀번호 찾기</button>
		 </div>
		<!--// Button------------------------------------------ -->		
		
		</div>
		<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="${CONTEXT}/resources/js/jquery-1.12.4.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="${CONTEXT}/resources/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	
		$(document).ready(function() {			
			
		});//--document.ready
	</script>