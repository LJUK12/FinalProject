 
window.onload = function () {
	
	SearchMemIDAjax();


}


function SearchMemIDAjax() {
	console.log($('#memNo').val());
	$.ajax({
		type:"post",
		url:"/searchMemid2",
		data:{postNo:$('#memNo').val()},
		dataType:'text',
		success: function(result) {
			document.getElementById("memId").value = result;
			console.log(result);

		},
		error: function(result, textStatus) {
			console.log(result + textStatus);
			alert("아이디 불러오기 에러");
		}
	});
}