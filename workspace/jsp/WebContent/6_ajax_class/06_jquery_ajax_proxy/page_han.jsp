<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>page.jsp</title>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        $(function () {
            
            //$('#listTable').css('display','none');
            $('#listTable').hide();
            $("#naver").click(function () {
                $.ajax({
                    type: 'post',
                    url: './jsp/proxy_naver.jsp',
                    success: function (data) {
                        var rank = $(".PM_CL_realtimeKeyword_rolling", data);
                        $('#result').empty();
                        $('#result').append(rank);
                    },
                    error: function (e) {
                        alert(e);
                    }
                }); // ajax
            }); // naver click
            $("#melon").click(function () {
                $.post('./jsp/proxy_melon.jsp', function (data) {
                    var songchart = $('.typeRealtime > ul > li', data);
                    $('#result').empty();
                    songchart.each(function () {
                        var rank = $('.rank', this).text();
                        var title = $('.song', this).text();
                        var img = $('.mlog', this).html();
                        $('#result').append(rank + "위" + "<br>");
                        $('#result').append(title + "/" + "<br>");
                        $('#result').append(img + "/" + "<br>");
                    }) // each
                }) // post
            }); // melon click
            $('#daum').click(function () {
                $.post('./jsp/proxy_daum.jsp', function (data) {
                    var rank = $('.hotissue_mini', data);
                    $('#result').empty();
                    $('#result').append(rank);
                });// end of post
            });   // end of click daum
            $("#kma").click(function () {
                var arrList = new Array();
                $('#result').empty();
                $.ajax({
                    type: 'get',
                    url: './jsp/proxy_kma.jsp',
                    success: function (content) {
                        $("#listTable").find("tr:not(:eq(0))").remove();
                        var data = $('data', content);
                        data.each(function () {
                            var hour = $(this).find('hour').html();
                            var temp = $(this).find('temp').html();
                            var table = "";
                            table += "<tr>";
                            table += "<td>" + hour + "</td>";
                            table += "<td>" + temp + "</td>";
                            table += "</tr>";
                            $("#listTable").append(table);
                            var arrListCon = new Array(hour, parseInt(temp));
                            arrList.push(arrListCon);
                            $('#listTable').show();
                        });
                        google.charts.load('current', {packages: ['corechart', 'line']});
                        google.charts.setOnLoadCallback(drawBasic);
                        function drawBasic() {
                            var data = new google.visualization.DataTable();
                            data.addColumn('string', 'hour');
                            data.addColumn('number', 'temp');
                            data.addRows(arrList);
                            var options = {
                                hAxis: {
                                    title: '날씨'
                                },
                                vAxis: {
                                    title: '온도'
                                }
                            };
                            var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
                            chart.draw(data, options);
                        }
                    }
                }) // ajax
          
            }) // kma click
        }); // function
    </script>
</head>
<body>
<h1>선택</h1>
<button id="naver">네이버</button>
<button id="melon">멜론</button>
<button id="daum">다음</button>
<button id="kma">날씨</button>
<div id="result"></div>
<div id="chart_div"></div>
<table border=1 id="listTable">
    <tr>
        <th width="80" align="center">시간</th>
        <th width="80" align="center">온도</th>
    </tr>
</table>
</body>
</html> 