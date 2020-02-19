<%--
  Created by IntelliJ IDEA.
  User: zzq52
  Date: 2020/2/19
  Time: 11:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>JSON相关</title>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
</head>
<body>
<h1>JSON相关</h1>

<h1>通过jQuery发送ajax请求, 并在控制台打印返回的JSON数据</h1>
<input id="btn" type="button" value="请求JSON">

<script>
    $(function () {
        $('#btn').click(function () {
            // 发送AJAX请求
            $.post("${pageContext.request.contextPath}/getJson", function (data) {
                console.log(data);
            });
        });
    });
</script>

</body>
</html>
