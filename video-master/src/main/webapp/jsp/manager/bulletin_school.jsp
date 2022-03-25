<%--
  Created by IntelliJ IDEA.
  User: 香香的牛粪
  Date: 2022/3/12
  Time: 21:32
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
    <title>公告管理</title>
    <base href="<%=basePath%>">
    <link rel="stylesheet" href="static/plugins/layui/css/layui.css"  media="all">
    <script src="static/plugins/layui/layui.js"></script>
    <script src="static/plugins/jquery/jquery.js"></script>
    <style type="text/css">


        .operateBtn{color: #1d1d1d; margin-right: 20px;width: 50px;box-sizing: border-box; background: #fff;padding: 5px 10px;border: #c4bfb5 solid 1px;border-radius: 5px;cursor: pointer;}
        .operateBtn:hover{color: #1d1d1d}
        .operateBtn:last-child{background: #ff5833;color: #fff}
        .operateBtn:last-child:hover{color: #fff}


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

            <%--面包屑导航--%>
            <span class="layui-breadcrumb">
              <a href="">菜品后台</a>
              <a href="">公告管理</a>
              <a href="">校内公告管理</a>
            </span>

            <div style="padding: 15px;">
                <div class="searchDiv">
                    <form class="layui-form" action="" method="post">
                        <span style="">搜索栏</span>

                        <label for="type">公告类别：</label>
                        <div class="layui-input-inline" style="width: 150px;">
                            <select name="type" lay-filter="type" id="type">
                                <option value="">--请选择--</option>
                                <c:forEach items="${type}" var="obj">
                                    <option value="${obj.id}" <c:if test="${video.type == obj.id}">selected="selected"</c:if>>${obj.categoryName}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <label for="type">公告时间：</label>
                        <div class="layui-input-inline" style="width: 150px;">
                            <select name="year" lay-filter="type" id="year">
                                <option value="">--请选择--</option>
                                <c:forEach items="${type}" var="obj">
                                    <option value="${obj.id}" <c:if test="${video.type == obj.id}">selected="selected"</c:if>>${obj.categoryName}</option>
                                </c:forEach>
                            </select>
                        </div>


                        <input type="submit" class="searchBtn" style="" value="搜 索">

                    </form>
                </div>


                <div style="border: #beb9b0 solid 1px;margin-top: 20px;border-radius: 5px;">
                    <div style="border-bottom: #beb9b0 solid 1px;height:40px;">
                        <h2 style="margin:10px 0 10px 15px;">校内公告管理</h2>
                    </div>
                    <div style="padding:20px;">
                        <div id="demo" lay-filter="demo"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%--新增公告--%>
    <div style="display: none" id="addForm" >
        <form class="layui-form videoAddForm" style="width: 500px;">
            <div class="layui-form-item">
                <label class="layui-form-label">公告标题：</label>
                <div class="layui-input-block">
                    <input id="title" type="text" name="name" lay-verify="required" autocomplete="off" placeholder="请输入告示标题" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">告示发布时间：</label>
                    <div class="layui-input-inline">
                        <input type="text" name="year" class="layui-input" id="year2" placeholder="yyyy">
                    </div>
                </div>
            </div>

            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">告示内容：</label>
                <div class="layui-input-block">
                    <textarea name="description" id="description" placeholder="请输入告示的内容：" class="layui-textarea"></textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block" style="margin-top: 50px;">
                    <button type="submit" id="submit" class="layui-btn" style="margin-right: 60px;" lay-submit="" lay-filter="demo1">立即提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>




    <script type="text/html" id="toolbarLeft">
        <div class="layui-inline" title="添加告示" lay-event="addSchoolBulletin">
            <i class="layui-icon layui-icon-add-1" style="color: #77746e">
            </i>
        </div>
    </script>


    <script>
        $(".layui-nav-itemed").trigger('mouseenter');
        $(".layui-nav-item").click(function () {
            $(".layui-nav-item").not(this).removeClass('layui-nav-itemed');
            $(".layui-nav-bar").css({top: $(this).position().top+'px'})
        });

        //javaScript代码区域
        layui.use(['element','table','layer','jquery','form','laydate','upload'], function(){

            var element = layui.element
                ,table = layui.table
                ,layer = layui.layer
                ,$ = layui.jquery
                ,form = layui.form
                ,laydate = layui.laydate
                ,upload = layui.upload;






            table.render({
                elem: '#demo'
                ,url:'bulletin/getSchoolAll'
                ,toolbar: 'true'
                ,toolbar: '#toolbarLeft'
                ,cols: [[
                    {type:'checkbox', width:60, title: '全选'}
                    ,{type:'numbers', width:60, title: '序号'}
                    ,{field:'schoolBulletinTitle', title: '标题',minWidth: 80}
                    ,{field:'schoolBulletinContent',  title: '告示内容',minWidth:100}
                    ,{field:'schoolUplodDate', title: '通知时间'}
                    ,{field:'operate',title:'操作'
                        ,templet:function (d) {
                            return '<div><a href="bulletin/school/detail/'+ d.id +'" class="operateBtn">查看</a><a class="operateBtn" lay-event="delete">删除</a></div>';
                        }
                    }
                ]]
                ,page: {
                    layout: [ 'count', 'prev', 'page', 'next', 'skip','limit']
                    ,limit:10
                }

            });


            table.on('tool(demo)', function(obj) {
                var data = obj.data; //获得当前行数据
                var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
                if (layEvent == 'delete'){
                    layer.confirm('确认删除标题为 \"'+ data.schoolBulletinTitle + '\"的告示吗 ?', {title:'提示'}, function(index){


                        $.get('bulletin/school/delete/'+data.id,function (data) {
                            if (data >= 1){
                                layer.msg("删除成功");
                                obj.del();
                            }else{
                                layer.msg("删除失败");
                            }
                        });
                        layer.close(index);
                    });
                }
            })


            /*添加告示
            * 表单提交
            * */



            table.on('toolbar(demo)', function(obj){
                switch(obj.event){
                    case 'addSchoolBulletin':    //添加校内告示
                        layer.open({
                            type:1
                            ,title:'添加告示'
                            ,area:['700px','720px']
                            ,content:$("#addForm")
                            ,success:function () {

                                $("#submit").click(function () {
                                    var year = $("#year2").val();
                                    var title = $("#title").val();
                                    var description = $("#description").val();
                                    if (title == '' || title == null){
                                        layer.msg("请填写告示标题！！！");
                                    }else if (year == '' || year == null){
                                        layer.msg("请填写告示发布的时间！！！")
                                    }else if (description == ''||description == null){
                                        lay.msg("请填写告示内容！！！")
                                    } else{
                                        $.ajax({
                                            url:"bulletin/school/addNewBulletin"
                                            ,type:'post'
                                            ,data:{'title':title,'content':description,'date':year}
                                            ,success:function (data) {
                                                if (data.result == 1){
                                                    layer.msg("添加成功!");
                                                }
                                            }
                                        });
                                    }
                                    return false;
                                })


                            }
                        });
                        break;
                }
            });






        })



    </script>




</body>

</html>
