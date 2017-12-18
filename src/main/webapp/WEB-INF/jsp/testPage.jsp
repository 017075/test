<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" type="text/css" href="/static/jQueryHdPaging/paging.css">
<script type="text/javascript" src="/static/common/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/static/jQueryHdPaging/paging.js"></script>
<script type="text/javascript" src="/static/jQueryHdPaging/paging.min.js"></script>

<form action="/testPage" method="POST" id="dataListForm" accept-charset="UTF-8" onsubmit="document.charset='UTF-8'">
    <h1 align="center">宇宙级大佬信息统计</h1>
    <div>
        <table class="gridtable" width="100%">
            <thead>
            <tr>
                <th style="width: 33%">大佬姓名</th>
                <th style="width: 33%">大佬年龄</th>
                <th style="width: 33%">大佬性别</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${beans}" var="bean">
                <tr>
                    <td>${bean.name}</td>
                    <td>${bean.age}</td>
                    <td>${bean.sex==1?'man':'women'}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="box" id="box"></div>
        <div id="pageHidden">
            <input type="hidden" id="pageSize" name="pageSize" value="${page.pageSize}">
            <input type="hidden" id="currentPage" name="currentPage" value="${page.currentPage}">
            <input type="hidden" id="totalPage" name="totalPage" value="${page.totalPage}">
            <input type="hidden" id="totalCount" name="totalCount" value="${page.totalCount}"></div>
    </div>
</form>


<script>
    $('#box').paging({
        jump: true,//是否显示跳转按钮
        initPageNo: $("#currentPage").val(), // 初始选中页码
        totalPages: $("#totalPage").val(), //总页数
        totalCount: '共' + $("#totalCount").val() + '条数据', // 条目总数
        slideSpeed: 600, // 缓动速度。单位毫秒
    })
   /* $("#jumpBtn").click(function () {
       $("#currentPage").val($("#jumpText").val());
        $("#dataListForm").submit();
    });*/
    $("#prePage").click(function () {
        $("#currentPage").val($("#jumpText").val());
        $("#dataListForm").submit();
    });
</script>