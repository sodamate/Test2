<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>线路查询</title>
</head>
<body style="text-align:center" vertical-align="middle">
查询结果
<p>
    <jsp:useBean id="util" class="util.DBUtil" scope="page"/>
        <%
  String line_name=(String)request.getParameter("line_name");
  if(line_name==""){
      out.print("<script language='javaScript'> alert('输入为空'); window.history.back(-1); </script>");
  }
  else
  {
      %>
<table border="1" align="center" vertical-align="middle">
    <tr style="text-align:center;color: black; font-family: 宋体; font-size: 20px">
        <td align="center" width=20%>车站名称</td>
    </tr>
    <%
        int i = 0;
        Connection connection = util.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        try {
            String sql = " select distinct station_name from bj_subway where line_name like ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,  line_name+ "%");
            rs = preparedStatement.executeQuery();
            while (rs.next()) {
                i++;
    %>
    <tr>
        <td align="center"><%=rs.getObject("station_name") %></td>
    </tr>
    <%
                }
                if (i == 0) {
                    out.print("<script language='javaScript'> alert('没有查询到有关信息'); window.history.back(-1); </script>");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                util.close(rs);
                util.close(preparedStatement);
                util.close(connection);
            }
        }
    %>
</table>

<p style="text-align:center;color: black; font-family: 宋体; font-size: 20px">
    <br> <input type="button" value="返回菜单" onclick="location.href='index.jsp'"/> <br>
</p>
</body>
</html>
