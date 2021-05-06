
   <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="top.jsp" %>
<section>
	      <form action="addReply.do" method="post">
       <input type="hidden" name="bid" value="${reply_view.bid}">
      <input type="hidden" name="bgroup" value="${reply_view.bgroup}">
      <input type="hidden" name="bstep" value="${reply_view.bstep}">
      <input type="hidden" name="bindent" value="${reply_view.bindent}">   
<table width="500" border="1">
 
              
      <tr>
         <td> 글번호 </td><td>${reply_view.bid} </td>
      </tr>
      <tr>
         <td> 조회수 </td><td>${reply_view.bhit} </td>
      </tr>
      <tr>
         <td>이름(댓글) </td><td><input type="text" name="bname" value="${name}"> </td>
      </tr>
      <tr>
         <td> 제목(댓글) </td><td><input type="text" name="btitle" value="${reply_view.btitle}"> </td>
      </tr>
      <tr>
         <td> 내용(댓글) </td><td><textarea rows="10" cols="45" name="bcontent">${reply_view.bcontent}</textarea></td>
      </tr>
      <tr>
      <td colspan="2"><input type="submit" value="답글"> </td> 
</table>
 

   </form>
   

</section>

<%@ include file="bottom.jsp" %>