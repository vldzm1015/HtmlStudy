window.onload = function(){

		//var frm = document.getElementById('frm');
		//var inputs = document.getElementsByTagName('input');
		
		var frm = document.querySelector('#frm');
		var inputs = document.querySelectorAll("input");
		
//		frm.onsubmit = function(e){
//			e.preventDefault();
//			e.stopPropagation();
		frm.btn.onclick = function(){
			var agree = frm.agree;
			//alert(agree.checked);
			if(!agree.checked){
				alert('반드시 확인하셔야 합니다.');
				return;
			}
		//별칭이 ['babo','geni','idiot','gdb']
			var nick = ['babo','geni','idiot','gdb'];
			var nickname = frm.nickname;
			if (!nick.includes(frm.nickname.value)) {
				alert('nickname (babo, geni, idiot, gdb) 중에 골라봐');
				return;
			}
			
			
			
			
			
			frm.submit();
		}

	}