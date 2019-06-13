


$(function(){
	
	function ta_fontsize(){
		document.getElementById("text_area").style.fontSize = '30px';
	}
	
	var mouse_enter_parent = 0;
	var mouse_leave_parent = 0;
	var mouse_over_parent = 0;
	var mouse_out_parent = 0;
	var mouse_enter_child = 0;
	var mouse_leave_child = 0;
	var mouse_over_child = 0;
	var mouse_out_child = 0;
	
	$('#scripture_button_1').on('click', function(){
		
		ta_fontsize();
		
		$('#text_area').text(
				'4조 : 강민희 배진경 박규범'
				+ '\n\n'
				+ '본문 1. 자바스크립트의 this 와    jQuery의 $(this)의 차이점'
				+ '\n\n'
				+ '1-1. 자바스크립트의 this \n'
				+ this
				+ '\n\n'
				+ '1-2. jQuery의 $(this) \n'
				+ $(this)
				+ '\n\n'
				+ '( 콘솔창을 켜둔 상태에서 select박스값를 변경해보세요.)'
			);
	});
	
	$('#mouse_enter_leave_parent').css({'cursor':'pointer'});
	$('#mouse_over_out_parent').css({'cursor':'pointer'});
	
	$('#scripture_button_2').on('click', function(){
		
		ta_fontsize();
		
		$('#text_area').text(
				'4조 : 강민희 배진경 박규범'
				+ '\n\n'
				+ '본문 2. mouseenter / mouseleave   Vs.   mouseover / mouseout'
				+'\n\n(출처: w3schools)'
				+ '\n\n\n'
				+ '( mouseenter + mouseleave 는 한 세트이다.) \n'
				+ '( mouseenter + mouseleave 는 자식 요소에 접근 시에 이벤트가 발생하지 않는다.) \n'
				+ '\n'
				+ '2-1. mouseenter'
				+ '\n'
				+ 'The mouseenter event occurs \n'
				+ 'when the mouse pointer is over (enters) the selected element.'
				+ '\n\n'
				+ '2-2. mouseleave'
				+ '\n'
				+ 'The mouseenter event occurs \n'
				+ 'when the mouse pointer leaves the selected element.'
				+ '\n\n'
				+ '( 각 자식 리스트(child)에 커서를 놓았다가 떼어보세요.)'
				+ '\n\n\n\n\n'
				+ '( mouseover + mouseout 는 한 세트이다.) \n'
				+ '( mouseover + mouseout 는 자식 요소에 접근 시에도 이벤트가 발생한다.)'
				+ '\n\n'
				+ '2-3. mouseover'
				+ '\n'
				+ 'The mouseover event occurs \n'
				+ 'when the mouse pointer is over the selected element.'
				+ '\n\n'
				+ '2-4. mouseout'
				+ '\n'
				+ 'The mouseout event occurs \n'
				+ 'when the mouse pointer leaves the selected element.'
				+ '\n\n'
				+ '( 각 자식 리스트(child)에 커서를 놓았다가 떼어보세요.)'
				
			);
	});
	
	
	
	$('#scripture_button_3').on('click', function(){
		
		ta_fontsize();
		
		$('#text_area').text(
				'4조 : 강민희 배진경 박규범'
				+ '\n\n'
				+ '본문 3. eq()와   nth-child()의  차이'
				+ '\n\n'
				+ '3-1. 위 도표에서 eq(1) 부분에 마우스 커서를 올려보세요. \n'
				+ '(위 3-1 이행시,   실행될 jQuery 명령어는 아래와 같습니다.) \n'
				+ "$('#parent_element_1 :eq(1)').css('background', 'yellow');"
				+ '\n\n'
				+ '3-2. 위 도표에서 nth-child(1) 부분에 마우스 커서를 올려보세요. \n'
				+ '(위 3-2 이행시,   실행될 jQuery 명령어는 아래와 같습니다.) \n'
				+ "$('#parent_element_1:nth-child(1)').css('background', 'yellow');"
			);
	});
	
	
	
	
	$('#scripture_button_4').on('click', function(){
	
		ta_fontsize();
	
		$('#text_area').text(
				'4조 : 강민희 배진경 박규범'
				+ '\n\n'
				+ '본문 4. find()와   filter()의  차이   (출처: w3schools)'
				+ '\n\n'
				+ '4-1. find() \n'
				+ ': The find() method returns \n'
				+ 'descendant elements of the selected element. \n'
				+ ': 선택된 요소의 자손 노드 레벨에서 \n'  
				+ '특정 조건과 맞는 elements 를 찾는다. \n'
				+ '\n\n'
				+ '4-2. filter() \n'
				+ ': The filter() method returns \n'
				+ 'elements that match a certain criteria. \n'
				+ ': 선택된 요소의 노드 레벨에서 \n'   
				+ '특정 조건과 맞는 elements 를 찾는다. \n'				
				
			);
	});
	
	
	
	//find
	$('#thisisfind').hover(function(){
		$('#people').find('.Daniel').addClass('test');
	}, function(){		
		$('#people').find('.Daniel').removeClass('test');
	});
	
	
	//filter
	$('#thisisfilter').hover(function(){
		$('#people').filter('.Daniel').addClass('test');
	}, function(){
		$('#people').filter('.Daniel').removeClass('test');
	});
	
	
	//filter('li .Daniel')
	$('#thisisfilter_li').hover(function(){
		$('#people>li').filter('.Daniel').addClass('test');
	}, function(){
		$('#people>li').filter('.Daniel').removeClass('test');
	});
	
	
	
	
	//mouse_enter_parent_leave 이벤트
	$('#mouse_enter_leave_child').on('mouseenter mouseleave', function(e){
		
		var e_location = $(e.target).attr('id')
		
		if(e.type == "mouseenter"){
			mouse_enter_child++;
			$('#enter_child').text(mouse_enter_child);	
		}else if(e.type == "mouseleave"){
			mouse_leave_child++;
			$('#leave_child').text(mouse_leave_child);
		}		
		console.log(e_location + '   ' + mouse_enter_child + '   ' + mouse_leave_child + '   ' + e);
	});
	
	
	//mouse_over_out 이벤트
	//아래 예문은 이해를 돕기 위해 강제적으로 만든 예문임.
	//이해만을 위한 코딩.
	$('#mouse_over_out_child').on('mouseover mouseout', function(e){
		
		var e_location = $(e.target).attr('id')
		
		if(e.type == "mouseover"){
			mouse_over_child++;
			mouse_over_parent++;
			$('#over_child').text(mouse_over_child);
			$('#over_parent').text(mouse_over_parent);	
		}else if(e.type == "mouseout"){
			mouse_out_child++;
			mouse_out_parent++;
			$('#out_child').text(mouse_out_child);
			$('#out_parent').text(mouse_out_parent);	
		}		
		console.log(e_location + '   ' + mouse_over_parent + '   ' + mouse_out_parent + '   ' + e);
		console.log(e);
	});
	
	
	
	$('#select_box').on('change', function(){
		$('#text_area').text(
			'1-1. 자바스크립트의 this \n'
			+ this
			+ '\n\n'
			+ '1-2. jQuery의 $(this) \n'
			+ $(this)
		);
		
		console.log('1-1. 자바스크립트의 this');
		console.log(this);
		console.log('1-2. jQuery의 $(this)');
		console.log($(this));
		
	});	
	
	
	
	//eq
	$('#eq').hover(function() {
			//alert('eq 이벤트 발생');
			$('#parent_element_1 :eq(1)').addClass('test');
		}, function() {
			$('#parent_element_1 :eq(1)').removeClass('test');
	});
	
	
	//nth_child
	$('#nth_child').hover(function() {
		//alert('eq 이벤트 발생');
		$('#parent_element_1:nth-child(1)').addClass('test');
	}, function() {
		$('#parent_element_1:nth-child(1)').removeClass('test');
	});

	
}); //함수 실행자 부분 - 삭제하지 마세요.



