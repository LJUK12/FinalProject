/**
 * searchPost (top 검색 기능	)
 */
 
 
 
window.onload = function () {
	PriceChange();
	SearchMemIDAjax();


}









function PriceChange(){
	var price = $('#postPrice').val();
	console.log(price);
	var price2 = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	$('#postPriceText').prepend(price2 + "원");
}


$(function() {
	$('#Chatting').on('submit', function() {
		insertchatAjax();
	
		return false;
	})
	
	$('#favoritimg').click(function() {
	FavoritAjax();
	
		return false;
	})
	
	$('.buybtn').click(function() {
		var postNo=$('#postNo').val();
		console.log(postNo);
		console.log($('#postWay').val());
		if($('#postWay').val()=="직거래"){
			location.href="/post/insertdirectTranForm/"+postNo;
		}else if($('#postWay').val()=="택배거래"){
			location.href="/post/insertcourierTranForm/"+postNo;
		}
	})
	
	
	$('.deletebtn').click(function() {
	deleteAjax();
	
		return false;
	})
	
	$('#declimg').click(function(){
		var confirmflag = confirm("확인을 누르시면 해당 게시글이 신고됩니다.");
		if(confirmflag){
			declAjax()
		}else{
			alert("신고 기능을 취소하셨습니다.");
		}
		return false;
	})
	
	var FavoritPost = $('#favoritPost').val();
	$("#favoritPost").on("click",function(){
		
		console.log("dd");
		FavoritPostAjax();
	})
	
	if(FavoritPost == 1){
		document.getElementById("favoritPostimg").src = "/image/별2.png";
	}
	
	
	
})



function SearchMemIDAjax() {
	console.log($('#postNo').val());
	$.ajax({
		type:"post",
		url:"/searchMemid",
		data:{postNo:$('#postNo').val()},
		dataType:'text',
		success: function(result) {
			$('#searchmemId').prepend("<p>"+result+"</p>");
			console.log(result);

		},
		error: function(result, textStatus) {
			console.log(result + textStatus);
			alert("아이디 불러오기 에러");
		}
	});
}




function insertchatAjax() {
	var formdata = $('#Chatting').serialize();
	if($('#chatContent').val() ==""){
		alert("내용을 입력하세요");
		return false;
	}
	$.ajax({
		type: "post",
		url: "/insertChat.do",
		data: formdata,
		dataType: 'text',
		
		success: function(result) {
			let today = new Date();
			var year = today.getFullYear().toString();
			var year2 = year.substr(2,4);
			let month = today.getMonth() + 1
			let date = today.getDate();
			let hours = today.getHours();
			let minutes = today.getMinutes();
			let seconds = today.getSeconds();
			$('#chatList').prepend($('#chatContent').val() + "<br><br><hr class='chathr'>");
			$('#chatList').prepend("<p class='chatingDate'>"+year2+"."+"0"+month+"."+date+"."+hours+"."+minutes+"</p>");
			$('#chatList').prepend("<br>"+$('#memid').val() + "<br>");
			
			$('#chatContent').val('');
			

		},
		error: function(result, textStatus) {
			alert("로그인 후 입력해 주세요");
			
		}
	});
}

function FavoritAjax() {
	var favoritNo = Number($('#favorit').val());
	$.ajax({
		type:"post",
		url:"/favorit",
		data:{postNo:  $('#postNo').val()},
		dataType:'text',
		success: function(result) {
			favoritNo++;
			$('#favorit').prepend($('#favorit').val(favoritNo));
			console.log(result);

		},
		error: function(result, textStatus) {
			console.log(result + textStatus);
			alert("에러");
		}
	});
}



function deleteAjax() {
	console.log($('#postNo').val());
	$.ajax({
		type:"post",
		url:"/deletePost",
		data:{postNo:$('#postNo').val(),memNo:$('#memNo').val()},
		dataType:'text',
		success: function(result) {
			if(result == "success"){
			alert("상품 게시글이 삭제되었습니다.");
			location.href="/";
			}else{
				alert("상품 작성자가 아닙니다.");
			}
		},
		error: function(result, textStatus) {
			console.log(result + textStatus);
			alert("상품 작성자가 아닙니다.");
		}
	});
}


function FavoritPostAjax(){
	$.ajax({
		type:"post",
		url:"/favoritPost",
		data:{postNo:  $('#postNo').val(),favorit:$('#favoritPost').val()},
		dataType:'text',
		success: function(favorit) {
			var FavoritPost = $('#favoritPost').val();
			if(favorit == 0){
				FavoritPost = 0;
				document.getElementById("favoritPostimg").src = "/image/별.png";
				console.log(favorit);
			}
			else if(favorit == 1){
				FavoritPost = 1;
				document.getElementById("favoritPostimg").src = "/image/별2.png";
				console.log(favorit);
			}
			else{
				alert("로그인 후 입력해 주세요2");
			}
			
			$('#favoritPost').value = FavoritPost

		},
		error: function(favorit, textStatus) {
			alert("로그인 후 입력해 주세요");
		}
	});
}


function declAjax() {
	$.ajax({
		type:"post",
		url:"/declPost",
		data:{postNo:$('#postNo').val()},
		dataType:'text',
		success: function(result) {
			if(result == "success"){
			alert("상품 게시글이 신고되었습니다.");
			location.href="/";
			}else{
				alert("상품이 신고되지 않았습니다.");
			}
		},
		error: function(result, textStatus) {
			console.log(result + textStatus);
			alert("상품이 신고되지 않았습니다.");
		}
	});
}






/*
1) detailViewPost.jsp
<form id="Chatting">에서 method, action 제거
- 여기에 action을 작성해두면 Ajax로 전송되지 않음

2)insertchat2.js 	
$('#chatList').prepend($('#chatContent').val() + "<br>");
$('#chatContent').val('');

- 댓글 영역에 댓글 추가하는 코드와, 입력한 댓글 지워주는 코드 추가

3) PostController.java
@ResponseBody
@RequestMapping("/insertChat.do") 
public String insertChat(ChatVO vo) 

- ChatVO vo만 받아오기. 
*/
