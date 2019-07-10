<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="common.jsp"%>
<form action="/testPage" method="POST" id="dataListForm" accept-charset="UTF-8" onsubmit="document.charset='UTF-8'">
    <h1 align="center">宇宙级大佬信息统计</h1>
    <div>
        <table class="gridtable" width="100%">
            <thead>
            <tr>
                <th style="width: 24%">大佬姓名</th>
                <th style="width: 24%">大佬年龄</th>
                <th style="width: 24%">大佬性别</th>
                <th style="width: 25%">数据操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${beans}" var="bean">
                <tr>
                    <td>${bean.name}</td>
                    <td>${bean.age}</td>
                    <td>${bean.sex==1?'男':'女'}</td>
                    <td><a href="add.jsp">添加</a>&nbsp;&nbsp;<a href="delete?id=${bean.id}" onclick="return confirm('确定要删除吗?')">删除</a>&nbsp;&nbsp;<a href="update?id=${bean.id}">更新</a></td>
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
</script>