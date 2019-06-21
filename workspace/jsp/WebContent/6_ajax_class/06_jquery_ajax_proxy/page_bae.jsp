<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
    src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript"
    src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
    $(function() {
        //네이버 버튼이 눌려졌을 때
        $('#naver').click(function() {
            //      $.post('./jsp/proxy_naver.jsp',function(data){
            //      })
            $.ajax({
                type : "post",
                url : './jsp/proxy_naver.jsp',
                success : function(data) {
                    var rank=$('.PM_CL_realtimeKeyword_rolling',data);
                    //var rank = $('.div.special_bg', data);
                    $('#result').empty();
                    $('#result').append(rank);
                }
            })
        });
        $('#melon').click(function() {
            //      $.post('./jsp/proxy_naver.jsp',function(data){
            //      })
            //  $.ajax({
            //      type : "post",
            //      url:'./jsp/proxy_melon.jsp' ,
            //      success : function(data){
            //          //var rank=$('.PM_CL_realtimeKeyword_rolling',data);
            //          var rank=$('.chart',data);
            //          $('#result').empty();
            //          $('#result').append(rank);
            //      }
            //})
            $.post('./jsp/proxy_melon.jsp', function(data) {
                //var songchart = $('.chart',data); // $('a',b) b에서 a를 찾겠다. b를 입력하지 않으면, 현재페이지에서 찾음. 
                var songchart = $('.typeRealtime >ul >li', data);
                $('#result').empty();
                songchart.each(function() {
                    var rank = $('.rank', this).text();
                    var title = $('.rank_info > p > a', this).text();
                    var img = $('.mlog', this).html(); // 그림가져와서 html기능하고 싶으면 html을 가져와야함.
                    $('#result').append(rank + "위 " + img + title + "<br/>");
                });
            });
        });
        $('#daum').click(function() {
            $.ajax({
                type : "post",
                url : './jsp/proxy_daum.jsp',
                success : function(data) {
                    //var rank=$('.realtime_part li ',data);
                    var rank = $('.hotissue_mini ', data);
                    $('#result').empty();
                    $('#result').append(rank);
                }
            })
        });
        $('#kma').click(
                function() {
                    $.ajax({
                        type : "get",
                        url : './jsp/proxy_kma.jsp',
                        success : function(data) {
                            var region = $('category', data).text();
                            var data = $('data', data);
                            alert($(data[5]).html());
                            $('#result').empty();
                            
                            var list =new Array();
                            
                            
                            data.each(function() {
                                var hour = $(this).find('hour').text();
                                var temp =parseInt($(this).find('temp').text());
                                var day = $(this).find('day').text();
                                 var dt = new Date();
                                 var date = dt.getDate();
                                 var day_hour="";
                                if (day==0) {
                                    day_hour = date + "일"+hour+"시";
                                }else{
                                    day_hour = (date+1) + "일"+hour+"시";
                                }
                                
                                var sub_list =[day_hour,temp];
                                
                                list.push(sub_list);
                            });
                            
                            google.charts.load('current', {'packages' : [ 'line' ]});
                            google.charts.setOnLoadCallback(drawVisualization);
                            
                            
                            function drawVisualization(){
                                var data = new google.visualization.DataTable();
                                data.addColumn('string','hour');
                                data.addColumn('number','temperature');
                                data.addRows(list);
                            
                                
                                var options = {
                                            chart: {
                                              title: 'temp',
                                              subtitle: 'temp'
                                            },
                                            width: 900,
                                            height: 500
                                          };
                                var chart = new google.charts.Line(document.getElementById('result'));
                                chart.draw(data, google.charts.Line.convertOptions(options));
                            }
                            
                        },
                        error: function(e){
                            alert("에러"+e);
                        }
                    })
                });
    });
</script>
</head>
<body>
    <h1>선택</h1>
    <button id='naver'>네이버</button>
    <button id='melon'>멜론</button>
    <button id='daum'>다음</button>
    <button id='kma'>날씨</button>
    <div id='result'></div>
</body>
</html>