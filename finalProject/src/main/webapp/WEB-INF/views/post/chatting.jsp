<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
		<%
			Date nowTime = new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		%>
</head>
<body>

	
	<!-- 댓글 -->
				<article>
				<div id="hotItemsSection">
	           	<h2>댓글</h2>
	           	
	           	<br><br>
	           	
	           	<form id="Chatting" method="post" action="/insertChat">
	           	
	           	
	        		${sessionScope.sid}
	        		<input type="hidden" id="postNo" value="${post.postNo}">
					<input type="hidden" id="memNo" value="${sessionScope.No}">	
	        		<input type="text" name="chatContent" id="chatContentvalue=" >
	        		 <input type="hidden" name="chatDate"
						value="<%=sf.format(nowTime)%> ">
	        		<input type="submit" value="입력">
					
				
				</form>
				
				<br><br>
				
				 <c:forEach items="${chatList}" var="chat" end="3">
				 
	                        <p>${chat.memNo }</p>
	                        <p>${chat.chatContent }</p><br>
	                          
	             </c:forEach>
				
				
				
				
				</div>
				</article>	
				
</body>
</html>