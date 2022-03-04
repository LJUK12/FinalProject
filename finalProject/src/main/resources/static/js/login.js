window.onload = function() {
	$('#loginForm').on('submit', function(){
		
		if($('#memId').val()==''){
			alert("아이디를 입력해주세요.");
			$('#memId').focus();
			return false;
		} else if($('#memPwd').val()==''){
			alert("비밀번호를 입력해주세요.");
			$('#memPwd').focus();
			return false;
		}
		
		event.preventDefault();
		
		var formData = $(this).serialize();
		
		$.ajax({
			type:"post",
			url:"loginCheck",
			data:formData,
			success:function(result){
				if(result == "success") {
					alert("로그인 성공\n");
					location.href = "/";
				} else {
					alert("아이디 또는 비밀번호가 일치하지 않습니다.");
				}
			},
			error:function(data, textStatus){
				alert("전송 실패");
			}
		});
	});
};