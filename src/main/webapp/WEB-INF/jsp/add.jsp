<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>新增大佬</title>
</head>
<body>
	<form action="/add" method="POST" id="dataListForm"
		accept-charset="UTF-8" onsubmit="document.charset='UTF-8'">
		<table class="gridtable" width="100%">
		<tr>
		<td>大佬姓名</td>
		<td><input type="text" name="name"></td>
	    <td>大佬年龄</td>
		<td><input type="text" name="age"></td>
		
		<td>大佬性别</td>
		<td><input type="text" name="sex"></td>
		<td> <input type="submit" value="提交"></td>
		</tr>
		</table>
   </form>
</body>
</html>