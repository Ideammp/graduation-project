<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>添加分类</title>
    <base href="<%=basePath%>">
    <link rel="stylesheet" href="static/plugins/layui/css/layui.css"  media="all">
    <script src="static/plugins/layui/layui.js"></script>
    <script src="static/plugins/jquery/jquery.js"></script>

    <style type="text/css">
        .input-line{height: 30px;margin-top: 20px;line-height: 30px;}
        label{font-size: 16px;height: 30px; line-height: 30px;}
        .name-input{width: 200px;height: 30px;line-height: 30px;border: #bab6ad solid 1px;border-radius: 5px;outline: none;padding-left: 6px;box-sizing: border-box;}
        .layui-form-select{width: 200px;height: 30px;display: inline-block;}
        .submitBtn{width: 80px;height: 30px;cursor: pointer;color: #fff; margin:40px 0 0 90px;border-radius: 5px;background: #4EBBF9;border: 0;}
        .submitBtn:hover{background: #09a9f9;}
    </style>
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">大学餐厅菜单推荐后台管理系统</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <a class="layui-layout-left title" style="">
            分类列表
        </a>
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

        <%--面包屑导航--%>
        <span class="layui-breadcrumb">
          <a href="">菜品后台</a>
          <a href="">菜品分类管理</a>
          <a href="">添加菜品分类</a>
        </span>

        <div style="padding: 15px;">
            <div style="width: 50%;margin: 20px auto; border: #beb9b0 solid 1px;border-radius: 5px;">
                <div style="border-bottom: #beb9b0 solid 1px;height:40px;">
                    <h2 style="margin:10px 0 10px 15px;">添加分类</h2>
                </div>
                <div style="padding:20px;width: 60%;margin: 0 auto;">
                    <form class="layui-form" >
                        <div class="input-line">
                            <label for="">口味标签：</label>
                            <input class="name-input"name="" type="text">
                        </div>
                        <div class="input-line">
                            <label for="">菜品种类：</label>
                            <select class="select" name="pid">
                                <option value="0">无</option>
                                <c:forEach var="obj" items="${type}">
                                    <option value="${obj.id}">${obj.categoryName}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <input type="submit" class="submitBtn">
                    </form>
                </div>
            </div>
        </div>
    </div>

</div>

<script>
    $(".layui-nav-itemed").trigger('mouseenter');
    $(".layui-nav-item").click(function () {
        $(".layui-nav-item").not(this).removeClass('layui-nav-itemed');
        $(".layui-nav-bar").css({top: $(this).position().top+'px'})
    });
    //JavaScript代码区域
    layui.use(['element','table','layer'], function() {
            var element = layui.element
                , table = layui.table
                , layer = layui.layer;


            $(".submitBtn").click(function () {
                var name = $(".name-input").val();
                if (name == '' || name == null){
                    layer.msg("请填写口味名称！");
                } else{
                    $.ajax({
                        url:"manager/category/addCategory"
                        ,type:'post'
                        ,data:{'name':name,'pid':$(".select").val()}
                        ,success:function (data) {
                            if (data.result == 1){
                                layer.msg("添加成功!");
                            }
                        }
                    });
                }
                return false;
            })
    });

</script>
</body>
</html>
