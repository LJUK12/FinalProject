

$(document).ready(function(){
	$("#favoritPost").on("click",function(){
		var FavoritPost = $('#favoritPost').val();
		console.log("dd");
		
		$.ajax({
		type:"post",
		url:"/favoritPost",
		data:{postNo:  $('#postNo').val(),favorit:$('#favoritPost').val()},
		dataType:'text',
		success: function(favorit) {
			var FavoritPost = $('#favoritPost').val();
			if(Favorit == 0){
				FavoritPost = 0;
				$("#FavoritPost").css("background-color","white");
				console.log(Favorit);
			}
			else if(Favorit == 1){
				FavoritPost = 1;
				$("#FavoritPost").css("background-color","blue");
				console.log(Favorit);
			}
			else{
				alert("로그인 후 입력해 주세요");
			}
			
			$('#favoritPost').value = FavoritPost

		},
		error: function(favorit, textStatus) {
			alert("로그인 후 입력해 주세요");
		}
	});
	})
})