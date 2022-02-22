/**
 * searchPost (top 검색 기능	)
 */
window.onload = function () {
	console.log($('#memNo').val());
	SearchMemIDAjax();
	
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
	
	$('#buybtn').click(function() {
		var postNo=$('#postNo').val();
		console.log(postNo);
		console.log($('#postWay').val());
		if($('#postWay').val()=="직거래"){
			location.href="/post/insertdirectTranForm/"+postNo;
		}else if($('#postWay').val()=="택배거래"){
			location.href="/post/insertcourierTranForm/"+postNo;
		}
	})
	
	
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
	
	$.ajax({
		type: "post",
		url: "/insertChat.do",
		data: formdata,
		dataType: 'text',
		
		success: function(result) {

			$('#chatList').prepend($('#chatContent').val() + "<br><br>");
			$('#chatList').prepend($('#memid').val() + "<br>");
			
			$('#chatContent').val('');
			console.log(result);

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
			$('#favoritbtn').prepend($('#favorit').val(favoritNo));
			console.log(result);

		},
		error: function(result, textStatus) {
			console.log(result + textStatus);
			alert("에러");
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
