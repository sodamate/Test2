<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="util.DBUtil" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>站点查询</title>
</head>
<body style="text-align:center" vertical-align="middle">
查询结果
<p style="text-align: center; color: black; font-family: 宋体; font-size: 20px">
<table border="1" align="center">
    <tr>
        <td align="center" width=10%>线路</td>
        <td align="center" width=10%>站点</td>
    </tr>
    <%
        String station_name = request.getParameter("station_name");
        String str = "";
        Connection connection = DBUtil.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        ArrayList<String> list = new ArrayList<String>();
        int i = 0;
        try {
            String sql = "select * from bj_subway ";
            preparedStatement = connection.prepareStatement(sql);
            rs = preparedStatement.executeQuery();
            while (rs.next()) {

                if (station_name.equals(rs.getObject("station_name"))) {
                    if (!list.contains((String) rs.getObject(3))) {
                        list.add((String) rs.getObject(3));
                        i++;
    %>
    <tr>
        <td align="center"><%=rs.getObject("line_name") %></td>
        <td align="center"><%=rs.getObject("station_name") %></td>
    </tr>
    <%
                    }
                }
            }
            if (i == 0) {
                out.print("<script language='javaScript'> alert('没有查询到有关信息'); window.history.back(-1); </script>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {

        }
    %>

</table>
<script>
    function del() {
        var r = confirm("确定要删除吗？")
        if (r == true) {
            return true;
        } else {
            return false;
        }
    }
</script>

<p style="text-align:center;color: black; font-family: 宋体; font-size: 20px">
    <br> <input type="button" value="返回菜单" onclick="location.href='index.jsp'"/> <br>
</p>
</body>
</html>