/**
 * 
 */
$(document).ready(function(){
	$('.accordion').each(function(){
		var allDt = $(this).find('dt');
		var allDd = $(this).find('dd');
		
		// 전체 다 안보이게
		allDd.hide();
		allDt.css('cursor','pointer');
		
		allDt.click(function(){
			// alert('ok');  //이벤트 확인
			
			// 이벤트 걸려있는 것만 안보이게 닫고 열기
			allDd.hide();
//			$(this).next().fadeIn(1000);
			$(this).next().toggle();
			
		});
	});
});