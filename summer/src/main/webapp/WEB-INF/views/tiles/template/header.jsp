<%--CONTEXT --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String userIdM = null;
	
	if(null == session.getAttribute("id")){
		
	}else {
		userIdM = session.getAttribute("id").toString();
}

%>
<c:set var = "CONTEXT"  value = "${pageContext.request.contextPath}"></c:set>
<c:set var="userIdM" value="<%=userIdM %>"></c:set>
<nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="${CONTEXT}/hello.do"><img src="${CONTEXT}/resources/theme/images/logo.png"></a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
          <c:choose>
	         <c:when test="${userIdM eq null}">
            <li><a href="${CONTEXT}/user/login.do">Login</a></li>
            <li><a href="${CONTEXT}/user/signUp.do">Join</a></li>
            </c:when>
           	<c:when test="${userIdM ne null}">
           	 <li><a href="${CONTEXT}/user/infoUser.do">Mypage</a></li>
            <li><a href="${CONTEXT}/user/do_logout.do">Logout</a></li>
            </c:when>
         </c:choose>
            
          </ul>
        </div>
      </div>
</nav>