<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
<%--    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />--%>
    <title>大学餐厅菜单推荐</title>
    <base href="<%=basePath%>">
    <link rel="stylesheet" href="static/plugins/layui/css/layui.css"/>
    <link rel="stylesheet" href="static/css/global.css"/>
    <link rel="stylesheet" href="static/css/movieglobal.css"/>
    <script src="static/plugins/layui/layui.js"></script>
    <script src="static/plugins/jquery/jquery.js"></script>
    <script src="static/js/movie.js"></script>
</head>
<body class="indexBody">
    <%--头部--%>
    <jsp:include page="/jsp/common/header.jsp"/>

    <%--轮播图--%>
    <div style="width: 100%;">
        <div class="layui-carousel lunbotuDiv" id="test1" lay-filter="test1">
            <div carousel-item>
                <div>
                    <a href="javascript:">
                        <img src="file/video/images/轮播图/功夫.jpg" width="100%" height="400px" alt="功夫">
                    </a>
                </div>
                <div>
                    <a href="javascript:">
                        <img src="file/video/images/轮播图/狄仁杰2四大天王.jpg" alt="狄仁杰2四大天王" width="100%" height="400px">
                    </a>
                </div>
                <div>
                    <a href="javascript:">
                        <img src="file/video/images/轮播图/过春天.jpg" alt="过春天" width="100%" height="400px">
                    </a>
                </div>
                <div>
                    <a href="javascript:">
                        <img src="file/video/images/轮播图/慎重勇者.jpg" alt="慎重勇者" width="100%" height="400px">
                    </a>
                </div>
                <div>
                    <a href="javascript:">
                        <img src="file/video/images/轮播图/超人高中生们.jpg" alt="超人高中生们" width="100%" height="400px">
                    </a>
                </div>
            </div>
            <a name="skip"></a>
        </div>

        <%--分类筛选div--%>

        <%--美食分类--%>
        <div class="movie-container selectDiv">
            <ul class="selectList" id="select1">
                <span>美食种类：</span>
                <li style="background: #4EBBF9"><a href="javascript:void (0);" style="color: #fff;" typeId="0">全部</a></li>
                <li><a href="javascript:void (0);" typeId="50">主食</a></li>
                <li><a href="javascript:void (0);" typeId="51">包装零食</a></li>
                <li><a href="javascript:void (0);" typeId="52">饮品</a></li>
                <li><a href="javascript:void (0);" typeId="53">小食</a></li>
            </ul>
            <hr>

            <%--细化分类主食，零食，饮品，小食--%>

            <ul class="selectList" id="select2">
                <span>口味标签：</span>
                <li style="background: #4EBBF9"><a href="javascript:void (0);" style="color: #fff;" categoryId="0">全部</a></li>
            </ul>


            <%--学校所在地点--%>
            <hr>
            <ul class="selectList" id="select3">
                <span>校内位置：</span>
                <li style="background: #4EBBF9"><a href="javascript:void (0);" style="color: #fff;">全部</a></li>
                <li><a href="javascript:void (0);">清真食堂</a></li>
                <li><a href="javascript:void (0);">L座一楼自营食堂</a></li>
                <li><a href="javascript:void (0);">L座一楼麦嘉力餐厅</a></li>
                <li><a href="javascript:void (0);">L座二楼自营食堂</a></li>
                <li><a href="javascript:void (0);">L座二楼麦嘉力餐厅</a></li>
                <li><a href="javascript:void (0);">L座二楼教师餐厅</a></li>
                <li><a href="javascript:void (0);">M座食堂一楼西餐厅</a></li>
                <li><a href="javascript:void (0);">M座食堂师生餐厅</a></li>
                <li><a href="javascript:void (0);">其它</a></li>
            </ul>
            <hr>
            <ul class="selectList" id="select4">
                <span>上架时间：</span>
                <li style="background: #4EBBF9"><a href="javascript:void (0);" style="color: #fff;">全部</a></li>
                <li><a href="javascript:void (0);">2019</a></li>
                <li><a href="javascript:void (0);">2018</a></li>
                <li><a href="javascript:void (0);">2017</a></li>
                <li><a href="javascript:void (0);">2016</a></li>
                <li><a href="javascript:void (0);">2015</a></li>
                <li><a href="javascript:void (0);">2014</a></li>
                <li><a href="javascript:void (0);">2013</a></li>
                <li><a href="javascript:void (0);">2012</a></li>
                <li><a href="javascript:void (0);">2011</a></li>
                <li><a href="javascript:void (0);">2010-2000</a></li>
                <li><a href="javascript:void (0);">更早</a></li>
            </ul>
        </div>

        <%--视频列表展示div--%>
        <div class="movie-container videoDiv">

        </div>

        <%--分页按钮--%>
        <div id="pagebtn" class="pagebtnDiv"></div>

        </div>

    <%--底部--%>
    <jsp:include page="/jsp/common/footer.jsp"/>

    <script>
        layer.tab({
            area: ['600px', '300px'],
            tab: [{
                title: 'TAB1',
                content: '内容1'
            }, {
                title: 'TAB2',
                content: '内容2'
            }, {
                title: 'TAB3',
                content: '内容3'
            }]
        });
    </script>

<script type="text/javascript">
/*---------------------------初始化、声明变量和方法 start---------------------------------------------------------*/
    /**
     * 声明分类筛选选择的条件
     */
    var selectType = 0;
    var selectCategory = 0;
    var selectLocation = '全部';
    var selectYear = '全部';

    /*当前页面位置*/
    var pageNum = 1;
    /*分页大小*/
    var pageSize=30;

    /**
     *定义函数以获取下一级分类信息并展示
     */
    function showCategory(pid) {
        var categoryResult = " <span>口味标签：</span> <li style=\"background: #4EBBF9\"><a href=\"javascript:void (0);\" style=\"color: #fff;\" categoryId='0'>全部</a></li> ";
        $.get('category/getByPid/'+pid,function (data) {
            for (var i = 0; i < data.length; i++) {
                categoryResult += " <li><a href=\"javascript:void (0);\" categoryId='"+ data[i].id +"'>" + data[i].categoryName + "</a></li> ";
            }
            $("#select2").html(categoryResult);
        });
    }

    /**
     *页面加载时展示所有视频信息
     */
    $(function () {
        showVideo("video/getAll",pageNum,pageSize);
    });
/*---------------------------初始化、声明变量和方法 end---------------------------------------------------------*/

/*---------------------------绑定筛选条件点击事件 start---------------------------------------------------------*/
    $.each($('.selectList'),function () {
        //给li筛选项绑定点击事件
        $(this).delegate('li','click',function () {

            //把li同辈的选项取消选中样式
            $(this).siblings().each(function () {
                $(this).css('background',"#f9f9f9");
                $(this).children().css("color",'#000');
            });

            //设置为选择状态，添加选中样式
            $(this).css('background',"#4EBBF9");
            $(this).children().css("color",'#fff');



            /*记录选择的条件(频道、类型、地区、年代)的内容*/
            var categoryLevel = $(this).siblings("span").html();
            switch (categoryLevel) {
                case '美食种类：':
                    selectType = $(this).children().attr("typeId");
                    selectCategory = 0;
                    /*根据选择的频道获取下一级的选择条件,如点击动漫，则获取动漫所有类型并展示*/
                    var categoryResult = " <span>口味标签：</span> " + " <li style=\"background: #4EBBF9\"><a href=\"javascript:void (0);\" style=\"color: #fff;\" categoryId='0'>全部</a></li> ";
                    switch ($(this).children().html()) {

                        case '全部': $("#select2").html(categoryResult);break;
                        case '主食': showCategory(50);break;
                        case '包装零食': showCategory(51);break;
                        case '饮品': showCategory(52);break;
                        case '小食': showCategory(53);break;

                    }
                    break;
                case '口味标签：':
                    selectCategory = $(this).children().attr("categoryId");
                    break;
                case '校内位置：':
                    selectLocation = $(this).children().html();
                    break;
                case '上架时间：':
                    selectYear = $(this).children().html();
                    break;
            }
            /*根据条件获取视频数据并展示*/

            var uri = "video/getAllBySelect/"+selectType+"/"+selectCategory+"/"+selectLocation+"/"+selectYear;
            showVideo(uri,pageNum,pageSize);

        });
    });
/*---------------------------绑定筛选条件点击事件 end---------------------------------------------------------*/

/*---------------------------轮播图 start---------------------------------------------------------*/
/*layUI轮播图*/
layui.use(['carousel', 'form','laypage','element'], function(){
    var carousel = layui.carousel
    ,element = layui.element;
    //常规轮播
    carousel.render({
        elem: '#test1'
        ,arrow: 'always'
        ,anim:'fade'
        ,interval: 1800
        ,width:'80%'
        ,height:'400px'
        ,indicator:'inside'
    });
/*---------------------------轮播图 end---------------------------------------------------------*/

});
</script>
</body>
</html>
