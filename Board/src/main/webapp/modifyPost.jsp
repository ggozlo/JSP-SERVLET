<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="top.jsp" %>
<section>
		<script type="text/javascript">
			function check() 
			{
				var form =  document.form;
				if(form.btitle.value == "")
				{
					alert("제목은 비어있으면 안됩니다!");
					return false;
				}
				return true;
				
			}
		</script>
		<form action="modify.do" method="post" name="form">
			<table>
				<caption>글 수정하기</caption>
				<tr>
					<td>글번호</td>
					<td><input type="text" name="bid" value="${post.bid}" ></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><input type="text" name="bname" value="${name}"></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="btitle" value="${post.btitle}"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea rows="10" cols="30" name="bcontent">${post.bcontent }</textarea></td>
				</tr>
				<tr>
					<td><input type="submit" value="저장하기" onclick="return check()" ></td>
					<td><input type="reset" value="취소하기" ></td>
				</tr>
			

			</table>
	
		</form>

</section>

<%@ include file="bottom.jsp" %>