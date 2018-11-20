<%@ page language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel (optional) -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="${ctx}/static/images/user2-160x160.jpg" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p>
                    <c:choose>
                        <c:when test="${!empty sessionScope.sys_sessionUser.name}">${sessionScope.sys_sessionUser.name}</c:when>
                        <c:otherwise>用户</c:otherwise>
                    </c:choose>
                </p>
                <!-- Status -->
                <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
        </div>

        <!-- search form (Optional) -->
        <form action="#" method="get" class="sidebar-form">
            <div class="input-group">
                <input type="text" name="q" class="form-control" placeholder="Search...">
                <span class="input-group-btn">
              <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
              </button>
            </span>
            </div>
        </form>
        <!-- /.search form -->

        <!-- Sidebar Menu -->
        <ul class="sidebar-menu" data-widget="tree">
            <li class="header">主导航</li>
            <!-- Optionally, you can add icons to the links -->
            <li class="active"><a href="${ctx}/loan/list"><i class="fa fa-link"></i> <span>极速贷维护</span></a></li>
            <li><a href="${ctx}/creditcard/list"><i class="fa fa-link"></i> <span>信用卡维护</span></a></li>
            <li><a href="${ctx}/banner/list"><i class="fa fa-link"></i> <span>banner维护</span></a></li>
            <li><a href="${ctx}/message/edit"><i class="fa fa-link"></i> <span>首页消息管理</span></a></li>
            <li><a href="${ctx}/user/list"><i class="fa fa-link"></i> <span>用户管理</span></a></li>
            <li><a href="${ctx}/channel/list"><i class="fa fa-link"></i> <span>渠道管理</span></a></li>
        </ul>
        <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
</aside>