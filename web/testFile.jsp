<%--
  Created by IntelliJ IDEA.
  User: zzq52
  Date: 2020/2/19
  Time: 13:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>文件相关</title>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
</head>
<body>
<h1>文件相关</h1>

<form action="${pageContext.request.contextPath}/myFile" method="post"
      enctype="multipart/form-data">
    <input type="file" name="myfile"><br>
    <input type="submit" value="提交">
</form>

<hr>

<h1>文件下载</h1>
<a href="${pageContext.request.contextPath}/download/pic2.JPG">下载pic2.JPG</a>

<h1>文件上传</h1>
<form action="${pageContext.request.contextPath}/upload" method="post"
      enctype="multipart/form-data">
    <input type="file" name="file"><br>
    <input type="submit" value="上传">
</form>

</body>
</html>
