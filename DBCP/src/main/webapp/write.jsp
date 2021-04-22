<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	 <%!
      DataSource ds;
      Connection con;
      PreparedStatement psmt;
      ResultSet res;
      //String driver = "oracle.jdbc.driver.OracleDriver";
      //String url = "jdbc:oracle:thin:@localhost:1521:xe";
      String name;
      int kor, eng, mat;
   %>
   <%
      request.setCharacterEncoding("utf-8");
      //Class.forName(driver);
      //con = DriverManager.getConnection(url, "tjsw", "tj311");
      Context ct = new InitialContext();
      ds = (DataSource) ct.lookup("java:comp/env/jdbc/Oracle11g");
      con = ds.getConnection();
      
      name = request.getParameter("name");
      kor = Integer.parseInt(request.getParameter("kor"));
      eng = Integer.parseInt(request.getParameter("eng"));
      mat = Integer.parseInt(request.getParameter("mat"));
      
      String sql = "insert into score(name,kor,eng,mat) values(?,?,?,?)";
      psmt = con.prepareStatement(sql);
      psmt.setString(1, name);
      psmt.setInt(2, kor);
      psmt.setInt(3, eng);
      psmt.setInt(4, mat);
      
      int q = psmt.executeUpdate();
      
      con.commit();
      psmt.close();
      con.close();
      if (q == 1) {
         out.println("DB연결 성공!!");
         
      }
      else {
         out.println("DB연결 실패...");
         
      }
   %>

</body>
</html>