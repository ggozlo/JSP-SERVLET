
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="top.jsp" %>
<%@include file="dbcon.jsp" %>
<%@ page import="java.sql.*" %> 

<section>
	<%
		request.setCharacterEncoding("utf-8");
		String sql = "SELECT * FROM SCORE WHERE NAME = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("name"));
		rs = pstmt.executeQuery();
	
		
		if( rs.isBeforeFirst() )
		{
		
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
		
		while(rs.next())
		{
			int	sum = rs.getInt("KOR") + rs.getInt("ENG") + rs.getInt("MAT") ;
			double avg = Math.round(( sum / 3.0) *10 )/10.0 ;
			
			count += 1;
			
			if(count%2 != 0 )
			{
				bg = "#00FF7F";
			}else
			{
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
		<% 
		}
		}
		else
		{
			out.print("없는 자료입니다!");
		}
	
		%>
		
		</table>
		</section>
		<% 
		rs.close();
		pstmt.close();
		con.close();
	%>
</section>

<%@ include file="footer.jsp" %>