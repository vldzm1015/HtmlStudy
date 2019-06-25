<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CAFE</title>
 <link rel="stylesheet" type="text/css" href="style.css">
 <script  src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"
		 type="text/javascript"></script>
 <script type="text/javascript">
 $(function(){
    $('.menuCount').each(function(){
      $(this).change(function(){
//          alert($(this).val()); //갯수 구하기
//          var item = $(this).parent().find('span');
//          alert(item.eq(0).text()); // 메뉴명 가져오기
           
         var num = $(this).val(); // 갯수 가져오기
         var item = $(this).parent().find('span').eq(0).text(); // 메뉴명 가져오기
         var price = $(this).parent().find('span').eq(1).text(); // 금액 가져오기
         var ordertotal = num *price; // 주문한 메뉴 총액 구하기
         var sum = 0;
         sum += ordertotal;
        
         
         $('#total').val(sum);
         var deletekey ="<input type='button' class='delete' value='삭제하기'/>"; //삭제버튼 만들기
         //가져온 갯수와 메뉴명을 listTable에 붙이기
         $('#listTable').append('<tr><td>'+ item +'</td><td>' + num + '</td><td>'+ deletekey +'</td></tr>');
         //주문한 메뉴 총액을 titleText에 붙이기
         $('#listtitle>titleText').append('ordertotal');
      }); 
    });
      //동적요소인 삭제버튼에 이벤트 걸기
      $('#listTable').on('click','.delete', function(){ // class명을 따로 부여해서 동적버튼을 찾도록 설정해준다.
         $(this).closest('tr').remove();
      });
      //주문하기 버튼 누르면 이벤트 발생
      $('#btn').click(function(){
         alert('주문완료');
      });

 });
 
 </script>
</head>
<body>


<div id="leftdiv">
<table class="menutbl">
   <tr id="menutitle">
      <th colspan=3 id="titleText">M E N U</th>
   </tr>
   <tr class="menus">
      <td id='menu1' class='menu'>
         <img src="./images/에스프레소.jpg" /> <br/>
         <span id="label1" value = '에스프레소'>에스프레소</span>
         <span id="price1" value = '1000'>1000</span>원
         <br/>
         <select name="menu1Count" id="menu1Count" class='menuCount'>
            <option value='0'>0</option>
            <option value='1'>1</option>
            <option value='2'>2</option>
            <option value='3'>3</option>
            <option value='4'>4</option>
            <option value='5'>5</option>
         </select>
      </td>
      <td id='menu2' class='menu'>
         <img src="./images/아메리카노.jpg" /> <br/>
         <span id="label2" value = '아메리카노'>아메리카노</span> 
         <span id="price2" value = '2000'>2000</span>원<br/>
         <select name="menu2Count" id="menu2Count" class='menuCount'>
            <option value='0'>0</option>
            <option value='1'>1</option>
            <option value='2'>2</option>
            <option value='3'>3</option>
            <option value='4'>4</option>
            <option value='5'>5</option>
         </select>
      </td>
      <td id='menu3' class='menu'>
         <img src="./images/카페라떼.jpg" /> <br/>
         <span id="label3" value = '카페라떼'>카페라떼</span>
         <span id="price3" value = '3000'>3000</span>원<br/>
         <select name="menu3Count" id="menu3Count" class='menuCount'>
            <option value='0'>0</option>
            <option value='1'>1</option>
            <option value='2'>2</option>
            <option value='3'>3</option>
            <option value='4'>4</option>
            <option value='5'>5</option>
         </select>
      </td>
      
   </tr>
   <tr class="menus">
      <td id='menu4' class='menu'>
         <img src="./images/카푸치노.jpg" /> <br/>
         <span id="label4" value = '카푸치노'>카푸치노</span>
         <span id="price4" value = '2000'>2000</span>원
         <br/>
         <select name="menu4Count" id="menu4Count" class='menuCount'>
            <option value='0'>0</option>
            <option value='1'>1</option>
            <option value='2'>2</option>
            <option value='3'>3</option>
            <option value='4'>4</option>
            <option value='5'>5</option>
         </select>
      </td>
      <td id='menu5' class='menu'>
         <img src="./images/돌체라떼.jpg" /> <br/>
         <span id="label5" value='돌체라떼'>돌체라떼</span>
         <span id="price5" value='1000'>1000</span>원<br/>
         <select name="menu5Count" id="menu5Count" class='menuCount'>
            <option value='0'>0</option>
            <option value='1'>1</option>
            <option value='2'>2</option>
            <option value='3'>3</option>
            <option value='4'>4</option>
            <option value='5'>5</option>
         </select>
      </td>
      <td id='menu6' class='menu'>
         <img src="./images/카페모카.jpg" /> <br/>
         <span id="label6" value='카페모카'>카페모카</span>
         <span id="price6" value='1500'>1500</span>원 <br/>
         <select name="menu6Count" id="menu6Count" class='menuCount'>
            <option value='0'>0</option>
            <option value='1'>1</option>
            <option value='2'>2</option>
            <option value='3'>3</option>
            <option value='4'>4</option>
            <option value='5'>5</option>
         </select>
      </td>
   </tr>
   <tr class="menus">
      <td id='menu7' class='menu'>
         <img src="./images/자바칩프라프치노.jpg" /> <br/>
         <span id="label7" value='자바칩 프라프치노'>자바칩 프라프치노</span>
          <span id="price7" value='2000'>2000</span>원 <br/>
         <select name="menu7Count" id="menu7Count" class='menuCount'>
            <option value='0'>0</option>
            <option value='1'>1</option>
            <option value='2'>2</option>
            <option value='3'>3</option>
            <option value='4'>4</option>
            <option value='5'>5</option>
         </select>
      </td>
      <td id='menu8' class='menu'>
         <img src="./images/차이티.jpg" /> <br/>
         <span id="label8" value='차이 티'>차이 티</span>
         <span id="price8" value='1000'>1000</span>원 <br/>
         <select name="menu8Count" id="menu8Count" class='menuCount'>
            <option value='0'>0</option>
            <option value='1'>1</option>
            <option value='2'>2</option>
            <option value='3'>3</option>
            <option value='4'>4</option>
            <option value='5'>5</option>
         </select>
      </td>
      <td id='menu9' class='menu'>
         <img src="./images/그린티.jpg" /> <br/>
         <span id="label9" value='그린 티'>그린 티 </span>
         <span id="price9" value='1500'>1500</span>원 <br/>
         <select name="menu9Count" id="menu9Count" class='menuCount'>
            <option value='0'>0</option>
            <option value='1'>1</option>
            <option value='2'>2</option>
            <option value='3'>3</option>
            <option value='4'>4</option>
            <option value='5'>5</option>
         </select>
      </td>
   </tr>
</table>
</div>

<div id="rightdiv">
<table id="listTable">
   <tr id="listtitle">
      <th colspan=3 id="titleText">주문내역</th>
   </tr>
   <tr id="totallist">
      <td colspan='3'>
         총합 : <input type='text'  id='total'/> 원 
         <input type='button'   value='주문하기'  id='btn'/>
      </td>
   </tr>
   <tr id="listtr">
      <td width="150">목록</td>
      <td width="100">갯수</td>
      <td width="50">삭제</td>
   </tr>
   
</table>
</div>

</body>
</html>