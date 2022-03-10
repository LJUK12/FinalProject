$(document).ready(function(){
	$("#myp").on("click",function(){
		if($("#loginId").val()==""){
			alert("로그인이 필요합니다");
			return false;

		}
	});

});

