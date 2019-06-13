/**
 * 
 */

$(function(){
	$('.rollover').each(function(){
		var a = $(this);
		var img = a.find('img');
		
		// [필수] img의 속성중에서 src 값 변경 ( attr() 이용 )
		// [선택] replace('a','b') 이용		
		var src_off = img.attr('src');
		var src_on = src_off.replace('_off','_on');

//		$('<img/>').attr('src',src_on);
		a.hover(function(){
			img.attr('src',src_on);
		},function(){
			img.attr('src',src_off);
		});
		
		
		
		
	});
}); 