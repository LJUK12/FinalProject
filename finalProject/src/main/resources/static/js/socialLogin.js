/**
 * 
 */
 window.onload = function() {
 		const onClickGoogleLogin = (e) => {
	    	//구글 인증 서버로 인증코드 발급 요청
	 		window.location.replace("https://accounts.google.com/o/oauth2/v2/auth?"+
	        "client_id=1038144478925-gstskh8sr5odibc5v2as6bkj6o4u2sj0.apps.googleusercontent.com"+
	        "&redirect_uri=http://localhost:8080/login/oauth2/code/google"+
	        "&response_type=code"+
	        "&scope=email%20profile%20openid"+
	        "&access_type=offline")
	 	}
		
		const googleLoginBtn = document.getElementById("googleLoginBtn");
		googleLoginBtn.addEventListener("click", onClickGoogleLogin);
		
		const onClickFaceBookLogin = (e) => {
			window.location.replace("https://www.facebook.com/v3.3/dialog/oauth?"+
				    "client_id=465050345348940"+
				    "&redirect_uri=https%3A%2F%2Flocalhost%3A8080%2FApi%2FMember%2FOauth2ClientCallback%2Ffacebook%2F"+
				    "&state={}"+
				    "&resource_type=token")
		}
		
		const faceLoginBtn = document.getElementById("faceLoginBtn");
		faceLoginBtn.addEventListener("click", onClickFaceBookLogin); 
		
		/*const faceLoginBtn = document.getElementById("faceLoginBtn");
		faceLoginBtn.addEventListener("click", fnFbCustomLogin);
		
		//기존 로그인 상태를 가져오기 위해 Facebook에 대한 호출
		function statusChangeCallback(res){
			statusChangeCallback(response);
		}
		
		function fnFbCustomLogin(){
			FB.login(function(response) {
				if (response.status === 'connected') {
					FB.api('/me', 'get', {fields: 'name,email'}, function(r) {
						console.log(r);
					})
					//location.href="/";
				} else if (response.status === 'not_authorized') {
					// Facebook에 로그인했지만 앱에는 로그인하지 않았습니다.
					alert('앱에 로그인해야 이용가능한 기능입니다.');
				} else {
					// Facebook에 로그인하지 않음.
					alert('페이스북에 로그인해야 이용가능한 기능입니다.');
				}
			}, {scope: 'public_profile,email'});
		}
		
		window.fbAsyncInit = function() {
			FB.init({
				appId      : '465050345348940', // 내 앱 ID
				cookie     : true,
				xfbml      : true,
				version    : 'v13.0' //facebook api change log
			});
			FB.AppEvents.logPageView();   
		};*/
}