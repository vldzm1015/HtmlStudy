$.fn.red=function(){
	// 여기서는 분명하게 this / $(this) 구별하여 사용
	this.css('background','red');
	return this;
	
}