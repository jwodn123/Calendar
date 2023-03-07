<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Calendar</title>

      <style>
          table tr td {
              border: 1px solid;
              width: 90px;
              height: 90px;
              vertical-align: top;
          }

          table {
              border-spacing: 0px;
              border-style: none;
              padding: 0px;
              margin-right: 5px;
          }

          td {
              border-spacing: 0px;
              border-style: none;
              padding: 0px;
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
      let schArr = []

      const table = document.querySelector('table')


      const initMonth = () => {

          curDay = date.getDay() //시작 요일
          curMonth = date.getMonth() //현재 월
          monthWeek = Math.ceil((date.getDay()+monthday[date.getMonth()]) / 7) //월의 주 수
          document.querySelector('#date').innerText = date.getFullYear() + '년 ' + (date.getMonth() + 1) + '월'
          document.querySelectorAll('table tr').forEach((tr, index) => { tr.remove() })

          for(let x = 0; x < monthWeek; x++) {
              const tr = document.createElement("tr")
              table.appendChild(tr) // => <table><tr></tr></table>
              for(let y = 0; y < 7; y++) {
                  const td = document.createElement("td")
                  tr.append(td)
                  if(x == 0 && y < curDay) {
                      arr[y] = null
                  }else if(date.getMonth() != curMonth) {
                      arr[y] = null
                  }else {
                      const index = date.getDate()
                      td.innerText = index
                      date.setDate(date.getDate() + 1)
                      if(date.getFullYear() == curDate.getFullYear() && date.getMonth()+1 == curDate.getMonth()+1 && date.getDate() == curDate.getDate()) {
                          td.style.backgroundColor = '#C85A5A'
                      }
                      if(!null) {
                          td.addEventListener('click', (e) => {

                              let title = prompt('스케줄을 입력하세요', '')
                              let monthIndex = date.getMonth()
                              let monthArr = schArr[monthIndex] || []
                              monthArr.push([title])
                              schArr[monthIndex] = monthArr

                              schArr.forEach((monthschArr, index) => {
                                  if(index == date.getMonth()) {
                                      const li = document.createElement("li")
                                      monthschArr.forEach(sch => {
                                          schList.appendChild(li)
                                          li.innerText = sch.title

                                          let prevLi = null
                                          let prevTd = null

                                          li.addEventListener('click', (e) => {
                                              if(prevLi == null && li.textContent == sch.title) {
                                                  td.style.background = '#A4ECF8'
                                                  prevLi = li.textContent
                                                  prevTd = td.textContent
                                              }

                                              if(prevLi && prevTd) {
                                                  td.style.background = ''
                                              }


                                              console.log(prevLi)
                                              console.log(prevTd)





                                          });
                                      })
}
})
})
}
}
}
}
}

initMonth()

document.getElementById('prev').addEventListener('click', (e) => {
date.setDate(1)
date.setMonth(date.getMonth() - 1 - 1)
initMonth()
})

document.getElementById('next').addEventListener('click', (e) => {
date.setDate(1)
date.setMonth(date.getMonth() + 1 - 1)
initMonth()
})

</script>
</body>
</html>
