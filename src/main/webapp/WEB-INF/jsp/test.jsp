<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head></head>
<body>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdn.bootcss.com/clipboard.js/1.6.1/clipboard.min.js"></script>
<input id="foo" type="text" value="copy">
<button class="btn" data-clipboard-action="copy" data-clipboard-target="#foo">Copy</button>
</br>
<input id="foo1" type="text" value="cut">
<button class="btn" data-clipboard-action="cut" data-clipboard-target="#foo1">cut</button>
</br>总结:基本数据类型是值传递,其他数据类型是引用传递
<script type="text/javascript">
    /*
     * 一个页面响应加载的顺序是：域名解析-加载html-加载js和css-加载图片等其他信息。所以一般使用$(function(){})即可
     *$(document).ready(function(){} 等价于 $(function(){})
     * 但是有些时候图片或者重要信息没出来，会对用户操作产生误导，或者需要等获取某些图片高宽数据后再执行的行为函数，就得使用$(window).load(function(){}了
     * window.onload = function(){} 等价于 $(window).load(function(){}
    */
    $(document).ready(function(){
        var clipboard = new Clipboard('.btn');
    })
</script>
</body>
</html>