<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>线路查询</title>
</head>
<body>
<h2 align="center">
    线路查询
</h2>
<form action="check1_pd.jsp" method="get">
    <p style="text-align:center;color: black; font-family: 宋体; font-size: 20px">
        输入要查询线路的数字：
        <br> <input type="text" name="line_name"/> <br>
        <br><input type="submit" value="提交"/>
        <input type="reset" value="重置"/> <br>
        <br> <input type="button" value="返回菜单" onclick="location.href='index.jsp'"/> <br>
    </p>
</form>

</body>
</html>
