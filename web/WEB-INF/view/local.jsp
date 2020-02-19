<%--
  Created by IntelliJ IDEA.
  User: zzq52
  Date: 2020/2/19
  Time: 15:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>本地化/国际化</title>
</head>
<body>
<h1>本地化/国际化, 结果页</h1>

<a href="?language=zh_CN"><fmt:message key="language.cn"/></a>
<a href="?language=en_US"><fmt:message key="language.en"/></a>

<hr>

<fmt:message key="welcome"/><br>
<fmt:message key="name"/><br>

</body>
</html>
