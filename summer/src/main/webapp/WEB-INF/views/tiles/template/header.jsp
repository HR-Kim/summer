<%--CONTEXT --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var = "CONTEXT"  value = "${pageContext.request.contextPath}"></c:set>

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
            <li><a href="${CONTEXT}/user/login.do">Login</a></li>
            <li><a href="${CONTEXT}/user/signUp.jsp">Join</a></li>
          </ul>
        </div>
      </div>
</nav>