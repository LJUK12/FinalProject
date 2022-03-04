window.onload = function() {
	$("#pwd_btn").on("click", function () {
	    $("#memIdHidden").val($("#memId").val());
	    $("#memEmailHidden").val($("#memEmail").val());
	                
	    if($("#mIdHidden").val() == "" || $("#mPhoneHidden").val() == ""){
	    	alert('작성되지 않은 정보가 있습니다.');
	        return;
	    }
	    let left = Math.ceil((window.screen.width-400)/2);
	    let top = Math.ceil((window.screen.height-350)/2);
	    window.open('', 'popup', 'width=430px, height=250px, left='+left+', top='+top)
	    $("#pop-form").submit();
    });

}; 