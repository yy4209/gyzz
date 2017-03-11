<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="inc/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <%@ include file="inc/meta.jsp" %>
    <meta name="description" content="">
    <meta name="author" content="">
    <title>管理人员列表</title>
    <%@ include file="inc/css.jsp" %>
</head>

<body>
<div id="posts" class="wrapper">

    <%@ include file="inc/nav.jsp" %>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">管理员列表</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>

        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <a href="backend/admin/add" class="btn btn-outline btn-primary btn-lg" role="button">新增管理人员</a>
                        <a href="javascript:void(0)" onclick="_adminList.fn.batchDel()" class="btn btn-outline btn-danger btn-lg" role="button">一键删除</a>

                        <form class="navbar-form navbar-right" role="search">
                            <div class="form-group">
                                <input type="text" class="form-control" id="account" maxlength="20" placeholder="账号"/>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" id="company" maxlength="20" placeholder="公司"/>
                            </div>
                            <button type="button" id="c_search" class="btn btn-primary btn-sm">搜索</button>
                        </form>
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">

                        <div class="table-responsive">

                            <table class="table table-striped table-bordered table-hover" id="dataTables">
                                <colgroup>
                                    <col class="gradeA even" style="width: 6%"/>
                                    <col class="gradeA odd"/>
                                    <col class="gradeA even"/>
                                    <col class="gradeA odd"/>
                                    <col class="gradeA even"/>
                                    <col class="gradeA odd"/>
                                </colgroup>
                                <thead>
                                <tr>
                                    <th><input type="checkbox" onclick="$leoman.checkAll(this)" class="checkall"/></th>
                                    <th>账号</th>
                                    <th>添加时间</th>
                                    <th>公司名称</th>
                                    <th>权限</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>

                    </div>
                    <!-- /.panel-body -->

                </div>
                <!-- /.panel -->
            </div>
        </div>


    </div>
    <!-- /#page-wrapper -->

    <div class="modal fade" id="delModal" tabindex="-1" role="dialog" aria-labelledby="pwdModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">删除提示</h4>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="id"/>
                    确定删除该管理人员？
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" onclick="_adminList.fn.subDelInfo()" class="btn btn-primary">确定</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>

    <!-- Modal -->
    <div class="modal fade" id="infoModal" tabindex="-1" role="dialog" aria-labelledby="pwdModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">提示</h4>
                </div>
                <div class="modal-body">
                    重置密码，新的登录密码将会发送到用户的手机，确认重置？
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" onclick="_adminList.fn.subInfo()" class="btn btn-primary">确定</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- Modal end -->

</div>
<!-- /#wrapper -->

<%@ include file="inc/footer.jsp" %>
</body>

<script type="text/javascript">
    var _adminList = {
        v: {
            id: "_adminList",
            list: [],
            dTable: null
        },
        fn: {
            init: function () {
                _adminList.fn.dataTableInit();

                // 查询
                $("#c_search").click(function () {
                    _adminList.v.dTable.ajax.reload();
                });
            },
            dataTableInit: function () {
                _adminList.v.dTable = $leoman.dataTable($('#dataTables'), {
                    "processing": true,
                    "serverSide": true,
                    "searching": false,
                    "ordering": false,
                    "ajax": {
                        "url": "backend/admin/list",
                        "type": "POST"
                    },
                    "columns": [
                        {"data": "id"},
                        {"data": "account"},
                        {
                            "data": "createTime",
                            render: function (data) {
                                return formatJsonDateTime(data, 'yyyy-MM-dd hh:mm:ss');
                            }
                        },
                        {
                            "data": "group",
                            render: function (data) {
                                if (null != data) {
                                    return data.department.company.name;
                                } else {
                                    return '';
                                }
                            }
                        },
                        {"data": "id"},
                        {"data": ""}
                    ],
                    "columnDefs": [
                        {
                            "data": null,
                            "defaultContent": "<a title='编辑' class='btn btn-primary btn-circle edit'>" +
                            "<i class='fa fa-edit'></i>" +
                            "</a>" +
                            "<button type='button' title='重置密码' style='margin-left: 10px;' class='btn btn-info btn-circle rePwd'>" +
                            "<i class='fa fa-refresh'></i>" +
                            "</button>" +
                            "<button type='button' title='删除' style='display: none;margin-left: 10px;' class='btn btn-danger btn-circle delete'>" +
                            "<i class='fa fa-trash'></i>" +
                            "</button>",
                            "targets": -1
                        }
                    ],
                    "createdRow": function (row, data, index) {
                        _adminList.v.list.push(data);
                        if (data.id != 1) {
                            $('td', row).eq(0).html("<input type='checkbox' value=" + data.id + ">");
                            $('td', row).eq(4).html("操作员");
                        } else {
                            $('td', row).eq(0).html("");
                            $('td', row).eq(4).html("管理员");
                        }
                    },
                    rowCallback: function (row, data) {
                        if (data.id != 1) {
                            $('td', row).last().find(".delete").css('display', '');
                        }

                        $('td', row).last().find(".edit").attr("href", 'backend/admin/add?adminId=' + data.id);

                        $('td', row).last().find(".rePwd").click(function () {
                            _adminList.fn.resetPwd(data.id);
                        });

                        $('td', row).last().find(".delete").click(function () {
                            _adminList.fn.delInfo(data.id);
                        });
                    },
                    "fnServerParams": function (aoData) {
                        aoData.account = $('#account').val();
                        aoData.company = $('#company').val();
                    },
                    "fnDrawCallback": function (row) {
                        $leoman.uiform();
                    }
                });
            },
            resetPwd: function (id) {
                $('#id').val(id);
                $("#infoModal").modal("show");
            },
            delInfo: function (id) {
                $('#id').val(id);
                $("#delModal").modal("show");
            },
            subInfo: function () {
                var id = $('#id').val();

                $leoman.ajax("backend/admin/resetPwd", {
                    "adminId": id
                }, function (result) {
                    if (result == 1) {
                        $leoman.notify("操作成功", "success");
                        $("#infoModal").modal("hide");
                        _adminList.v.dTable.ajax.reload(null, false);
                    } else if (result == 100) {
                        window.location.href = "backend/admin/index";
                    } else if (result == -1) {
                        $leoman.notify("请先填写手机号", "error");
                    } else {
                        $leoman.notify("操作失败", "error");
                    }
                });
            },
            subDelInfo: function () {
                var id = $('#id').val();

                $leoman.ajax("backend/admin/delete", {
                    "adminId": id
                }, function (result) {
                    if (result == 1) {
                        $leoman.notify("操作成功", "success");
                        $("#delModal").modal("hide");
                        _adminList.v.dTable.ajax.reload(null, false);
                    } else if (result == 100) {
                        window.location.href = "backend/admin/index";
                    } else {
                        $leoman.notify("操作失败", "error");
                    }
                });
            },
            batchDel: function () {
                var checkBox = $("#dataTables tbody tr").find('input[type=checkbox]:checked');
                var ids = checkBox.getInputId();
                _adminList.fn.deleteRow(checkBox, ids)
            },
            deleteRow: function (checkBox, ids) {
                if (ids.length > 0) {
                    $leoman.optNotify(function () {
                        $leoman.ajax("backend/admin/batchDel", {ids: JSON.stringify(ids)}, function (result) {
                            if (result == 1) {
                                $leoman.notify("操作成功", "success");
                                _adminList.v.dTable.ajax.reload();
                            } else if (result == 100) {
                                window.location.href = "backend/admin/index";
                            } else {
                                $leoman.notify("操作失败", "error");
                            }
                        })
                    }, '确定删除选中的所有管理员？', '确定');
                }
            }
        }
    }

    $(document).ready(function () {
        _adminList.fn.init();
    });

</script>

</html>