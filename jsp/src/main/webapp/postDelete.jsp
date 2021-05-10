<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="boardtop.jsp" %>

<script>
	function check() 
	{
		var form = document.form;
		if(form.id.value == "")
		{
			return false;	
		}
		if(form.name.value == "")
		{
			return false;
		}
		
	}
</script>

<section>
			<form action="delete.do" method="post" name="form">
			<table>
				<caption>삭제하기</caption>
				
				<tr>
					<td>대상 글 ID</td>
					<td><input type="text" name="id" ></td>
				</tr>
				<tr>
					<td>대상 글 작성자</td>
					<td><input type="text" name="name" ></td>
				</tr>
				<tr>
					<td><input type="submit" value="삭제" onclick="return check()"></td>
					<td><input type="reset" value="다시입력"></td>
				</tr>
				

			</table>
			
		</form>

</section>

<%@ include file="boardbottom.jsp" %>