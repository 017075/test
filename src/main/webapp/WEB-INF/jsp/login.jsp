<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" type="text/css" href="/static/css/login.css">
<%@include file="common.jsp"%>



<html>
<head>


<body>
<div class="login">
    <div class="valign_wrap">
        <!-- +.withqrc 切换 -->
        <div class="login_pop">
            <div class="login_pop_inner login_withpc">
                <div align="center"><h2>欢迎登陆</h2></div>
                <form class="login_form" method="post" name="login_form" action="/testPage">
                    <!-- +.warn +.focus +.hide -->
                    <div class="login_form_row account"><label class="login_form_label"><i class="login_form_icon"></i>
                        <div class="login_form_inp"><input class="login_form_inp_input" type="text" id="username" name="username" placeholder="用户名"
                                                           style="overflow: hidden;text-overflow:ellipsis">
                        </div>
                    </label></div>
                    <div class="login_form_row password"><label class="login_form_label"><i class="login_form_icon"></i>
                        <div class="login_form_inp"><input class="login_form_inp_input" type="password" id="password" name="password" placeholder="密码">
                        </div>
                    </label></div>

                    <div class="login_form_row findback"><a id="forgetPassword">忘记密码？</a></div>
                    <div class="login_form_row formsubmit"><input class="formsubmit_btn" type="submit" value="登&nbsp;&nbsp;录"></div>
                    <div class="login_form_row warntip hide"><i class="warntip_icon"></i><span class="warntip_text"></span>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!--[if lt IE 8]><span class="valign_after"></span><![endif]-->
</div>
<script type="text/javascript" src="/static/common/js/zhizhuwang.js"></script>
</body>
</html>