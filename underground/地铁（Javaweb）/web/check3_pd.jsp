<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="util.DBUtil" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>起点-终点查询</title>
</head>
<body style="text-align:center" vertical-align="middle">
查询结果
<p style="text-align: center; color: black; font-family: 宋体; font-size: 20px">
<table border="1" style="align:center;">
    <tr>
        <td align="center" width=1%>经历站点个数</td>
        <td align="center" width=10%>路径</td>
    </tr>
    <%
        String start_station = request.getParameter("start_station");
        String stop_station = request.getParameter("stop_station");
        String str = "";
        int number = 1;
        Connection connection = DBUtil.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        ArrayList<String> list = new ArrayList<String>();
        int i = 0;

        String sql = "WITH RECURSIVE transfer (start_station, stop_station, stops, path) AS (" +
                "  SELECT station_name, next_station, 1, CAST(CONCAT(line_name,station_name , '->', line_name,next_station) AS CHAR(1000))" +
                "    FROM bj_subway WHERE station_name = ?" +
                "   UNION ALL" +
                "  SELECT p.start_station, e.next_station, stops + 1, CONCAT(p.path, '->', e.line_name, e.next_station)" +
                "    FROM transfer p" +
                "    JOIN bj_subway e" +
                "      ON p.stop_station = e.station_name AND (INSTR(p.path, e.next_station) = 0)" +
                ")" +
                "SELECT * FROM transfer WHERE stop_station = ?;";
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, start_station);
        preparedStatement.setString(2, stop_station);
        rs = preparedStatement.executeQuery();
        try {
            while (rs.next()) {
                if (start_station.equals(rs.getObject("start_station")) && stop_station.equals(rs.getObject("stop_station")))
                    i++;
    %>
    <tr>
        <td align="center"><%=rs.getObject("stops") %>
        </td>
        <td align="center"><%=rs.getObject("path") %>
        </td>
    </tr>
    <%
                if (i == 0) {
                    out.print("<script language='javaScript'> alert('没有查询到有关信息'); window.history.back(-1); </script>");
                }
            break;
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