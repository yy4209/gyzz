<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="inc/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <%@ include file="inc/meta.jsp" %>
    <meta name="description" content="">
    <meta name="author" content="">
    <title>控制面板</title>
    <%@ include file="inc/css.jsp" %>
</head>

<body>

<div id="posts" class="wrapper">
    <%@ include file="inc/nav.jsp" %>
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header" style="text-align: center;">${adminUser.account}，欢迎进入工业制造后台管理系统</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>

    </div>

</div>

<%@ include file="inc/footer.jsp" %>
</body>

</html>