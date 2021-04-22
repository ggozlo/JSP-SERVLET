<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
<%@ include file="dbcon.jsp" %>
<%@ page import="java.sql.*" %>

<section>
<% 
request.setCharacterEncoding("utf-8");
String sql = "SELECT * FROM SCORE ORDER BY KOR+ENG+MAT DESC";
       pstmt = con.prepareStatement(sql);
       rs = pstmt.executeQuery();

/* out.println("Connection : " + con);
if(con != null)	{	
	out.println("Database Connect : [ " + " <b>success</b> ]<br>");
}else{	
	out.println("Database Connect : [ " + " <b>fail</b> ]<br>");
}; */

%>
<br><br>
<font size=4 align="center"><u>[ 성적 확인 ]</u></font>
<br><br>
<table border=1 align="center">
	<tr bgcolor="#00BFFF">
	 <td>이름 </td>
	<td>국어 </td> <td>영어 </td> 
	<td>수학 </td> 
	<td>합계 </td> <td>평균 </td> 
	</tr>
<%	
int count=0;
String bg = null;

while(rs.next()){
	int	sum = rs.getInt("KOR") + rs.getInt("ENG") + rs.getInt("MAT") ;
	double avg = Math.round(( sum / 3.0) *10 )/10.0 ;
	
	count += 1;
	
	if(count%2 != 0 ){
		bg = "#00FF7F";
	}else{
		bg = "#ADFF2F";
	}
	
%>    
<tr bgcolor=<%=bg%>>
  <td><%=rs.getString("name")%></td>
<td><%=rs.getString("kor")%></td> <td><%=rs.getString("eng")%></td> 
<td><%=rs.getString("mat")%></td>
<td><%=sum%></td>
<td><a href="delete.jsp?name=<%=rs.getString("name")%>"><%=avg%></a></td>
</tr>
<% } %>

</table>
</section>
<% 
rs.close();
pstmt.close();
con.close();
%>

<%@ include file="footer.jsp" %>