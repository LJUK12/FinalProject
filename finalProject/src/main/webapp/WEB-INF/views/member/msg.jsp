<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<!-- Controller에서 alert를 사용하기 위한 페이지 -->
	</body>
	<script>
		alert("${msg}");
		if(("${msg2}"))
			window.close();
		location.href = "${loc}";
		
	</script>
</html>