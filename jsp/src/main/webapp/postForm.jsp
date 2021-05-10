

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="boardtop.jsp" %>
<section>
			<form action="write.do" method="post" enctype="multipart/form-data">
			<table>
				<caption>글쓰기</caption>
				
				<tr>
					<td>작성자</td>
					<td><input type="text" name="bname" value="${name}" ></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="btitle" ></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea rows="10" cols="30" name="bcontent"></textarea></td>
				</tr>
				<tr>
					<td>이미지 첨부</td>
					<td><input type="file" name="upload" ></td>
				</tr>
				<tr>
					<td><input type="submit" value="저장하기" ></td>
					<td><input type="reset" value="취소하기" ></td>
				</tr>
			

			</table>

		</form>

</section>

<%@ include file="boardbottom.jsp" %>