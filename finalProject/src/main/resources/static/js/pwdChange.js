/**
 * 
 */

 window.onload = function() {
		 	$("#modal_pwChange_close_btn").click(function(){
		 		window.close();
		    });

		 	$("#modal_pwChange_confirm_btn").click(function(){
		 		var pwCheck1 = $("#pw-check1").val();
		 		var pwCheck2 = $("#pw-check2").val();

		 		if(pwCheck1 == pwCheck2 &&  pwCheck2 != '' ){
		 			$("#memPwdCheck").val(pwCheck1);
		 			$("#changeFrm").submit();
		 			window.opener.document.location.href="/";
		 		}else{
		 			alert('다시 한 번 확인해주세요');
		 		}
		 	});
		 	$("#pw-check1").keyup(function(){
		 		var pwCheck1 = $("#pw-check1").val();
		 		if(pwCheck1.length > 3 && pwCheck1.length < 21){
		 			$('#pw-check1').next().children().css({'color':'#008000'}).html('조건을 만족하였습니다').delay(1000).fadeOut(1000);
		 			$('#pw-check2').attr('readonly', false);
		 		}else{
		 			$('#pw-check1').next().children().css({'color':'red'}).html('비밀번호는 4~20글자로 입력해주세요').show();
		 			$('#pw-check2').attr('readonly', true).val("");
		 		}
		 	});
		 	$("#pw-check2").keyup(function(){
		 		var pwCheck1 = $("#pw-check1").val();
		 		var pwCheck2 = $("#pw-check2").val();
		 		if(pwCheck1 == pwCheck2 && pwCheck2 != ''){
		 			$('#pw-check2').next().children().css({'color':'#008000'}).html('일치합니다').fadeOut(1000);
		 		}else if(pwCheck1 != pwCheck2 && pwCheck2 != ''){
		 			$('#pw-check2').next().children().css({'color':'red'}).html('비밀번호가 일치하지 않습니다').show();
		 		}
		 	});
		} 