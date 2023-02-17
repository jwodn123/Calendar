<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Calendar</title>
  </head>
  <body>




  <script type="text/javascript">

    // 1월, 3월, 5월, 7월, 8월, 10월, 12월 => 31일
    // 4월, 6월, 9월, 11월 => 30일
    // 2월은 28일 또는 29일. 2월의 29일은 4년마다 돌아옴 => 2020년 2월, 2024년 2월, 2028년 2월....

    let year, month, day, dow
    let date = new Date()
    year = date.getFullYear()
    month = date.getMonth() + 1
    day = date.getDate()
    dow = date.getDay() //1=월, 2=화, 3=수, 4=목, 5=금, 6=토, 7일

    console.log(year)
    console.log(month)
    console.log(day)
    console.log(dow)



  </script>
  </body>
</html>
