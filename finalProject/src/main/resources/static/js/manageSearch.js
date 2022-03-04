/**
 * manageSearch.js
 */
 
 $(function(){
	$('#srchMem').on('input', function(){
		$.ajax({
			type : 'post',
			url : '/mngMemberSearch',
			data:{"memSearchVal" : $(this).val()},
			dataType: "text",
			success:function(result){
				$('#trTableStyle1').html(result);
			},
			error:function(data, textStatus){
				alert("전송 실패");
			}
		});
	})
	
	$('#srchPost').on('input', function(){
		$.ajax({
			type : 'post',
			url : '/mngPostSearch',
			data:{"postSearchVal" : $(this).val()},
			dataType: "text",
			success:function(result){
				$('#trTableStyle2').html(result);
			},
			error:function(data, textStatus){
				alert("전송 실패");
			}
		});
	})
	
	$('#srchChat').on('input', function(){
		$.ajax({
			type : 'post',
			url : '/mngChatSearch',
			data:{"chatSearchVal" : $(this).val()},
			dataType: "text",
			success:function(result){
				$('#trTableStyle3').html(result);
			},
			error:function(data, textStatus){
				alert("전송 실패");
			}
		});
	})
	
	$('#srchTran').on('input', function(){
		$.ajax({
			type : 'post',
			url : '/mngTranSearch',
			data:{"tranSearchVal" : $(this).val()},
			dataType: "text",
			success:function(result){
				$('#trTableStyle4').html(result);
			},
			error:function(data, textStatus){
				alert("전송 실패");
			}
		});
	})
})