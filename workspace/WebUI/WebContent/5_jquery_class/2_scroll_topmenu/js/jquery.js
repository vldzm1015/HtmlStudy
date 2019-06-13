/**
 * 
 */

$(document).ready(function(){
	$('#navigation >ul > li').hover(function(){
	$(this).animate({'paddingLeft':'+=15px'},200);
	},function(){
		$(this).animate({'paddingLeft':'-=15px'},200);
	});
	
	
	// 퀵메뉴
	$(window).scroll(function(){
		$('#navigation').css('top',$(document).scrollTop());
	});
	
	
});