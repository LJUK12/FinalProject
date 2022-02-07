<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>board</title>


<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">

<script type="text/javascript" src="/smarteditor2/js/HuskyEZCreator.js"
	charset="utf-8"></script>

<%
Date nowTime = new Date();
SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
%>
<style>
#smart_editor2 {
	width: 1600px;
	height: 1400px;
}
</style>


<script>
	$(document).on('click', '#btnSave', function(e) {
		e.preventDefault();
		$("#form").submit();
	});

	$(document)
			.on(
					'click',
					'#btnList',
					function(e) {
						e.preventDefault();
						location.href = "${pageContext.request.contextPath}/board/getBoardList";
					});
</script>
</head>

<body>
	<!-- TOP  -->
	<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />

	<br>
	<br>
	<br>
	<br>
	<div id="wrap">
		<article>

			<div class="container" role="main">

				<h2>Post 작성</h2>

				<form id="insertPostForm" method="post" action="/post/insertPost"
					enctype="multipart/form-data" onsubmit="submitContents()">


					<div class="mb-3">

						<label for="title">제목</label> <input type="text"
							class="form-control" name="postTitle" id="postTitle"
							placeholder="제목을 입력해 주세요">

					</div>


					<div class="mb-3">

						<label for="reg_id">작성자</label> <input type="text"
							class="form-control" name="memNo" id="memNo"
							value="${sessionScope.No}" readonly>

					</div>


					<!-- CONTENT -->
					<div class="mb-3">

						<label for="content">내용</label>

						<textarea name="postContent" id="postContent" rows="10" cols="90"></textarea>
						<!-- <div contentEditable="true" id="post_content" class="form-control" >

                            </div> -->


						<!-- <textarea class="form-control" rows="5" name="post_content"
                                id="post_content" placeholder="내용을 입력해 주세요"></textarea>
     -->
					</div>


					<div class="mb-3">


						<label for="tag">카테고리</label> 
							<!-- <input type="text"
							class="form-control" name="postTag" id="postTag"
							placeholder="태그를 입력해 주세요">  -->
							
							<select class="form-control" name="postTag" id="postTag">
							<option value="생활가전">생활가전</option>
							<option value="가구/인테리어">가구/인테리어</option>
							<option value="의류" >의류</option>
							<option value="디지털기기" selected>디지털기기</option>
							</select> 
							
							<input type="hidden" class="form-control" name="postState"
							id="postState" value="판매중">

					</div>

					<input type="file" id="uploadFile" name="uploadFile"><br>
					<br><fmt:formatDate value="${post.postDate }"  pattern="YY.MM.dd yy:hh:ss"/>
					<div>

						<input type="submit" value="등록"> <input type="button"
							value="취소" onclick="location.href='<c:url value="/"/>'">

					</div>

				</form>


			</div>

		</article>
	</div>
	<script type="text/javascript">
		var oEditors = [];

		nhn.husky.EZCreator.createInIFrame({

			oAppRef : oEditors,

			elPlaceHolder : "postContent",

			sSkinURI : "/smarteditor2/SmartEditor2Skin.html",/* "/package/dist/SmartEditor2Skin.html", */

			fCreator : "createSEditor2"

		});

		function submitContents(elClickedObj) {
			// 에디터의 내용이 textarea에 적용된다.
			oEditors.getById["postContent"].exec("UPDATE_CONTENTS_FIELD", []);

			// 에디터의 내용에 대한 값 검증은 이곳에서
			console.log(document.getElementById("postContent").value);

			try {
				elClickedObj.form.submit();
			} catch (e) {
			}
		}
	</script>
	<br>
	<br>
	<br>
	<br>
</body>

</html>



