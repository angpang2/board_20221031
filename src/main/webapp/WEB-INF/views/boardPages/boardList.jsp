<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-10-31
  Time: 오후 3:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
    <title>memberList.jsp</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.css">
    <script src="/resources/js/jqury.js"></script>
    <style>
        #list-form{
            margin-top: 50px;
        }
    </style>
</head>
<body>
<div class="container" id="list-form">
    <table class="table table-striped">
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>조회수</th>
            <th>작성시간</th>

        </tr>
        <c:forEach items="${BoardList}" var="board">
            <tr>
                <td> ${board.id} </td>
                <td>
                    <a href="/board?id=${board.id}">${board.boardTitle}</a>
                </td>
                <td> ${board.boardWriter}</td>
                <td> ${board.boardHits}</td>
                <td><fmt:formatDate value="${board.boardCreatedDate}" pattern="yyyy-MM-dd hh:mm:ss"></fmt:formatDate>
                </td>
            </tr>


        </c:forEach>
    </table>
</div>
<a href="/">홈으로</a>
</body>
</html>
