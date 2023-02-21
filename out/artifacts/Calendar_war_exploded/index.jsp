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
          <td align="center"><font color ="#ff0000">일</td>
          <td align="center">월</td>
          <td align="center">화</td>
          <td align="center">수</td>
          <td align="center">목</td>
          <td align="center">금</td>
          <td align="center"><font color ="#0040ff">토</td>
      </tr>
      <tr>
          <td align="center" id="jdates"></td>
      </tr>

  </table>




  <script type="text/javascript">

    // 1월, 3월, 5월, 7월, 8월, 10월, 12월 => 31일
    // 4월, 6월, 9월, 11월 => 30일
    // 2월은 28일 또는 29일. 2월의 29일은 4년마다 돌아옴 => 2020년 2월, 2024년 2월, 2028년 2월....

    let curyear, curmonth, curdate, curday
    let date = new Date()
    curyear = date.getFullYear() //현재 연도
    curmonth = date.getMonth() + 1 //현재 월
    curdate = date.getDate() //현재 일
    curday = date.getDay() //현재 요일(1=월, 2=화, 3=수, 4=목, 5=금, 6=토, 7=일)

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


    let days = new Array(7) //요일에 대한 배열, 일(0) 월(1) 화(2) 수(3) 목(4) 금(5) 토(6)
    let dates = new Array(curMonthLastdate) //일자에 대한 배열
    let jdates = new Array()

    for(let i = 0; i < monthWeek; i++) { //달의 주 수만큰 반복한다.
        for(let a = 0; a <= dates.length; a++) {
            if(a < curMonthFirstday) {
                dates[a] = 0
            }else if(a == curMonthFirstday) {
                dates[a] = 1
            }else if(a > curMonthFirstday) {
                dates[a] = dates[a-1] + 1
            }
            document.getElementById('jdates').innerText = dates
        }
        document.write('<br>')
    }












  </script>
  </body>
</html>
