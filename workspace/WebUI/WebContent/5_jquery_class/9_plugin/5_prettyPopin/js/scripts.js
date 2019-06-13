/**
 * 
 */
$(function(){
	// 선택자 구체척으로 찾기
	
	// 첫번째 팝업
	$('a[rel="prettyPopin"]:eq(0)').prettyPopin({
		width:500
	});
	
	// 두번째 팝업
	$('a[rel="prettyPopin"]:eq(1)').prettyPopin({
		width:550,
		// 함수리터럴. 함수를 변수값처럼 쓰기
		callback : function(){
					alert('close')
					}
	});
	
	
});