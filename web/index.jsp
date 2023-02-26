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
          <td align="center" id="sun"></td>
          <td align="center" id="mon"></td>
          <td align="center" id="tue"></td>
          <td align="center" id="wed"></td>
          <td align="center" id="thu"></td>
          <td align="center" id="fri"></td>
          <td align="center" id="sat"></td>
      </tr>
<%--<tr>
          <td align="center" id="sun2"></td>
          <td align="center" id="mon2"></td>
          <td align="center" id="tue2"></td>
          <td align="center" id="wed2"></td>
          <td align="center" id="thu2"></td>
          <td align="center" id="fri"></td>
          <td align="center" id="sat"></td>
      </tr>
<tr>
          <td align="center" id="sun"></td>
          <td align="center" id="mon"></td>
          <td align="center" id="tue"></td>
          <td align="center" id="wed"></td>
          <td align="center" id="thu"></td>
          <td align="center" id="fri"></td>
          <td align="center" id="sat"></td>
      </tr>
<tr>
          <td align="center" id="sun"></td>
          <td align="center" id="mon"></td>
          <td align="center" id="tue"></td>
          <td align="center" id="wed"></td>
          <td align="center" id="thu"></td>
          <td align="center" id="fri"></td>
          <td align="center" id="sat"></td>
      </tr>
<tr>
          <td align="center" id="sun"></td>
          <td align="center" id="mon"></td>
          <td align="center" id="tue"></td>
          <td align="center" id="wed"></td>
          <td align="center" id="thu"></td>
          <td align="center" id="fri"></td>
          <td align="center" id="sat"></td>
      </tr>
<tr>
          <td align="center" id="sun"></td>
          <td align="center" id="mon"></td>
          <td align="center" id="tue"></td>
          <td align="center" id="wed"></td>
          <td align="center" id="thu"></td>
          <td align="center" id="fri"></td>
          <td align="center" id="sat"></td>
      </tr>--%>

  </table>


  <script type="text/javascript">
    /*  let selectedMonth = new Date(new Date().getFullYear(), new Date().getMonth(), 1, 0, 0, 0)
const grid = [
    [null, null, null, null, null, null, null],
    [null, null, null, null, null, null, null],
    [null, null, null, null, null, null, null],
    [null, null, null, null, null, null, null],
    [null, null, null, null, null, null, null],
    [null, null, null, null, null, null, null]
]

let date = 1;
grid.forEach((week, weeki) => {
    week.forEach((day, dayi) => {
        if( weeki === 0 && dayi < selectedMonth.getDay() ) { return }
        grid[weeki][dayi] = date
    })
})
console.log(date)*/


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


    let calendarPost = 0 //일자의 위치
    let calendarDate = 0 //달의 일 수
    let jdates = new Array(monthWeek)//달의 일수를 담을 배열
    for (let i = 0; i < jdates.length; i++) {
        jdates[i] = new Array(7);
    }

    for(let x = 0; x < monthWeek; x++) { //달의 주 수만큼 반복
        for(let y = 0; y < 7; y++) { //일~토 까지 반복
            if(curMonthFirstday > calendarPost) {
                jdates[x][y] = ''
            }else if(curMonthFirstday <= calendarPost && curMonthLastdate > calendarDate) {
                calendarDate++
                jdates[x][y] = calendarDate
            }else if (curMonthLastdate < calendarDate) {
                jdates[x][y] = ''
            }
            calendarPost++
        }
    }

    let cellIndex = 0;

    for (let a = 0; a < monthWeek; a++) {
        let aCell = document.getElementById('sun');
        let bCell = document.getElementById('mon');
        let cCell = document.getElementById('tue');
        let dCell = document.getElementById('wed');
        let eCell = document.getElementById('thu');
        let fCell = document.getElementById('fri');
        let gCell = document.getElementById('sat');
        let cells = [aCell, bCell, cCell, dCell, eCell, fCell, gCell];
        for (let b = 0; b < 7; b++) {
            let cell = cells[cellIndex];
            let caldate = jdates[a][b];
            cell.innerText = caldate;
            cellIndex++;
        }
    }









  </script>
  </body>
</html>
