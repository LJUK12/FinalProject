 
window.onload = function () {
	
	if($('#postWay').val() == "택배거래"){
		$('#map_direct').prepend('<div class="map_wrap">');
		$('#map_direct').prepend('<div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>');
		$('#map_direct').prepend('<div id="menu_wrap" class="bg_white">');
		$('#map_direct').prepend('<div class="option">');
		$('#map_direct').prepend('<div id="menu_wrap" class="bg_white">');
		$('#map_direct').prepend('<div>');
		$('#map_direct').prepend('키워드 : <input type="text" value="서울역" id="keyword" size="15">');
		$('#map_direct').prepend('<button onclick="searchPlaces(); return false;">검색하기</button>');
		$('#map_direct').prepend('</div>');
		$('#map_direct').prepend('</div>');
		$('#map_direct').prepend('<hr>');
		$('#map_direct').prepend('<ul id="placesList"></ul>');
		$('#map_direct').prepend('<div id="pagination"></div>');
		$('#map_direct').prepend('<div class="hAddr">');
		$('#map_direct').prepend('</div>');
		$('#map_direct').prepend('</div>');
		$('#map_direct').prepend('<br>');
		$('#map_direct').prepend('거래장소:<input type="text" class="form-control" name="postMap" id="postMap" readonly>');
		$('#map_direct').prepend('<br>');
		$('#map_direct').prepend('</div>');
		
	}


}
