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

    let curyear, curmonth, curday, curdow
    let date = new Date()
    curyear = date.getFullYear()
    curmonth = date.getMonth() + 1
    curday = date.getDate()
    curdow = date.getDay() //1=월, 2=화, 3=수, 4=목, 5=금, 6=토, 7=일

    let monthday = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    if(curmonth == 2) { // 2월 윤년
        if(curyear % 4 == 0) {
            monthday[1] = 29
        }else if(curyear % 4 != 0) {
            monthday[1] = 28
        }
    }

    let curMonthLastday = monthday[date.getMonth()]
    console.log(curMonthLastday)


    document.getElementById('curYM').innerText = curyear + "년 " + curmonth + "월"




  </script>
  </body>
</html>
