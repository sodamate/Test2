<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>起点——终点查询</title>
</head>
<body>
<h2 align="center">
    起点——终点查询
</h2>
<form id="1" action="check3_pd.jsp" method="get">
    <p style="text-align: center; color: black; font-family: 宋体; font-size: 20px">

        起始站:
        <label>
            <input type="text" name="start_station" size="10"/>
        </label>
        <br><br>

        终点站:
        <label>
            <input type="text" name="stop_station" size="10"/>
        </label>
        <br><br>

        <input type="submit" value="提交"/>
        <input type="reset" value="重置"/>
        <br><br> <input type="button" value="返回菜单" onclick="location.href='index.jsp'"/> <br>
    </p>
</form>

</body>
</html>