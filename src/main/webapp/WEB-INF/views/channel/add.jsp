<%@ page language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<c:import url="/WEB-INF/views/include/header.jsp">
    <c:param name="title">渠道管理-添加</c:param>
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
                添加
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
                            <input type="hidden" name="serverPath" id="serverPath" value="${serverPath}"/>
                            <input type="hidden" name="serverAppPath" id="serverAppPath" value="${serverAppPath}"/>
                            <!-- type 10：渠道 -->
                            <input type="hidden" name="type" value="10"/>
                            <div class="box-body">
                                <div class="form-group">
                                    <label for="code" class="col-sm-2 control-label">渠道编码</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="code" id="code" maxlength="20" placeholder="请输入渠道编码"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="name" class="col-sm-2 control-label">渠道名称</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="name" id="name" maxlength="20" placeholder="请输入渠道名称"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="chargeUser" class="col-sm-2 control-label">负责人</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="chargeUser" id="chargeUser" maxlength="20" placeholder="请输入负责人"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="phone" class="col-sm-2 control-label">联系电话</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="phone" id="phone" maxlength="20" placeholder="请输入联系电话"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="phone" class="col-sm-2 control-label">全流程推广链接</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control copy-input" name="url" id="popularizeUrl" value="" maxlength="200" placeholder="请输入全流程推广链接"/>
                                    </div>
                                    <div class="col-sm-2">
                                        <button type="button" id="btn-generate" name="generate" class="btn btn-primary btn-sm">生成连接</button>
                                        <button type="button" id="btn-copy" name="btnCopyUrl" class="btn btn-primary btn-sm">复制连接</button>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="phone" class="col-sm-2 control-label">App推广链接</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control copy-input" name="appUrl" id="appPopularizeUrl" value="" maxlength="200" placeholder="请输入App推广链接"/>
                                    </div>
                                    <div class="col-sm-2">
                                        <button type="button" id="btn-generate-appUrl" name="generate" class="btn btn-primary btn-sm">生成连接</button>
                                        <button type="button" id="btn-copy-appUrl" name="btnCopyAppUrl" class="btn btn-primary btn-sm">复制连接</button>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="remark" class="col-sm-2 control-label">备注</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="remark" id="remark" maxlength="100" placeholder="请输入备注"/>
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
        $("#btn-generate").unbind("click").bind("click", function (event) {
            var code = $("#code").val();
            if(code == "" || code == null){
                alert("请输入渠道号");
                $("#popularizeUrl").val('');
                return;
            }

            var serverPath = $("#serverPath").val();
            if(serverPath == "" || serverPath == null){
                alert("获取服务器地址失败");
                return;
            }

            var url = serverPath + "/" + "?channelNo=" + code;
            $("#popularizeUrl").val(url);
        });

        $("#btn-copy").zclip({
            path: "${ctx}/assets/plugins/jquery.zclip/ZeroClipboard.swf",
            copy: function(){
                var popularizeUrl = $("#popularizeUrl").val();
                if(popularizeUrl == "" || code == popularizeUrl){
                    alert("还没生成全流程推广连接，请先生成全流程推广连接");
                    return;
                }
                return $("#popularizeUrl").val();
            },
            afterCopy:function(){/* 复制成功后的操作 */
                alert("复制成功");
            }
        });


        $("#btn-generate-appUrl").unbind("click").bind("click", function (event) {
            var code = $("#code").val();
            if(code == "" || code == null){
                alert("请输入渠道号");
                $("#appPopularizeUrl").val('');
                return;
            }

            var serverAppPath = $("#serverAppPath").val();
            if(serverAppPath == "" || serverAppPath == null){
                alert("获取服务器地址失败");
                return;
            }

            var url = serverAppPath + "/" + "?channelNo=" + code;
            $("#appPopularizeUrl").val(url);
        });

        $("#btn-copy-appUrl").zclip({
            path: "${ctx}/assets/plugins/jquery.zclip/ZeroClipboard.swf",
            copy: function(){
                var popularizeUrl = $("#appPopularizeUrl").val();
                if(popularizeUrl == "" || code == popularizeUrl){
                    alert("还没生成App推广连接，请先生成App推广连接");
                    return;
                }
                return $("#appPopularizeUrl").val();
            },
            afterCopy:function(){/* 复制成功后的操作 */
                alert("复制成功");
            }
        });

        $("#btn-cancel").unbind("click").bind("click", function (event) {
            window.location.href = ctx + "/channel/list";
        });

        $("#btn-submit").unbind("click").bind("click", function (event) {
            generateUrl();
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

    function generateUrl() {
        var code = $("#code").val();

        var serverPath = $("#serverPath").val();
        var url = serverPath + "/" + "?channelNo=" + code;
        $("#popularizeUrl").val(url);

        var serverAppPath = $("#serverAppPath").val();
        var appUrl = serverAppPath + "/" + "?channelNo=" + code;
        $("#appPopularizeUrl").val(appUrl);
    }
</script>
</html>