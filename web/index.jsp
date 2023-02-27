<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Calendar</title>

      <style>
          table tr td {
              border: 1px solid;
          }
      </style>
  </head>
  <body>

  <button id="prev"><</button>
  <button id="next">></button>

  <table>
      <caption id="date"></caption>
  </table>

  <script>
      let date = new Date(new Date().getFullYear(), new Date().getMonth(), 1) //월의 시작 일
      let curMonth = date.getMonth() //현재 월
      let curDay = date.getDay() //시작 요일
      let monthday = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
      let curMonthLastdate = monthday[date.getMonth()]
      let monthWeek = Math.ceil((curDay+curMonthLastdate)/7) //월의 주 수
      let arr = [null, null, null, null, null, null, null]

      const table = document.querySelector('table')


      const initMonth = () => {

          curDay = date.getDay() //시작 요일
          curMonth = date.getMonth() //현재 월
          document.querySelector('#date').innerText = date.getFullYear() + '년 ' + (date.getMonth() + 1) + '월'
          document.querySelectorAll('table tr').forEach((tr, index) => { tr.remove() })

          for(let x = 0; x <= monthWeek; x++) {

              const tr = document.createElement("tr")
              table.appendChild(tr) // => <table><tr></tr></table>


              for(let y = 0; y < 7; y++) {
                  const td = document.createElement("td")
                  tr.append(td)
                  //첫째주 이면서 y가 curDay(시작 요일)보다 작을 때
                  if(x == 0 && y < curDay) {
                      arr[y] = null
                  }else if(date.getMonth() != curMonth) {
                      arr[y] = null
                  }else {
                      const index = date.getDate()
                      td.innerText = index // => <tr><td></td></tr>
                      date.setDate(date.getDate() + 1) // => ??
                  }
              }
          }
      }

      initMonth()

      document.getElementById('prev').addEventListener('click', (e) => {
          date.setDate(1)
          console.log(date.getMonth())
          date.setMonth(date.getMonth() - 1 - 1)
          console.log(date.getMonth())
          initMonth()
      })

      document.getElementById('next').addEventListener('click', (e) => {
          date.setDate(1)
          console.log(date.getMonth())
          date.setMonth(date.getMonth() + 1 - 1)
          console.log(date.getMonth())
          initMonth()
      })

  </script>
  </body>
</html>
