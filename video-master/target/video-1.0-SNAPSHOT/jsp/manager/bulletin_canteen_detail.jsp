<%--
  Created by IntelliJ IDEA.
  User: 香香的牛粪
  Date: 2022/3/14
  Time: 14:38
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>校内公告</title>

    <%--加载资源--%>
    <base href="<%=basePath%>">

    <link rel="stylesheet" href="static/plugins/layui/css/layui.css"  media="all">
    <script src="static/plugins/layui/layui.js"></script>
    <script src="static/plugins/jquery/jquery.js"></script>
    <style type="text/css">
        .title{line-height: 60px;color: #d0cbc1;margin-left: 20px;}
        .detail-div{box-sizing: border-box; width: 50%; margin: 50px auto;background: #f9f9f9; border: #fff9ec 1px solid;border-radius: 5px;}
        .avatar-div{height: 70px;background: #e3e3e3;border-top-right-radius: 5px;border-top-left-radius: 5px;}
        .avatar-img{border-radius: 100%;height: 50px;width: 70px;margin: 10px 20px;}
        .info-div{margin: 30px 0;}
        .info-div div{height: 40px;}
        span:nth-child(1){font-size: 15px;vertical-align: middle; display: inline-block;font-weight: 600; margin-right: 20px;height:30px;line-height: 30px; text-align: right;}
        span:nth-child(2){font-size: 15px;display: inline-block;vertical-align: middle;height:30px;line-height: 30px; }
    </style>

</head>
<body>

<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">大学餐厅菜单后台管理系统</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->

        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <c:if test="${sessionScope.admin == null}">
                        <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                        未登录
                    </c:if>
                    <c:if test="${sessionScope.admin != null}">
                        <img src="${sessionScope.admin.img}" class="layui-nav-img">
                        ${sessionScope.admin.name}
                    </c:if>
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
        </ul>
    </div>
    <%--左侧导航内容--%>
    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-this">
                    <a href="jsp/manager/index.jsp">首页</a>
                </li>
                <li class="layui-nav-item">
                    <a class="" href="javascript:;">用户管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="manager/user/list">用户列表</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item layui-nav-itemed">
                    <a href="javascript:;">菜品管理</a>
                    <dl class="layui-nav-child">
                        <dd class="layui-this"><a href="manager/video/list">菜品列表</a></dd>
                    </dl>
                </li>


                <li class="layui-nav-item">
                    <a href="javascript:;">菜品分类管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="manager/category/list">菜品分类列表</a></dd>
                        <dd><a href="manager/category/add">添加分类</a></dd>
                    </dl>
                </li>

                <%--公告管理--%>
                <li class="layui-nav-item">
                    <a href="javascript:;">公告管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="manager/schoolBulletin/list">校内公告管理</a></dd>
                        <dd><a href="manager/canteenBulletin/list">餐厅公告管理</a></dd>
                    </dl>
                </li>


            </ul>
        </div>
    </div>


    <div class="layui-body">
        <!-- 内容主体区域 -->

        <div class="detail-div">
            <div class="info-div">
                <div>
                    <span>标题：</span>
                    <span>${cbulletin.canteenBulletinTitle}</span>
                </div>
                <div>
                    <span>告示内容：</span>
                    <span>${cbulletin.canteenBulletinContent}</span>
                </div>
                <div>
                    <span>告示发布时间：</span>
                    <span>${cbulletin.canteenUplodDate}</span>
                </div>


                <div style="width: 100%;text-align: center;margin-top: 10px;">
                    <a style="margin: 0 auto;display: inline-block; height: 30px;line-height: 30px; color: #fff; text-align: center; width: 50px;background: #4EBBF9;" href="jsp/manager/bulletin_canteen.jsp">返回</a>
                </div>
            </div>
        </div>
    </div>







</div>







</body>
</html>
