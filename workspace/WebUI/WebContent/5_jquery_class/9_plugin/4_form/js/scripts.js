/**
 * 
 */


$(function(){
	$('#signup>form').validate({
		rules : {
			name : {
				required :true
			},
			email : {
				required :true,
				email : true
			},
			website : {
				url : true
			},
			password : {
				required :true,
				minlength : 6
			},
			passconf : {
				equlTo : '#password'
			}
		},
		success : function(label){
			label.addClass('valid');
			label.text('성공');	
		}
	});
	
	
	// 체크박스 선택 시 
	$(".check-all").change(function(){
		if($(".check-all").is( ":checked")){
			$(".agree").prop("checked", true);
		}else{
			$(".agree").prop("checked", false);
		}

//		$('.agree').attr('checked', this.checked);	
	
//		if($(".check-all").prop("checked")){ //클릭했을 때 체크가 된 상태면
//			//가나다라 체크박스에 체크 상태를 true로 준다
//			$(".agree").prop("checked",true);
//			}else{//클릭했을 때 체크가 안된 상태면
//			//가나다라 체크박스엥 체크 상태를 false로 준다.
//			$(".agree").prop("checked",false);
//			}
	});
	
});
