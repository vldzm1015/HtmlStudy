/**
 * 
 */

$(function(){
	// (1) 테이블의 홀수행 배경색 변경
//	$('#celebs tbody tr:odd').css({'background':'#dddddd',
//		'color':'#ff2288'});
	$('#celebs tbody tr:odd').addClass('table_striping');
	
	// (2) 테이블에 마우스 올라가면 색 변경
	
	
	// (css 파일에 있는 td_mousever 클래스 지정)
	$('#celebs tr').mouseover(function(){
		$(this).addClass('td_mouseover');
	}). mouseout(function(){
		$(this).removeClass('td_mouseover');
	});
	
	
	
	// 버튼활성화 시키기
	$('#hideButton').click(function(){
		$('#intro img').fadeOut(1000);
	});
	$('#showButton').click(function(){
		$('#intro img').fadeIn(1000);
	});
	$('#toggleButton').click(function(){
		
		// hide + show
//		$('#intro > img').toggle(1000);
		// sildeOut + sildeIn
//		$('#intro > img').slideToggle(1000);
		
		// fadeOut + fadeIn
//		$('#intro > img').fadeToggle(1000);
		
		var img = $('#intro img');
		if( img.is(':visible')){
			img.fadeOut(1000);
		}else{
			img.fadeIn(1000);
		};
	});
	
	
});