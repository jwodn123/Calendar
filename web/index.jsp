<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Calendar</title>
  </head>
  <body>

  <table id="calendar" align="center">
      <tr>
          <td><label onclick="prevCalendar()"><</label></td>
          <td align="center" id="curYM" colspan="5"></td>
          <td><label onclick="nextCalendar()">></label></td>
      </tr>
      <tr>
          <td align="center">일</td>
          <td align="center">월</td>
          <td align="center">화</td>
          <td align="center">수</td>
          <td align="center">목</td>
          <td align="center">금</td>
          <td align="center">토</td>
      </tr>
      <tr>
          <td align="center" id="a"></td>
          <td align="center" id="b"></td>
          <td align="center" id="c"></td>
          <td align="center" id="d"></td>
          <td align="center" id="e"></td>
          <td align="center" id="f"></td>
          <td align="center" id="g"></td>
      </tr>
  </table>

  <div align="center" id="dates"></div>








  <script type="text/javascript">

    // 1월, 3월, 5월, 7월, 8월, 10월, 12월 => 31일
    // 4월, 6월, 9월, 11월 => 30일
    // 2월은 28일 또는 29일. 2월의 29일은 4년마다 돌아옴 => 2020년 2월, 2024년 2월, 2028년 2월....


    let date = new Date()
    let curyear = date.getFullYear() //현재 연도
    let curmonth = date.getMonth() + 1 //현재 월
    let curdate = date.getDate() //현재 일
    let curday = date.getDay() //현재 요일(1=월, 2=화, 3=수, 4=목, 5=금, 6=토, 7=일)
    let monthday = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31] //각 월의 마지막 일

    if(curmonth == 2) { // 2월 윤년
        if(curyear % 4 == 0) {
            monthday[1] = 29
        }else if(curyear % 4 != 0) {
            monthday[1] = 28
        }
    }

    let curMonthLastdate = monthday[date.getMonth()] //달의 마지막 일
    let monthStartday = new Date(curyear, date.getMonth(), 1)
    let curMonthFirstday = monthStartday.getDay(); //달의 시작 요일
    let monthWeek = Math.ceil((curMonthFirstday+curMonthLastdate) / 7) //달의 주 수, Math.ceil => 소주점 올림

    document.getElementById('curYM').innerText = curyear + "년 " + curmonth + "월"




    let calendarP = 0 //달의 위치
    let calendarDate = 0 //달의 일 수
    let i = 0
    let jdates = new Array() //달의 일수를 담을 배열

    for(let x = 0; x < monthWeek; x++) {
        for(let y = 0; y < 7; y++) {
            if(curMonthFirstday <= calendarP && curMonthLastdate > calendarDate) {
                calendarDate++
                jdates[i] = calendarDate
                i++
            }
            calendarP++
        }
        document.getElementById('dates').innerText = jdates
    }

  </script>
  </body>
</html>
