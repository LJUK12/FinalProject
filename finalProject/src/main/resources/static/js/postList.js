/**
 * 
 */
 
 
 window.onload = function () {
	
	SearchMemIDAjax();

}

 
 function SearchMemIDAjax() {
	console.log($('#memNo').val());
	$.ajax({
		type:"post",
		url:"/searchMemid",
		data:{postNo:$('#memNo').val()},
		dataType:'text',
		success: function(result) {
			document.getElementById("memId").value = result;
			console.log(result);

		},
		error: function(result, textStatus) {
			console.log(result + textStatus);
			alert("로그인이 필요합니다.");
			location.href="/board/list";
		}
	});
}