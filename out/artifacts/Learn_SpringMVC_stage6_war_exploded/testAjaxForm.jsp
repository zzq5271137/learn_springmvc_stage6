<%--
  Created by IntelliJ IDEA.
  User: zzq52
  Date: 2020/2/19
  Time: 12:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>表单序列化</title>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
</head>
<body>
<h1>表单序列化</h1>

<form id="myform">
    姓名:<input type="text" name="name"><br>
    年龄:<input type="text" name="age"><br>
    爱好:<input type="checkbox" name="hobbies" value="篮球"> 篮球
    <input type="checkbox" name="hobbies" value="乒乓球"> 乒乓球
    <input type="checkbox" name="hobbies" value="足球"> 足球
</form>
<%-- 使用jquery实现点击按扭发送表单数据 --%>
<input type="button" id="formbtn" value="发送form">

<script>
    // jquery第三方插件, 实现表单序列化后转为json格式
    (function ($) {
        $.fn.serializeJson = function () {
            var serializeObj = {};
            var array = this.serializeArray();
            var str = this.serialize();
            $(array).each(function () {
                if (serializeObj[this.name]) {
                    if ($.isArray(serializeObj[this.name])) {
                        serializeObj[this.name].push(this.value);
                    } else {
                        serializeObj[this.name] = [serializeObj[this.name], this.value];
                    }
                } else {
                    serializeObj[this.name] = this.value;
                }
            });
            return serializeObj;
        };
    })(jQuery);

    $(function () {
        $('#formbtn').click(function () {
            // 获取表单中所有的参数, 然后发送给服务器
            // 使用jquery的表单序列化一次性获取所有表单数据
            // var formData = $('#myform').serialize();
            // 但是, 使用jquery自带的表单序列化无法将数据弄成json格式
            // 需要使用第三方插件
            // 需要注意的是, 此时的数据还不是json字符串, 里面有复杂数据(hobbies数组)
            var formData = $('#myform').serializeJson();
            console.log(formData);

            // 发送给服务器
            /*
                // 以这种形式发送请求, 只能发送简单数据(key-value的形式), 无法发送如hobbies数组的复杂数据
                $.post('${pageContext.request.contextPath}/formJson', formData, function (data) {
                    console.log(data);
                });
            */

            // 解决只点击一个爱好时, 它默认发送的是一个字符串而不是数组的问题
            // 因为你是用application/json的形式发送数据, 服务器端不会自动解析
            if (typeof formData.hobbies == 'string') {
                formData.hobbies = new Array(formData.hobbies);
            }
            // 使用JSON.stringify()方法, 把复杂数据转成json字符串
            console.log(JSON.stringify(formData));

            $.ajax({
                type: 'post',
                url: '${pageContext.request.contextPath}/formJson',
                data: JSON.stringify(formData), // 把复杂类型的数据转成json字符串

                // 明确告诉服务器, 发送的是一个json字符串
                // 在服务器端接收数据的时候也需要做处理, 详见MyController.java中的formJson()
                contentType: 'application/json',

                // 指定返回值必须是json类型
                dataType: 'json',

                success: function (data) {
                    alert('成功');
                    console.log(data);
                },

                error: function (data) {
                    alert('失败');
                    console.log(data);
                }
            });

        });
    });
</script>

</body>
</html>
