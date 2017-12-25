<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" type="text/css" href="/static/css/register.css">
<%@include file="common.jsp" %>


<html>
<head>
    <div id="form-header" class="header">
        <div class="logo-con w clearfix">
            <div class="logo-title" style="margin-left: 45%"><h2>欢迎注册</h2></div>
            <div class="have-account">已有账号？ <a href="//passport.jd.com/new/login.aspx">请登录</a></div>
        </div>

    </div>
    <div class="container w">

        <div class="main clearfix" id="form-main">
            <div class="reg-form fl">
                <form action="" id="register-form" method="post">
                    <!--chrome autocomplete off bug hack-->
                    <input style="display:none" name="hack"/>
                    <input type="password" style="display:none" name="hack1"/>

                    <div class="form-item form-item-account" id="form-item-account">
                        <label>用　户　名</label>
                        <input type="text" id="form-account" name="regName" class="field" autocomplete="off"
                               maxlength="20"
                               placeholder="您的账户名和登录名" default='<i class="i-def"></i>支持中文、字母、数字、“-”“_”的组合，4-20个字符'/>
                        <i class="i-status"></i>
                    </div>
                    <div class="input-tip">
                        <span></span>
                    </div>
                    <div class="form-item">
                        <label>设 置 密 码</label>
                        <input style="display:none" type="password" name="pwd" class="fakeinput"/>
                        <input type="password" name="pwd" id="form-pwd" class="field" maxlength="20"
                               placeholder="建议至少使用两种字符组合" default="<i class=i-def></i>建议使用字母、数字和符号两种及以上的组合，6-20个字符"/>
                        <i class="i-status"></i>
                    </div>
                    <div class="input-tip">
                        <span></span>
                    </div>
                    <div class="form-item">
                        <label>确 认 密 码</label>
                        <input style="display:none" type="password" name="pwdRepeat" class="fakeinput"/>
                        <input type="password" name="pwdRepeat" id="form-equalTopwd" class="field" placeholder="请再次输入密码"
                               maxlength="20" default='<i class="i-def"></i>请再次输入密码'/>
                        <i class="i-status"></i>
                    </div>
                    <div class="input-tip">
                        <span></span>
                    </div>
                    <div class="item-email-wrap">
                        <div class="form-item">
                            <label>邮 箱 验 证</label>
                            <input type="text" name="email" id="form-email" class="field ignore" autocomplete="off"
                                   placeholder="建议使用常用邮箱" id="email-input"
                                   default='<i class="i-def"></i>完成验证后，你可以用该邮箱登录和找回密码'/>
                            <i class="i-status"></i>
                        </div>
                        <div class="input-tip">
                            <span></span>
                        </div>
                        <div class="orPhone"><a href="javascript:;">手机验证</a></div>
                    </div>
                    <div class="item-phone-wrap">
                        <div class="form-item form-item-phone">
                            <label class="select-country" id="select-country" country_id="0086">中国 0086<a
                                    href="javascript:void(0) " tabindex="-1" class="arrow"></a></label>
                            <input type="text" id="form-phone" name="phone" class="field" placeholder="建议使用常用手机"
                                   autocomplete="off" maxlength="11"
                                   default='<i class="i-def"></i>完成验证后，你可以用该手机登录和找回密码'/>
                            <i class="i-status"></i>
                        </div>
                        <div class="input-tip">
                            <span></span>
                        </div>
                        <div class="orEmail"><a href="javascript:;" tabindex="-1">邮箱验证</a></div>
                    </div>
                    <div class="form-item form-item-authcode">
                        <label>验　证　码</label>
                        <input type="text" autocomplete="off" name="authCode" id="authCode" maxlength="6"
                               class="field form-authcode"
                               placeholder="请输入验证码" default='<i class="i-def"></i>看不清？点击图片更换验证码'/>
                        <img class="img-code" title="换一换" id="imgAuthCode"
                             onclick="this.src= document.location.protocol +'//authcode.jd.com/verify/image?a=0&amp;acid=52e83076-e61b-487e-8026-53ce9ee27cba&amp;uid=52e83076-e61b-487e-8026-53ce9ee27cba&amp;srcid=reg&amp;is=152315977592799e967d11c469770d8d&amp;yys='+new Date().getTime()"
                             ver_colorofnoisepoint="#888888"/>
                    </div>
                    <div class="input-tip">
                        <span></span>
                    </div>
                    <div class="form-item form-item-phonecode">
                        <label>手机验证码</label>
                        <input type="text" name="mobileCode" maxlength="6" id="phoneCode" class="field phonecode"
                               placeholder="请输入手机验证码" autocomplete="off"/>
                        <button id="getPhoneCode" class="btn-phonecode" type="button">获取验证码</button>
                        <i class="i-status"></i>
                    </div>
                    <div class="input-tip">
                        <span></span>
                    </div>
                    <div>
                        <button type="submit" class="btn-register">立即注册</button>
                    </div>

                </form>
            </div>
        </div>
    </div>

<body>

<script type="text/javascript" src="/static/common/js/zhizhuwang.js"></script>
</body>
</html>