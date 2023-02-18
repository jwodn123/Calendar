<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Calendar</title>
  </head>
  <body>

  <div>
      <div>
          <span id="curYM"></span>
      </div>

      <div>
          <span>일 월 화 수 목 금 토</span>
          <ul id="dayofweek"></ul>
      </div>

  </div>




  <script type="text/javascript">

    // 1월, 3월, 5월, 7월, 8월, 10월, 12월 => 31일
    // 4월, 6월, 9월, 11월 => 30일
    // 2월은 28일 또는 29일. 2월의 29일은 4년마다 돌아옴 => 2020년 2월, 2024년 2월, 2028년 2월....

    let year, month, day, dow
    let date = new Date()
    year = date.getFullYear()
    month = date.getMonth() + 1
    day = date.getDate()
    dow = date.getDay() //1=월, 2=화, 3=수, 4=목, 5=금, 6=토, 7=일

    let i
    let arrday = new Array()
    arrday = [1, 2, 3]
    console.log(arrday)
    document.getElementById('dayofweek').innerText = arrday

    if(month) {
        if(month == 1, 3, 5, 7, 8, 10, 12) { // 31일 까지
            for(i = 1; i <= 31; i++) {
               arrday = i
               console.log(arrday)
            }
            document.getElementById('dayofweek').innerText = arrday
        }else if(month == 4, 6, 9, 11) { // 30일 까지
            for(i = 1; i <= 30; i++) {
                arrday = i
            }
            document.getElementById('dayofweek').innerText = arrday
        }else if(month == 2 && year % 4 == 0) { // 29일 까지
            for(i = 1; i <= 29; i++) {
                arrday = i
            }
            document.getElementById('dayofweek').innerText = arrday
        }else if(month == 2 && year % 4 != 0) { // 28일 까지
            for(i = 1; i <= 28; i++) {
                arrday = i
            }
            document.getElementById('dayofweek').innerText = arrday
        }
    }




    document.getElementById('curYM').innerText = year + "년 " + month + "월"

    console.log(year)
    console.log(month)
    console.log(day)
    console.log(dow)



  </script>
  </body>
</html>
