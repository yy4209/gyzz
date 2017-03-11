<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="inc/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <%@ include file="inc/meta.jsp" %>
    <meta name="description" content="">
    <meta name="author" content="">
    <title>管理员管理</title>
    <%@ include file="inc/css.jsp" %>
</head>
<body>

<div id="posts" class="wrapper">

    <%@ include file="inc/nav.jsp" %>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">管理管理员</h1>
                <h4 style="margin-left: 10px;" id="showH">——新增管理员</h4>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <form id="infoForm" method="post" action="backend/admin/save" class="form-horizontal nice-validator n-default" role="form" novalidate="novalidate">
                            <input type="hidden" id="id" name="adminId" value="${admin.id}"/>
                            <input type="hidden" id="competence" value="${admin.competence}"/>
                            <input type="hidden" id="groupId" value="${groupId}"/>
                            <input type="hidden" id="departmentId" value="${departmentId}"/>
                            <input type="hidden" id="companyId" value="${companyId}"/>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">账号:</label>

                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="account" name="account" maxlength="20"
                                           data-rule="required" value="${admin.account}" placeholder="请输入账号"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">密码:</label>

                                <div class="col-sm-4">
                                    <input type="password" class="form-control" id="password" name="password" maxlength="20"
                                           data-rule="required" value="${admin.password}" placeholder="请输入密码"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">确认密码:</label>

                                <div class="col-sm-4">
                                    <input type="password" class="form-control" id="quePassword" maxlength="20"
                                           data-rule="required" value="${admin.password}" placeholder="请输入确认密码"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">公司:</label>

                                <div class="col-sm-4">
                                    <select class="form-control" id="companyList" style="width: 200px;"></select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">部门:</label>

                                <div class="col-sm-4">
                                    <select class="form-control" id="departmentList" style="width: 200px;">
                                        <option value="">请选择部门</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">班组:</label>

                                <div class="col-sm-4">
                                    <select class="form-control" id="groupList" name="groupId" style="width: 200px;">
                                        <option value="">请选择班组</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">权限分配:</label>

                                <div class="col-sm-4" style="padding-top: 5.5px;">
                                    <c:forEach var="n" items="${competenceList}">
                                        <input type="checkbox" name="competence" class="form-control" value="${n}"
                                               <c:if test="${admin.competence.contains(n)}">checked</c:if> />${n}&nbsp;&nbsp;&nbsp;&nbsp;
                                    </c:forEach>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-6" style="text-align: center">
                                    <button type="button" class="btn btn-primary" onclick="admin.fn.subInfo()">保存</button>
                                    <button type="button" class="btn btn-primary" onclick="admin.fn.goBack()">返回</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <!-- /.panel-body -->

                </div>
                <!-- /.panel -->
            </div>
        </div>

    </div>
    <!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->

<%@ include file="inc/footer.jsp" %>

</body>

<script type="text/javascript">
    var admin = {
        v: {
            id: "admin",
            list: [],
            dTable: null
        },
        fn: {
            init: function () {
                $.ajaxSetup({
                    async: false
                });

                if ($("#id").val() != "") {
                    $("#showH").text("——编辑管理人员");
                }

                admin.fn.getCompanyList();

                $('#companyList').change(function () {
                    $('#companyId').val('');
                    $('#departmentId').val('');
                    $('#groupId').val('');

                    admin.fn.getDepartmentList();

                    $('#groupList').html("<option value=''>请选择班组</option>");
                });

                $('#departmentList').change(function () {
                    $('#departmentId').val('');
                    $('#groupId').val('');

                    admin.fn.getGroupList();
                });
            },
            checkData: function () {
                var flag = true;
                var account = $('#account').val();
                var password = $('#password').val();
                var quePassword = $('#quePassword').val();
                var groupId = $('#groupList option:selected').val();

                if (null == account || account == '') {
                    $leoman.notify('账号不能为空', "error");
                    flag = false;
                    return;
                }

                if (null == password || password == '') {
                    $leoman.notify('密码不能为空', "error");
                    flag = false;
                    return;
                }

                if (password != quePassword) {
                    $leoman.notify('前后密码不一致', "error");
                    flag = false;
                    return;
                }

                if (null == groupId || groupId == '') {
                    $leoman.notify('请选择班组', "error");
                    flag = false;
                    return;
                }

                return flag;
            },
            subInfo: function () {
                // 所有的验证通过后，执行新增操作
                if (admin.fn.checkData()) {
                    $("#infoForm").ajaxSubmit({
                        url: _basePath + "backend/admin/save",
                        dataType: "json",
                        success: function (data) {
                            if (data == 1) {
                                window.location.href = _basePath + "backend/admin/index";
                            } else if (data == -1) {
                                $leoman.notify("账号重复，请重新填写账号", "error");
                            } else {
                                $leoman.notify("操作失败", "error");
                            }
                        }
                    });
                }
            },
            getCompanyList: function () {
                var companyId = $("#companyId").val();

                $leoman.ajax("backend/companyList", null, function (result) {
                    if (null != result) {
                        var content = "<option value=''>请选择公司</option>";
                        jQuery.each(result, function (i, item) {
                            if (null != companyId && item.id == companyId) {
                                content += "<option value='" + item.id + "' selected>" + item.name + "</option>";
                            } else {
                                content += "<option value='" + item.id + "'>" + item.name + "</option>";
                            }
                        });
                        $('#companyList').append(content);

                        var departmentId = $("#departmentId").val();
                        if (departmentId != '') {
                            admin.fn.getDepartmentList();
                        }
                    } else {
                        $leoman.notify("获取公司信息失败", "error");
                    }
                });
            },
            getDepartmentList: function () {
                var companyId = $('#companyList option:selected').val();
                var departmentId = $("#departmentId").val();

                if (companyId != '') {
                    $('#departmentList').html("");

                    $leoman.ajax("backend/departmentList", {
                        companyId: companyId
                    }, function (result) {
                        if (null != result) {
                            var content = "<option value=''>请选择部门</option>";
                            jQuery.each(result, function (i, item) {
                                if (null != departmentId && item.id == departmentId) {
                                    content += "<option value='" + item.id + "' selected>" + item.name + "</option>";
                                } else {
                                    content += "<option value='" + item.id + "'>" + item.name + "</option>";
                                }
                            });
                            $('#departmentList').append(content);

                            var groupId = $("#groupId").val();
                            if (groupId != '') {
                                admin.fn.getGroupList();
                            }
                        } else {
                            $leoman.notify("获取部门信息失败", "error");
                        }
                    });
                } else {
                    $('#departmentList').html("<option value=''>请选择部门</option>");
                }
            },
            getGroupList: function () {
                var departmentId = $('#departmentList option:selected').val();
                var groupId = $("#groupId").val();

                if (departmentId != '') {
                    $('#groupList').html("");

                    $leoman.ajax("backend/groupList", {
                        departmentId: departmentId
                    }, function (result) {
                        if (null != result) {
                            var content = "<option value=''>请选择班组</option>";
                            jQuery.each(result, function (i, item) {
                                if (null != groupId && item.id == groupId) {
                                    content += "<option value='" + item.id + "' selected>" + item.name + "</option>";
                                } else {
                                    content += "<option value='" + item.id + "'>" + item.name + "</option>";
                                }
                            });
                            $('#groupList').append(content);
                        } else {
                            $leoman.notify("获取班组信息失败", "error");
                        }
                    });
                } else {
                    $('#groupList').html("<option value=''>请选择班组</option>");
                }
            },
            goBack: function () {
                window.location.href = "backend/admin/index";
            }
        }
    }

    $(document).ready(function () {
        admin.fn.init();
    });

</script>

</html>