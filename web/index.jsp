<%--
  Created by IntelliJ IDEA.
  User: zzq52
  Date: 2020/2/18
  Time: 23:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Learn SpringMVC stage 6</title>
</head>
<body>
<h1>Learn SpringMVC stage 6</h1>

<%-- 图片访问不到的原因是因为在web.xml中, 配置了SpringMVC前端控制器拦截所有请求(拦截"/", 详见web.xml) --%>
<%-- 有两种解决办法, 详见springmvc.xml --%>
<img src="${pageContext.request.contextPath}/images/pic2.JPG"
     style="width: 100px">

<hr>

<a href="${pageContext.request.contextPath}/testJson.jsp">
    JSON相关
</a>

<hr>

<a href="${pageContext.request.contextPath}/testAjaxForm.jsp">
    表单序列化
</a>

<hr>

<a href="${pageContext.request.contextPath}/testFile.jsp">
    文件相关
</a>

<hr>

<a href="${pageContext.request.contextPath}/testException.jsp">
    异常处理
</a>

<hr>

<a href="${pageContext.request.contextPath}/testLocal.jsp">
    本地化/国际化
</a>

</body>
</html>
