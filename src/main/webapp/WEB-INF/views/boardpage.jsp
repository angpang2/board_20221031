<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>게시판</title>
  <link rel="stylesheet" href="/resources/css/bootstrap.css">
  <script src="/resources/js/jqury.js"></script>
</head>
<body>
<jsp:include page="layout/header.jsp" flush="false"></jsp:include>
<form action="/update" method="post" name="up">
  <input type="hidden" name="id" value="${board.id}" class="form-control" readonly>
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
          <td><input name="boardTitle" size="50" maxlength="100" value="${board.boardTitle}"type="text"></td>
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
        <tr>
          <td>&nbsp;</td>
          <td align="center">비밀번호</td>
          <td><input name="boardPass" size="50" maxlength="50" type="password"></td>
          <td>&nbsp;</td>
        </tr>
        <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
        <tr>
          <td>&nbsp;</td>
          <td align="center">내용</td>
          <td><textarea name="boardContents" cols="50" rows="13" type="text">${board.boardContents}</textarea></td>
          <td>&nbsp;</td>
        </tr>
        <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
        <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
        <tr align="center">
          <td>&nbsp;</td>
          <td colspan="2"><input type=button value="수정하기" onclick="update()">
            <input type="button" value="삭제" onclick="del(${board.id})">
            <input type=button value="취소" onclick="location.href='/'">
          <td>&nbsp;</td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</form>
</body>
<script>
  const update = () => {
    const passwordDB = '${board.boardPass}';
    if(document.up.boardPass.value!=passwordDB) {
      alert("비밀번호가 일치하지 않습니다.")
    }else {
      document.up.submit();
    }
  }

  const del= (clickid) => {
    const passwordDB = ${board.boardPass};
    if(document.up.boardPass.value == passwordDB) {
      if (confirm("정말 삭제 하시겠습니까?") == true){
        location.href = "/del?id=" + clickid;
      }else{
        alert("취소되었습니다");
      }
    }else {
      alert("비밀번호가 일치하지 않습니다.")
    }
  }



</script>
</html>