/**
 * 
 */

window.onload = function (){

	var price = new Array();
	var content = new Array();

//	//#### 1. TD에 이벤트 발생
//	//#####  2. 확인 버튼 클릭시 선택한 TD의 색을 다시 흰색으로
//	//#####  3. 값 계산하여 총합 구하기 - 각각 TD 클릭시 배열에 저장하였다가 계산

	var td = document.getElementsByClassName('menu');
	var option = document.getElementById('count');
//	alert(option.length);

	for (var i = 0; i < td.length; i++) {
		td[i].onclick = function(){
			price.push(this.childNodes[0].nodeValue+ 
					this.childNodes[2].nodeValue);
		}
	}
	function option(){
		price.push(this.childNodes[0].nodeValue);
		alert(price);
	}

}
