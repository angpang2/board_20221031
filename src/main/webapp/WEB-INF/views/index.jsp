<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-10-31
  Time: 오후 2:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<html>
<head>
    <title>index.jsp</title>
</head>
<body>
<jsp:include page="layout/header.jsp" flush="false"></jsp:include>
<a href="/board/save">글작성</a>
<a href="/board/">글목록</a>
<a href="/boardpage">보드페이지</a>


</body>
</html>
