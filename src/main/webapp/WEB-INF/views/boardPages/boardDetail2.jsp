<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>게시판</title>
  <link rel="stylesheet" href="/resources/css/bootstrap.css">
  <script src="/resources/js/jqury.js"></script>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>

  <table>
    <tr>
      <td>
        <table width="100%" cellpadding="0" cellspacing="0" border="0">
          <tr style="text-align:center;">
            <td width="5"><img src="img/table_left.gif" width="5" height="30" /></td>
            <td>글쓰기</td>
            <td width="5"><img src="img/table_right.gif" width="5" height="30" /></td>
          </tr>
        </table>
        <table>
          <tr>
            <td>&nbsp;</td>
            <td align="center">제목</td>
            <td><input name="boardTitle" size="50" maxlength="100" value="${board.boardTitle}"type="text" readonly></td>
            <td>&nbsp;</td>
          </tr>
          <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
          <tr>
            <td>&nbsp;</td>
            <td align="center">작성자</td>
            <td><input name="boardWriter" size="50" maxlength="50" value="${board.boardWriter}"type="text" readonly></td>
            <td></td>
          </tr>
          <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
          <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
          <tr>
            <td>&nbsp;</td>
            <td align="center">내용</td>
            <td><textarea name="boardContents" cols="50" rows="13" type="text" readonly>${board.boardContents}</textarea></td>
            <td>&nbsp;</td>
          </tr>
          <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
          <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
          <tr align="center">
            <td>&nbsp;</td>
            <td><a href="/update?id=${board.id}">글수정하기</a></td>
              <a href="/">홈으로</a>
            <td>&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <c:if test="${board.storedFileName != null}">
    <tr>
      <td>
        <img src="${pageContext.request.contextPath}/upload/${board.storedFileName}"
             alt="" width="100" height="100">
      </td>
    </tr>
    </c:if>
  </table>
<div>
  <button class="btn btn-primary" onclick="listFn()">목록</button>
</div>
<%--<div>--%>
<%--  <form action="/comment_save" method="get" name="comment">--%>
<%--    <input type="text" name="comment_Writer" placeholder="댓글작성자" >--%>
<%--    <input type="hidden" name="comment_id" value="${board.id}" id="com_id">--%>
<%--    <input type="password" name="comment_Pass"placeholder="댓글비밀번호" >--%>
<%--    <input type="text" name="comment_Contents"placeholder="댓글내용" >--%>
<%--    <input type="submit" value="댓글달기">--%>
<%--  </form>--%>
<%--</div>--%>

<%--<div id="detail_result">--%>

<%--</div>--%>

</body>
<script>
  const emailCheck = () => {
    const comment_id = document.getElementById("comment_id").value;
    const detailResult = document.getElementById("detail_result");
    $.ajax({
      type: "post",
      url: "/com_check",
      data: {
        value1: comment_id
      },
      dataType: "json",
      success: function (comment) {
        console.log("성공");
        detailResult.innerHTML  = comment;
      },
      error: function () {
        console.log("실패")
      }

    })
  }

  const listFn = () => {
    const page = '${page}';
    location.href = "/board/paging?page="+page;
  }



</script>

</html>