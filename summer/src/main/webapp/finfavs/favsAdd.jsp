<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
<input type="hidden" id = "msgId" value = "${messageVO.msgId}" />
<input type="hidden" id = "message" value="${messageVO.message}" />
<input type="hidden" id = "id" value = "<%=session.getAttribute("id")%>" />
<script type="text/javascript">

$(document).ready(function() {
	var msgId = document.getElementById("msgId").value;
	var message = document.getElementById("message").value;
	var id = document.getElementById("id").value;
	console.log('msgId' + msgId);

		alert(message);
		history.back();


});

</script>