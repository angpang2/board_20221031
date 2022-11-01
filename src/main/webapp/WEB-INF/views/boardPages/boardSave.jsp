<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-10-31
  Time: 오후 2:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>boardSave.jsp</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.css">
    <script src="/resources/js/jqury.js"></script>
    <style>
        #save-form{
            width: 800px;
            margin-top: 10px;
        }
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>

<div class="container" id="save-form">
    <form action="/save" method="post" name="saveForm"  class="form-control" >
    작성자  <input type="text" name="boardWriter"  class="form-control" >
    글비밀번호 <input type="text" name="boardPass"  class="form-control" >
    제목  <input type="text" name="boardTitle"  class="form-control" >
<%--    내용  <input type="text" name="boardContents"  class="form-control" >--%>
     내용   <textarea name="boardContents" cols="30" rows="10" class="form-control"></textarea>
        <input type="submit" value="작성하기">
</form>
</div>

</body>
</html>
