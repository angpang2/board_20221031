<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-10-31
  Time: 오후 4:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="layout/header.jsp" flush="false"></jsp:include>
    <title>boardDtail.jsp</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.css">
    <script src="/resources/js/jqury.js"></script>
</head>
<body>
<h6>번호: ${board.id}</h6>
<h5>작성자: ${board.boardWriter}</h5>
<h5>제목: ${board.boardTitle}</h5>
<h5>내용: ${board.boardContents}</h5>
<h5>작성시간: ${board.boardCreatedDate}</h5>
<h5>조회수 : ${board.boardHits}</h5>

<a href="/">홈으로</a>
<a href="/update?id=${board.id}">글수정하기</a>

</body>
</html>
