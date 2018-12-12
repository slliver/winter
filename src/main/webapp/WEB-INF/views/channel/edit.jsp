<%@ page language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<c:import url="/WEB-INF/views/include/header.jsp">
    <c:param name="title">渠道管理-编辑</c:param>
</c:import>
<div class="wrapper">
    <!-- Main Header -->
    <c:import url="/WEB-INF/views/include/header_navbar.jsp"/>
    <!-- Left side column. contains the logo and sidebar -->
    <c:import url="/WEB-INF/views/include/left_navbar.jsp"/>
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                编辑
                <small>Optional description</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li class="active">Here</li>
            </ol>
        </section>
        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="box box-info">
                        <div class="box-header with-border">
                        </div>
                        <form id="addForm" method="POST" onsubmit="return false;" action="${ctx}/channel/update" class="form-horizontal">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <input type="hidden" name="pkid" value="${channel.pkid}"/>
                            <input type="hidden" name="flagVersion" value="${channel.flagVersion}"/>
                            <input type="hidden" name="type" value="10"/>
                            <input type="hidden" name="serverPath" id="serverPath" value="${serverPath}"/>
                            <div class="box-body">
                                <div class="form-group">
                                    <label for="code" class="col-sm-2 control-label">渠道编码</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="code" id="code" value="${channel.code}" maxlength="20" placeholder="请输入渠道编码" readonly/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="name" class="col-sm-2 control-label">渠道名称</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="name" id="name" maxlength="20" value="${channel.name}" placeholder="请输入渠道名称"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="chargeUser" class="col-sm-2 control-label">负责人</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="chargeUser" id="chargeUser" value="${channel.chargeUser}" maxlength="20" placeholder="请输入负责人"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="phone" class="col-sm-2 control-label">联系电话</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="phone" id="phone" maxlength="20" value="${channel.phone}" placeholder="请输入联系电话"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="popularizeUrl" class="col-sm-2 control-label">全流程推广链接</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control copy-input" name="url" id="popularizeUrl" value="${channel.url}" maxlength="200" placeholder="请输入全流程推广链接" readonly/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="appPopularizeUrl" class="col-sm-2 control-label">App推广链接</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control copy-input" name="appUrl" id="appPopularizeUrl" value="${channel.appUrl}" maxlength="200" placeholder="请输入App推广链接" readonly/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="remark" class="col-sm-2 control-label">备注</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="remark" id="remark" maxlength="100" value="${channel.remark}" placeholder="请输入备注"/>
                                    </div>
                                </div>
                            </div>
                            <div class="box-footer">
                                <button type="button" class="btn btn-default" id="btn-cancel">取消</button>
                                <button type="button" class="btn btn-info pull-right" id="btn-submit">提交</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <c:import url="/WEB-INF/views/include/footer.jsp"/>
    <script type="text/javascript" src="${ctx}/assets/plugins/jquery.zclip/jquery.zclip.js"></script>
</div>
</body>
<script type="text/javascript">
    var ctx = '${ctx}';
    $(function () {
        $("#btn-cancel").unbind("click").bind("click", function (event) {
            window.location.href = ctx + "/channel/list";
        });

        $("#btn-submit").unbind("click").bind("click", function (event) {
            ZW.Ajax.doRequest("addForm", ctx + "/channel/update", "", function (data) {
                // 失败
                if (data.res == 0) {
                    ZW.Model.error(data.message);
                }
                // 成功
                if (data.res == 1) {
                    window.location.href = ctx + "/channel/list";
                }
            })
        });
    });
</script>
</html>