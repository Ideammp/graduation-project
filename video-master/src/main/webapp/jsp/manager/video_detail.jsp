<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>${video.name}</title>
    <base href="<%=basePath%>">
    <link rel="stylesheet" href="static/plugins/layui/css/layui.css"  media="all">
    <script src="static/plugins/layui/layui.js"></script>
    <script src="static/plugins/jquery/jquery.js"></script>
    <script src="static/plugins/webUploader/webuploader.js"></script>

    <style type="text/css">
        .layui-layout-admin .layui-body{bottom: 0;}

        .title{line-height: 60px;color: #d0cbc1;margin-left: 20px;}
        .detail-div{box-sizing: border-box; width: 97%; margin: 20px auto;background: #ffffff; border: #e6e1d5 1px solid;border-radius: 5px;}
        .avatar-div{height: 50px;box-sizing: border-box; padding: 10px 20px; background: #e3e3e3;border-top-right-radius: 5px;border-top-left-radius: 5px;}
        .info-div{padding: 30px 20px;box-sizing: border-box;}
        .videoImg{width: 200px;height: 300px;}


        .description-div{flex: 1; display: inline-block; padding: 0 0 0 30px; box-sizing: border-box; vertical-align: middle;}
        .description-line span{ display: inline-block;margin-top: 10px;}
        .description-line span:first-child{line-height: 30px; text-align: start;vertical-align: top; font-weight: 600;font-size: 17px;}
        .description-line span:last-child{line-height: 30px;font-size: 17px;width: 930px;}

        table[id='table']{display: none;}
        .operateBtn{color: #1d1d1d; margin-right: 10px;width: 40px;box-sizing: border-box; background: #fff;padding: 5px 10px;border: #c4bfb5 solid 1px;border-radius: 5px;cursor: pointer;}
        .operateBtn:hover{color: #1d1d1d}
        .operateBtn:last-child{background: #ff5833;color: #fff;margin-right: 0;}
        .operateBtn:last-child:hover{color: #fff}

        .layui-form-label{width:100px}
        .layui-input-block{margin-left: 130px;}
        .videoAddForm{width: 300px; margin:20px 50px;}

        .btn{margin: 20px auto 0 auto;display: inline-block; height: 30px;line-height: 30px; color: #fff; text-align: center; width: 50px;background: #4EBBF9;}
        .btn:hover{ color: #fff; background: #15a8f9;}

    </style>
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">??????????????????????????????????????????</div>
        <!-- ????????????????????????layui???????????????????????? -->
        <a class="layui-layout-left title" style="">
            ????????????
        </a>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <c:if test="${sessionScope.admin == null}">
                        <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                        ?????????
                    </c:if>
                    <c:if test="${sessionScope.admin != null}">
                        <img src="${sessionScope.admin.img}" class="layui-nav-img">
                        ${sessionScope.admin.name}
                    </c:if>
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">????????????</a></dd>
                    <dd><a href="">????????????</a></dd>
                </dl>
            </li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- ??????????????????????????????layui???????????????????????? -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item">
                    <a href="jsp/manager/index.jsp">??????</a>
                </li>
                <li class="layui-nav-item">
                    <a class="" href="javascript:;">????????????</a>
                    <dl class="layui-nav-child">
                        <dd><a href="manager/user/list">????????????</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item layui-nav-itemed">
                    <a href="javascript:;">????????????</a>
                    <dl class="layui-nav-child">
                        <dd class="layui-this"><a href="manager/video/list">????????????</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">??????????????????</a>
                    <dl class="layui-nav-child">
                        <dd><a href="manager/category/list">??????????????????</a></dd>
                        <dd><a href="manager/category/add">????????????</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- ?????????????????? -->
        <div class="detail-div">
            <div class="avatar-div">
                <h2 >????????????</h2>
            </div>
            <div class="info-div">
                <div style="display: flex;">
                    <img class="videoImg" src="${video.imgSrc}" alt="${video.name}">
                    <div class="description-div">
                        <h1>${video.name}</h1>
                        <div class="description-line">
                            <span>?????????</span>
                            <span>${video.starring}</span>
                        </div>
                        <div class="description-line">
                            <span>?????????</span>
                            <span><c:forEach items="${video.categoryList}" var="category">${category.categoryName} </c:forEach></span>
                        </div>
                        <div class="description-line">
                            <span>?????????</span>
                            <span>
                                <c:if test="${video.finished}">?????????  ???${video.totalEpisode}???</c:if>
                                <c:if test="${!video.finished}">?????????  ?????????${video.currentEpisode}???</c:if>
                            </span>
                        </div>
                        <div class="description-line">
                            <span>?????????</span>
                            <span>${video.description}</span>
                        </div>
                    </div>
                </div>

                <%--????????????????????????--%>

                <div class="episode-block">
                    <div style="border: #beb9b0 solid 1px;margin-top: 30px;border-radius: 5px;">
                        <div style="border-bottom: #beb9b0 solid 1px;height:40px;">
                            <h2 style="margin:10px 0 10px 15px;">????????????</h2>
                        </div>
                        <div style="padding:20px;">
                            <table id="table" lay-filter="table">
                                <thead>
                                    <tr>
                                        <th lay-data="{field:'episode',width:100,sort:true}">?????????</th>
                                        <th lay-data="{field:'title'}">??????</th>
                                        <th lay-data="{field:'statue',minWidth:60}">??????</th>
                                        <th lay-data="{field:'progress',minWidth:120}">??????</th>
                                        <th lay-data="{field:'publishDate',sort: true}">????????????</th>
                                        <th lay-data="{field:'operate',minWidth:301}">??????</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${episodes}" var="obj">
                                        <tr>
                                            <td>${obj.episode}</td>
                                            <td>${obj.title}</td>
                                            <td><div class="statue" objId="${obj.id}"><c:if test="${obj.fileName == null || obj.fileName == ''}">?????????</c:if><c:if test="${obj.fileName != null && obj.fileName != ''}">?????????</c:if></div></td>
                                            <td><div class="progress" objId="${obj.id}"><c:if test="${obj.fileName == null || obj.fileName == ''}">0%</c:if><c:if test="${obj.fileName != null && obj.fileName != ''}">100%</c:if></div></td>
                                            <td><fmt:formatDate value="${obj.uploadDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                            <td>
                                                <a class="operateBtn uploadBtn" objId="${obj.id}" style="display: none"></a>
                                                <a class="operateBtn" lay-event="upload" objId="${obj.id}"><c:if test="${obj.fileName == null || obj.fileName == ''}">??????</c:if><c:if test="${obj.fileName != null && obj.fileName != ''}">????????????</c:if></a>
                                                <a class="operateBtn" lay-event="update">??????</a>
                                                <a class="operateBtn" objId="${obj.id}" lay-event="delete">??????</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div style="width: 100%;text-align: center;margin-top: 10px;">
                    <a class="btn" style="" href="manager/video/list">??????</a>
                </div>
            </div>
        </div>
    </div>

    <div style="display: none" id="addForm" >
            <form class="layui-form videoAddForm" style="width: 500px;" method="get" action="manager/video/add">
                <div class="layui-form-item">
                    <label class="layui-form-label">????????????</label>
                    <div class="layui-input-block">
                        <input id="episode" type="text" name="episode" lay-verify="" autocomplete="off" placeholder="?????????????????????????????????" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">???????????????</label>
                    <div class="layui-input-block">
                        <input id="title" type="text" name="title" lay-verify="" autocomplete="off" placeholder="?????????????????????" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block" style="margin-top: 50px;">
                        <button type="submit" id="submit" class="layui-btn" style="margin-right: 60px;margin-left: 70px;" lay-submit="" lay-filter="demo1">????????????</button>
                    </div>
                </div>
        </form>
    </div>
    <div style="display: none" id="updateForm" >
        <form class="layui-form videoAddForm" style="width: 500px;" method="get" action="manager/video/add">
            <div class="layui-form-item">
                <label class="layui-form-label">????????????</label>
                <div class="layui-input-block">
                    <input id="episode2" type="text" name="episode" lay-verify="" autocomplete="off" placeholder="?????????????????????????????????" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">???????????????</label>
                <div class="layui-input-block">
                    <input id="title2" type="text" name="title" lay-verify="" autocomplete="off" placeholder="?????????????????????" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block" style="margin-top: 50px;">
                    <button type="submit" id="submit2" class="layui-btn" style="margin-right: 60px;margin-left: 70px;" lay-submit="" lay-filter="demo1">????????????</button>
                </div>
            </div>
        </form>
    </div>
</div>

<script type="text/html" id="toolbarLeft">
    <div class="layui-inline" title="????????????????????????" lay-event="uploadVideo">
        <i class="layui-icon layui-icon-add-1" style="color: #77746e">
        </i>
    </div>
</script>

<script>
$(".layui-nav-item").click(function () {
    $(".layui-nav-item").not(this).removeClass('layui-nav-itemed');
    $(".layui-nav-bar").css({top: $(this).position().top+'px'})
});
//JavaScript????????????
layui.use(['element','table','layer','jquery','form','laydate','upload'], function() {
    var element = layui.element
        , table = layui.table
        , layer = layui.layer
        , $ = layui.jquery
        , upload = layui.upload;

    // webuploader?????????????????????
    // ????????????
    var fileMd5;
    //?????????uploader???????????????
    WebUploader.Uploader.register({
        "before-send-file":"beforeSendFile"
        ,"before-send":"beforeSend"
        ,"after-send-file":"afterSendFile"
    },{
        //?????????1???????????????????????????????????????
        beforeSendFile:function (file) {
            //????????????defferred
            var deferred = WebUploader.Deferred();
            //1.??????????????????????????????MD5?????????????????????????????????
            uploader.md5File(file,0,3*1024*1024)
                .progress(function (percentage) {
                    $(".statue[objId="+ objId + "]").html("????????????????????????");
                })
                .then(function (val) {
                    fileMd5 = val;
                    $(".statue[objId="+ objId + "]").html("??????????????????");
                    //????????????????????????????????????????????????
                    deferred.resolve();
                });
            //2.?????????????????????????????????????????????????????????????????????????????????????????????
            return deferred.promise();
        }
        //?????????2??????????????????????????????????????????????????????????????????
        ,beforeSend:function (block) {
            console.log(fileMd5);
            var deferred = WebUploader.Deferred();

            //1.???????????????????????????????????????????????????????????????????????????????????????????????????
            $.ajax({
                type:"post"
                ,url:'manager/video/detail/checkChunk'
                ,data:{
                    fileMd5:fileMd5
                    ,chunk:block.chunk
                    ,chunkSize:block.end-block.start
                },
                dataType:'json'
                ,success:function (result) {
                    if (result.ifExist) {
                        //??????????????????????????????
                        deferred.reject();
                    }else{
                        //?????????????????????????????????????????????????????????
                        deferred.resolve();
                    }
                }
            });
            this.owner.options.formData.fileMd5 = fileMd5;
            return deferred.promise();
        }
        //?????????3????????????????????????????????????????????????
        ,afterSendFile:function (file) {
            //1.????????????????????????????????????????????????????????????
            $.ajax({
                url:"manager/video/detail/mergeChunks"
                ,type:"post"
                ,data:{
                    fileMd5:fileMd5
                    ,fileName:fileName + file.name.substring(file.name.lastIndexOf("."))
                }
                ,success:function (result) {
                    var statue = $(".statue[objId="+ objId + "]");
                    var progress = $(".progress[objId="+objId+"]");
                    var uploadBtn = $(".upload[objId="+objId+"][lay-event='upload']");

                    statue.html("?????????");
                    progress.html("100%");
                    uploadBtn.html("????????????");
                    uploader.reset();

                    $.ajax({
                        url:'manager/video/detail/updDetailAndDate'
                        ,type:'post'
                        ,data:{
                            id:objId,
                            fileName:result
                        }
                        ,success:function () {
                            location.reload();
                        }
                    })
                }
            })
        }
    });

    // webuploader????????????
    var uploader = WebUploader.create({
        //flash???????????????
        swf:"static/plugins/webUploader/Uploader.swf"
        //??????????????????????????????
        ,server:"manager/video/detail/upload"
        //????????????????????????
        ,pick:$(".uploadBtn")
        //????????????
        ,auto:true
        //??????????????????
        ,chunked:true
        ,chunkSize:5*1024*1024
    });

    //?????????????????????????????????????????????
    //??????fileQueued???????????????????????????????????????
    //file??????????????????????????????
    uploader.on("fileQueued",function (file) {
        $(".statue[objId="+ objId + "]").html("????????????...")
    });

    //????????????????????????
    // percentage:????????????????????? 0.14  1
    uploader.on("uploadProgress",function (file,percentage) {
        var statue = $(".statue[objId="+ objId + "]");
        var progress = $(".progress[objId="+objId+"]");
        var uploadBtn = $(".upload[objId="+objId+"][lay-event='upload']");

        if(percentage == 1){
            statue.html("???????????????????????????");
            progress.html("99%");
        }else{
            statue.html("???????????????");
            progress.html(Math.floor(percentage*100) + "%");
        }
    });



    table.init('table', {
        limit: 10 //???????????????????????? limit ??????????????????10????????????????????????????????????????????????
        ,page: true //????????????
        ,toolbar: '#toolbarLeft'
        //????????????????????????
        ,success:function () {
        }
    });


    $("form").submit(function () {
        return false;
    });
    table.on('toolbar(table)',function (obj) {
        switch(obj.event){
            case 'uploadVideo':    //????????????????????????
                layer.open({
                    type:1
                    ,title:'????????????????????????'
                    ,area:['600px','350px']
                    ,content:$("#addForm")
                    ,success:function () {
                        $("#submit").on('click',function () {
                            $.ajax({
                                url:"manager/video/detail/addVideoDetail/"+${video.id}
                                ,type:"post"
                                ,data:{
                                    episode:$("#episode").val()
                                    ,title:$("#title").val()
                                }
                                ,success:function (data) {
                                    if (data.code == 1) {
                                        layer.msg("????????????????????????");
                                        setTimeout(function () {
                                            layer.close();
                                            location.reload();
                                        },700)
                                    }else{
                                        layer.msg("????????????????????????");
                                    }
                                }
                            })
                        })
                    }
                });
                break;
        }
    });


    var objId;
    var fileName;
    var isFirst = true; //???????????????

    table.on('tool(table)',function (obj) {
        var data = obj.data;

        switch(obj.event){
            case 'upload':           //????????????
                var progress = $(".progress[objId="+objId+"]");
                if(progress.html() != '100%' && progress.html() != '0%' && !isFirst){
                    layer.msg("????????????????????????????????????");
                    break;
                }
                isFirst = false;
                objId = $(this).prev(".uploadBtn").attr("objId");
                if (0<data.episode < 10){
                    fileName = '${video.name}'+ '-0' + data.episode;
                } else{
                    fileName = '${video.name}'+ '-' + data.episode;
                }
                $(".uploadBtn[objId=" + objId + "]").find("input").trigger('click');
                break;

            case 'update':         //??????????????????
                var id = $(this).prev().prev(".uploadBtn").attr("objId");
                layer.open({
                    type:1
                    ,title:'????????????????????????'
                    ,area:['600px','350px']
                    ,content:$("#updateForm")
                    ,success:function () {
                        $("#submit2").on('click',function () {
                            $.ajax({
                                url:"manager/video/detail/updDetail"
                                ,type:"post"
                                ,data:{
                                    id:id
                                    ,episode:$("#episode2").val()
                                    ,title:$("#title2").val()
                                }
                                ,success:function (data) {
                                    if (data.code == 1) {
                                        layer.msg("????????????????????????");
                                        setTimeout(function () {
                                            layer.close();
                                            location.reload();
                                        },700)
                                    }else{
                                        layer.msg("????????????????????????");
                                    }
                                }
                            })
                        })
                    }
                });
                break;
            case 'delete':
                var id1 = $(this).attr("objId");
                layer.confirm('?????????????????? \"'+ data.title + '\" ?', {title:'??????'}, function(index){
                    $.get('manager/video/detail/del?id='+id1,function (data) {
                        if (data >= 1){
                            layer.msg("????????????");
                            obj.del();
                        }else{
                            layer.msg("????????????");
                        }
                    });
                    layer.close(index);
                });
                break;
        }
    });

})
</script>

</body>
</html>
