<%@page import="java.sql.DriverManager"%>
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
				String id, pw1,pw2, name,email,address,tel ;
				boolean computer = false, sports = false, shopping = false, movie = false;
				String gender, text;
			%>
			
			<%
				request.setCharacterEncoding("utf-8");
				id = request.getParameter("id");
				name = request.getParameter("name");
				pw1 = request.getParameter("pw1");
				pw2 = request.getParameter("pw2");
				gender = request.getParameter("gender");
				email = request.getParameter("email");
				tel = request.getParameter("tel");
				address = request.getParameter("address");
				String [] hobbies = request.getParameterValues("hobby");
				for(String h  :hobbies)
				{
					switch(h)
					{
						case "computer" :
						{
							computer = true;
							break;
						}
						case "sports" :
						{
							sports = true;
							break;
						}
						case "shopping" :
						{
							shopping = true;
							break;
						}
						case "movie" :
						{
							movie = true;
							break;
						}
						default :
							break;
					}
				}
				
			%>
			<h2>♣FROM에 입력된 개인정보를 POST방식으로 웹 브라우저에 출력♣</h2>
			<hr>
			<h3>
			<ul type="square">
				<li>아이디.........<%=id  %></li>
				<li>성명..........<%=name  %></li>
				<li>비밀번호........<%=pw1  %></li>
				<li>비밀번호 확인.....<%=pw2  %></li>
				<li>성별..........<% if(gender.equals("male"))out.print("남자"); else out.print("여자");  %></li>
				<li>이메일.........<%=email  %></li>
				<li>핸드폰.........<%=tel  %></li>
				<li>주소..........<%=address  %></li>
				<li>컴퓨터.........<% if(computer == true) out.print("yes");  %></li>
				<li>스포츠.........<% if(sports == true) out.print("yes");		  %></li>
				<li>쇼핑..........<% if(shopping == true) out.print("yes");		  %></li>
				<li>영화감상........<% if(movie == true) out.print("yes"); %></li>
				<li>남기고 싶은 글....<%=text %></li>
				<li>숨긴내용........회원 등록 서식</li>
			</ul>
			</h3>
			<hr>
			<h3>회원등록에 기입한 내용을 모두 출력하였습니다...</h3>
			
			<%
				Connection con;
				PreparedStatement psmt;
				
				Class.forName("oracle.jdbc.driver.OracleDriver");
				con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "ggozlo", "ggozlo");
				String sql = "INSERT INTO REG VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
				psmt = con.prepareStatement(sql);
				psmt.setString(1, id);
				psmt.setString(2, pw1);
				psmt.setString(3, name);
				psmt.setString(4, tel);
				psmt.setString(5, gender);
				psmt.setString(6, email);
				psmt.setString(7, address);
				psmt.setInt(8, computer?1:0 );
				psmt.setInt(9, sports?1:0 );
				psmt.setInt(10, shopping?1:0 );
				psmt.setInt(11, movie?1:0 );
				psmt.setString(12, text);
				int n = psmt.executeUpdate();
				if(n==1)
				{
					out.print("성공");
				}
			%>
		</body>
	</html>