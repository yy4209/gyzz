<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="backend/inc/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <%@ include file="backend/inc/meta.jsp" %>
    <meta name="description" content="">
    <meta name="author" content="">
    <title>gyzz登录</title>
    <%@ include file="backend/inc/css.jsp" %>
</head>

<body style="background-image: url('static/images/background.jpg');">

<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="login-panel panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title" style="text-align: center">登录gyzz管理系统</h3>
                </div>
                <div class="panel-body">
                    <form id="loginForm" role="form" action="login/check" method="post">
                        <fieldset>
                            <div class="form-group  <c:if test="${empty error}">has_error</c:if>">
                                <label id="errorlable" class="control-label">${error}</label>
                                <input id="account" class="form-control" placeholder="账号" name="account" value="${name}" type="text"/>
                            </div>
                            <div class="form-group <#if error??>has-error</#if>">
                                <input id="password" class="form-control" placeholder="密码" name="password" type="password"/>
                            </div>
                            <button type="button" id="submitButton" onclick="validation()" class="btn btn-lg btn-success btn-block">登录</button>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>

<script type="text/javascript">
    $(function () {
        $("#idCode").attr("src", _basePath + "login/getIdCode");
    });

    //回车触发登录
    $(document).keyup(function (event) {
        //点击回车触发
        if (event.keyCode == 13) {
            if ($("#account").val() == "") {
                $("#account").focus();
                return;
            }
            if ($("#password").val() == "") {
                $("#password").focus();
                return;
            }
            if ($("#textfield3").val() == "") {
                $("#textfield3").focus();
                return;
            }
            validation();
        }
    });

    function validation() {
        if ($("#account").val() == "") {
            $("#errorlable").html("请输入用户名");
            $("#account").focus();
            return;
        }
        if ($("#password").val() == "") {
            $("#errorlable").html("请输入密码");
            $("#password").focus();
            return;
        }
        if ($("#textfield3").val() == "") {
            $("#errorlable").html("请输入验证码");
            $("#textfield3").focus();
            return;
        }
        $("#loginForm").submit();
    }
</script>

</html>
