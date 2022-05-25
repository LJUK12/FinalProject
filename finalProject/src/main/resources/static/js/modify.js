/**
 * 
 */
	let form = $("#infoForm");        // 페이지 이동 form(리스트 페이지 이동, 조회 페이지 이동)
	let mForm = $("#modifyForm");    // 페이지 데이터 수정 from
	
	/* 목록 페이지 이동 버튼 */
	$("#list_btn").on("click", function(e){
	    form.find("#comNo").remove();
	    form.attr("action", "/board/list");
	    form.submit();
	});
	
	/* 수정 하기 버튼 */
	$("#modify_btn").on("click", function(e){
	    mForm.submit();
	});
	
	/* 취소 버튼 */
	$("#cancel_btn").on("click", function(e){
	    form.attr("action", "/board/list");
	    form.submit();
	});    
	
	/* 삭제 버튼 */
    $("#delete_btn").on("click", function(e){
        form.attr("action", "/board/delete");
        form.attr("method", "post");
        form.submit();
    });
