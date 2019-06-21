<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	
	
	//네이버 버튼이 눌렸을 때
	$('#naver').click(function(){
		
		// result 값 제거하기
		$('#result').empty();
	
		$.ajax({
			type : 'post',
			url : './jsp/proxy_naver.jsp',
			success : function(data){
				var rank =  $(".PM_CL_realtimeKeyword_rolling", data);

				
				$('#result').append(rank);
			},
			error: function (e) {
                alert(e);
            }

		});	// ajax
		
	});	// click naver
	
	
	
	
	//melon 버튼이 눌렸을 때 //축약형
	$('#melon').click(function(){
		
		// result 값 제거하기
		$('#result').empty();
		
		
		$.post('./jsp/proxy_melon.jsp',function(data){
			var songchart = $('.typeRealtime > ul > li',data);
			
	
			songchart.each(function(){
				var rank = $('.rank',this).text();
				var song = $('.song',this).text();
				var mlog = $('.mlog',this).html();
				
				
				$('#result').append(rank+ "위" + song+ mlog+"<br/>");
				
			});		// songchart	
		}); 	// post	
	});	// click melon
	
	
	
	// daum 버튼이 눌렸을 때
	$('#daum').click(function(){
		
		// result 값 제거하기
		$('#result').empty();
		
		
		$.post('./jsp/proxy_daum.jsp',function(data){
			
			var rank = $('.hotissue_mini',data);
			
			
			$('#result').append(rank);
						
		});// post
				
	});	// click daum
	
	
	
	// weather 버튼이 눌렸을 때 
	$('#weather').click(function(){
		
		// result 값 제거하기
		$('#result').empty();
		
		$.ajax({
			type : 'get',
			url : './jsp/proxy_weather.jsp',
			success : function(content){   // callback 함수
				
				
				var data = $('data',content);
			
				data.each(function(){
				var hour =  $(this).find('hour').text();
				var temp =  $(this).find('temp').text();
			
				 $('#result').append("시간은 : " + hour + "<br>");
                 $('#result').append("온도는 : " + temp + "<br><br>");
            
			
				
				// 지역 검색확인
// 				alert($('category',content).text());
				// 정보 검색확인
// 				alert($('data',content).text() +$('hour',content).text() );
				
			
				});	//data	
			} //success	
		}); //ajax
	}); //click weather
}); //function
</script>
</head>
<body>
<h1>선택</h1>
<button id='naver'>naver</button>
<button id='daum'>daum</button>
<button id='weather'>weather</button>
<button id='melon'>melon</button>
<div id='result'></div>
</body>
</html>