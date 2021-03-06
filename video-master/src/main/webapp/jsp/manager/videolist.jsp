<%@ page import="com.example.pojo.Video" %>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>่ๅๅ่กจ</title>
    <base href="<%=basePath%>">
    <link rel="stylesheet" href="static/plugins/layui/css/layui.css"  media="all">
    <script src="static/plugins/layui/layui.js"></script>
    <script src="static/plugins/jquery/jquery.js"></script>
    <style type="text/css">
        .layui-layout-admin .layui-body {bottom:0}
        .layui-layout-admin .layui-side .layui-nav .layui-nav-item > a {padding-top: 8px;padding-bottom: 8px;cursor: pointer;}

        .title{line-height: 60px;color: #d0cbc1;margin-left: 20px;}
        .searchDiv{padding-bottom: 10px; background: #e0e0e0;font-size: 20px;color: #696969;line-height: 50px;border-radius: 5px;}
        .searchDiv span{margin-left:10px;}
        .searchDiv label{width: 90px; display: inline-block;vertical-align: middle;padding-left: 8px; margin-left: 20px;text-align: center; height: 30px;line-height: 30px;box-sizing:border-box;border: #95918a solid 1px;border-radius: 5px; font-size: 15px;color: black;background: #f8f8f8;}
        .searchDiv input{padding-left: 12px; vertical-align: middle;height: 30px;border: #95918a solid 1px;border-radius: 5px;font-size: 15px;color: black;background: #f8f8f8;box-sizing:border-box;}
        .searchDiv input:last-child{vertical-align: middle;height: 30px;font-size: 15px;width: 80px;color: #fff;margin-left: 20px; border-radius: 5px;background: #4EBBF9;border: #d9d4c9 1px solid;padding-left: 0;cursor: pointer;}
        .layui-form-select{height: 30px;width: 100%;font-size: 15px;}
        .layui-form-select dl { max-height:200px; }
        .layui-form-item .layui-input-inline{width: 150px ;}
        table[id='demo']{display: none;}

        .operateBtn{color: #1d1d1d; margin-right: 5px;width: 40px;box-sizing: border-box; background: #fff;padding: 5px 10px;border: #c4bfb5 solid 1px;border-radius: 5px;cursor: pointer;}
        .operateBtn:hover{color: #1d1d1d}
        .operateBtn:last-child{background: #ff5833;color: #fff;margin-right: 0;}
        .operateBtn:last-child:hover{color: #fff}

        .videoAddForm{width: 300px; margin:20px 50px;}
        .videoUpdateForm{width: 300px; margin:20px 50px;}

        .layui-layer-title{ background: #24262F !important;color: #ffffff !important;height: 50px !important;line-height: 50px;border: 0;}
        .layui-layer-ico:before {background: none !important;content: "\1006"}
        .layui-layer-setwin a{font-family: layui-icon !important;font-size: 16px !important;font-style: normal;-webkit-font-smoothing: antialiased;-moz-osx-font-smoothing: grayscale;color: #ffffff;}
    </style>
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">ๅคงๅญฆ้คๅ่ๅๆจ่ๅๅฐ็ฎก็็ณป็ป</div>
        <!-- ๅคด้จๅบๅ๏ผๅฏ้ๅlayuiๅทฒๆ็ๆฐดๅนณๅฏผ่ช๏ผ -->

        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <c:if test="${sessionScope.admin == null}">
                        <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                        ๆช็ปๅฝ
                    </c:if>
                    <c:if test="${sessionScope.admin != null}">
                        <img src="${sessionScope.admin.img}" class="layui-nav-img">
                        ${sessionScope.admin.name}
                    </c:if>
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">ๅบๆฌ่ตๆ</a></dd>
                    <dd><a href="">ๅฎๅจ่ฎพ็ฝฎ</a></dd>
                </dl>
            </li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- ๅทฆไพงๅฏผ่ชๅบๅ๏ผๅฏ้ๅlayuiๅทฒๆ็ๅ็ดๅฏผ่ช๏ผ -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item">
                    <a href="jsp/manager/index.jsp">้ฆ้กต</a>
                </li>
                <li class="layui-nav-item">
                    <a class="" href="javascript:;">็จๆท็ฎก็</a>
                    <dl class="layui-nav-child">
                        <dd><a href="manager/user/list">็จๆทๅ่กจ</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item layui-nav-itemed">
                    <a href="javascript:;">่ๅ็ฎก็</a>
                    <dl class="layui-nav-child">
                        <dd class="layui-this"><a href="manager/video/list">่ๅๅ่กจ</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">่ๅๅ็ฑป็ฎก็</a>
                    <dl class="layui-nav-child">
                        <dd><a href="manager/category/list">่ๅๅ็ฑปๅ่กจ</a></dd>
                        <dd><a href="manager/category/add">ๆทปๅ?ๅ็ฑป</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- ๅๅฎนไธปไฝๅบๅ -->

        <%--้ขๅๅฑๅฏผ่ช--%>
        <span class="layui-breadcrumb">
          <a href="">่ๅๅๅฐ</a>
          <a href="">่ๅ็ฎก็</a>
          <a href="">่ๅๅ่กจ</a>
        </span>

        <div style="padding: 15px;">
            <div class="searchDiv">
                <form class="layui-form" action="manager/video/search" method="post">
                    <span style="">ๆ็ดขๆ?</span>

                    <label>่ๅๅ็งฐ๏ผ</label>
                    <input type="text" name="name" placeholder="Search">

                    <label for="type">่ๅ็ง็ฑป๏ผ</label>
                    <div class="layui-input-inline" style="width: 150px;">
                        <select name="type" lay-filter="type" id="type">
                            <option value="">--่ฏท้ๆฉ--</option>
                            <c:forEach items="${type}" var="obj">
                                <option value="${obj.id}" <c:if test="${video.type == obj.id}">selected="selected"</c:if>>${obj.categoryName}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <label for="category">ๅฃๅณๆ?็ญพ๏ผ</label>
                    <div class="layui-input-inline" style="width: 150px;">
                        <select name="category" lay-filter="category" id="category">
                            <option value="">--่ฏท้ๆฉ--</option>
                        </select>
                    </div>
                    <br>

                    <label style="margin-left: 95px; width:150px">่ๅไธๆถๆถ้ด๏ผ</label>
                    <div class="layui-input-inline" style="width: 150px;">
                        <select name="year" lay-filter="year" id="year">
                            <option value="">--่ฏท้ๆฉ--</option>
                            <option value="2019" <c:if test="${year == '2019'}">selected="selected"</c:if>>2019</option>
                            <option value="2018" <c:if test="${year == '2018'}">selected="selected"</c:if>>2018</option>
                            <option value="2017" <c:if test="${year == '2017'}">selected="selected"</c:if>>2017</option>
                            <option value="2016" <c:if test="${year == '2016'}">selected="selected"</c:if>>2016</option>
                            <option value="2015" <c:if test="${year == '2015'}">selected="selected"</c:if>>2015</option>
                            <option value="2014" <c:if test="${year == '2014'}">selected="selected"</c:if>>2014</option>
                            <option value="2013" <c:if test="${year == '2013'}">selected="selected"</c:if>>2013</option>
                            <option value="2012" <c:if test="${year == '2012'}">selected="selected"</c:if>>2012</option>
                            <option value="2011" <c:if test="${year == '2011'}">selected="selected"</c:if>>2011</option>
                            <option value="2010-2000">2010-2000</option>"
                            <option value="ๆดๆฉ">ๆดๆฉ</option>
                        </select>
                    </div>

                    <label style="margin-left: 60px;" >่ๅ็ถๆ๏ผ</label>
                    <div class="layui-input-inline" style="width: 150px;">
                        <select name="finished"  lay-filter="state" id="state">
                            <option value="">--่ฏท้ๆฉ--</option>
                            <option value="0" <c:if test="${video.finished == false}">selected="selected"</c:if>>่ๅๆชไธๆถ</option>
                            <option value="1" <c:if test="${video.finished == true}">selected="selected"</c:if>>็ซ็ญๅฎๅไธญ</option>
                        </select>
                    </div>

                    <input type="submit" class="searchBtn" style="" value="ๆ ็ดข">
                </form>
            </div>

            <div style="border: #beb9b0 solid 1px;margin-top: 30px;border-radius: 5px;">
                <div style="border-bottom: #beb9b0 solid 1px;height:40px;">
                    <h2 style="margin:10px 0 10px 15px;">่ๅๅ่กจ</h2>
                </div>
                <div style="padding:20px;">
                    <table  id="demo" lay-filter="demo" >
                        <thead>
                        <tr>
                            <th lay-data="{type:'checkbox', width:60}">ๅจ้</th>
                            <th lay-data="{type:'numbers', width:60}">ๅบๅท</th>
                            <th lay-data="{field:'name',minWidth: 150}">่ๅๅ</th>
                            <th lay-data="{field:'type', width:80}">่ๅ็ฑปๅ</th>
                            <th lay-data="{field:'categoryList'}">ๅฃๅณๆ?็ญพ</th>
                            <th lay-data="{field:'starring',minWidth:120}">็ชๅฃ่ด่ดฃไบบ</th>
                            <th lay-data="{field:'location',sort: true}">ๆ?กๅไฝ็ฝฎ</th>
                            <th lay-data="{field:'publishDate'}">่ๅไธๆถๆถ้ด</th>
                            <th lay-data="{field:'finished'}">่ๅ็ถๆ</th>
                            <th lay-data="{field:'operate',width:222}">ๆไฝ</th>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${videos}" var="obj">
                                <tr>
                                    <td> </td>
                                    <td> </td>
                                    <td>${obj.name}</td>
                                    <td>${obj.typeName}</td>
                                    <td>
                                        <c:forEach items="${obj.categoryList}" var="category">
                                            ${category.categoryName}
                                        </c:forEach>
                                    </td>
                                    <td>${obj.starring}</td>
                                    <td>${obj.location}</td>
                                    <td><fmt:formatDate value="${obj.publishDate}" pattern="yyyy"/></td>
                                    <td>
                                        <c:if test="${obj.finished == true}">่ๅ็ซ็ญ้ๅฎไธญ</c:if>
                                        <c:if test="${obj.finished == false}">่ๅๆชไธๆถ</c:if>
                                    </td>
                                    <td>
                                        <a href="manager/video/detail/${obj.id}" class="operateBtn">ๆฅ็</a>
                                        <a class="operateBtn" lay-event="update" objId="${obj.id}">็ผ่พ</a>
                                        <a class="operateBtn" lay-event="delete" objId="${obj.id}">ๅ?้ค</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>
    </div>
</div>

<%--ๆทปๅ?่ๅ--%>

<div style="display: none" id="addForm" >
    <form class="layui-form videoAddForm" style="width: 500px;" method="get" action="manager/video/add">
        <div class="layui-form-item">
            <label class="layui-form-label">่ๅๅ็งฐ๏ผ</label>
            <div class="layui-input-block">
                <input id="name2" type="text" name="name" lay-verify="required" autocomplete="off" placeholder="่ฏท่พๅฅ่ๅๅ็งฐ" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">ไธไผ?่ๅๆตทๆฅ๏ผ</label>
            <div class="layui-input-block" style="display: inline-block;vertical-align: middle;margin-left: 0;">
                <button type="button" class="layui-btn layui-btn-normal" id="imgSelectBtn">้ๆฉๆไปถ</button>
                <span style="display: inline-block;margin-left: 16px;" id="fileName"></span><%--
                --%><span style="display: inline-block;margin-left: 10px;" id="fileSize"></span>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label" for="type2">่ๅ็ง็ฑป๏ผ</label>
            <div class="layui-input-inline">
                <select name="type" lay-filter="type2" id="type2">
                    <option value="">--่ฏท้ๆฉ--</option>
                    <c:forEach items="${type}" var="obj">
                        <option value="${obj.id}" <c:if test="${video.type == obj.id}">selected="selected"</c:if>>${obj.categoryName}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label" for="category2">ๅฃๅณๆ?็ญพ๏ผ</label>
            <div class="layui-input-inline" style="width: 110px">
                <select name="category" lay-filter="category2" id="category2">
                    <option value="">--่ฏท้ๆฉ--</option>
                </select>
            </div>
            <div class="layui-input-inline" style="width: 110px; ">
                <select name="category"   lay-filter="category3" id="category3">
                    <option value="">--่ฏท้ๆฉ--</option>
                </select>
            </div>
            <div class="layui-input-inline" style="width: 110px;">
                <select name="category"   lay-filter="category4" id="category4">
                    <option value="">--่ฏท้ๆฉ--</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">่ๅไธๆถๆถ้ด๏ผ</label>
                <div class="layui-input-inline">
                    <input type="text" name="year" class="layui-input" id="year2" placeholder="yyyy">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">็ชๅฃ่ด่ดฃไบบ๏ผ</label>
            <div class="layui-input-block">
                <input type="starring" lay-verify="required" id="starring2" name="starring" lay-verify="starring" autocomplete="off" placeholder="่ฏท่พๅฅ็ชๅฃ่ด่ดฃไบบ๏ผๅคไธช่ด่ดฃไบบไปฅ็ฉบๆ?ผๅ้๏ผ" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">ๆ?กๅไฝ็ฝฎ๏ผ</label>
            <div class="layui-input-inline">
                <select id="location2" name="location" lay-filter="location">
                    <option value="">--่ฏท้ๆฉ--</option>
                    <option value="ๆธ็้ฃๅ?">ๆธ็้ฃๅ?</option>
                    <option value="Lๅบงไธๆฅผ่ช่ฅ้ฃๅ?">Lๅบงไธๆฅผ่ช่ฅ้ฃๅ?</option>
                    <option value="Lๅบงไธๆฅผ้บฆๅๅ้คๅ">Lๅบงไธๆฅผ้บฆๅๅ้คๅ</option>
                    <option value="Lๅบงไบๆฅผ่ช่ฅ้ฃๅ?">Lๅบงไบๆฅผ่ช่ฅ้ฃๅ?</option>
                    <option value="Lๅบงไบๆฅผ้บฆๅๅ้คๅ">Lๅบงไบๆฅผ้บฆๅๅ้คๅ</option>
                    <option value="Lๅบงไบๆฅผ้บฆๅๅ้คๅ">Lๅบงไบๆฅผๆๅธ้คๅ</option>
                    <option value="Mๅบง้ฃๅ?ไธๆฅผ่ฅฟ้คๅ">Mๅบง้ฃๅ?ไธๆฅผ่ฅฟ้คๅ</option>
                    <option value="Mๅบง้ฃๅ?ๅธ็้คๅ">Mๅบง้ฃๅ?ๅธ็้คๅ</option>
                    <option value="ๅถไป">ๅถไป</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">็ถๆ๏ผ</label>
            <div class="layui-input-inline">
                <select id="statue2" name="statue" lay-filter="statue">
                    <option value="">--่ฏท้ๆฉ--</option>
                    <option value="0">่ๅๆชไธๆถ</option>
                    <option value="1">็ซ็ญๅฎๅไธญ</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">่ๅๆป้๏ผ</label>
            <input id="totalEpisode" style="width: 200px" type="text" name="totalEpisode" lay-verify="number" autocomplete="off" placeholder="่ฏท่พๅฅ่ๅๆป้๏ผๆฐๅญ๏ผ" class="layui-input">
            <div class="layui-input-inline">

            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">่ๅๅทฒๅฎๆฐ้๏ผ</label>
            <div class="layui-input-inline">
                <input id="currentEpisode" style="width: 200px" type="text" name="currentEpisode" lay-verify="number" autocomplete="off" placeholder="่ฏท่พๅฅ่ๅๅทฒๅฎๆฐ้๏ผๆฐๅญ๏ผ" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">็ฎไป๏ผ</label>
            <div class="layui-input-block">
                <textarea name="description" id="description" placeholder="่ฏท่พๅฅ่ๅๆ่ฟฐ" class="layui-textarea"></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block" style="margin-top: 50px;">
                <button type="submit" id="submit" class="layui-btn" style="margin-right: 60px;" lay-submit="" lay-filter="demo1">็ซๅณๆไบค</button>
                <button type="reset" class="layui-btn layui-btn-primary">้็ฝฎ</button>
            </div>
        </div>
    </form>
</div>

<div style="display: none" id="updateForm" >
    <form class="layui-form videoUpdateForm" style="width: 500px;" method="post" action="manager/video/updateForForm">
        <input type="hidden" value="" name="id">

        <div class="layui-form-item">
            <label class="layui-form-label">่ๅๅ็งฐ๏ผ</label>
            <div class="layui-input-block">
                <input id="name3" type="text" name="name" lay-verify="required" autocomplete="off" placeholder="่ฏท่พๅฅ่ๅๅ็งฐ" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">ไธไผ?่ๅๆตทๆฅ๏ผ</label>
            <div class="layui-input-block" style="display: inline-block;vertical-align: middle;margin-left: 0;">
                <button type="button" class="layui-btn layui-btn-normal" id="imgSelectBtn3">้ๆฉๆไปถ</button>
                <span style="display: inline-block;margin-left: 16px;" id="fileName3"></span><%--
                --%><span style="display: inline-block;margin-left: 10px;" id="fileSize3"></span>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label" for="type2">่ๅ็ง็ฑป๏ผ</label>
            <div class="layui-input-inline">
                <select name="type" lay-filter="type3" id="type3">
                    <option value="">--่ฏท้ๆฉ--</option>
                    <c:forEach items="${type}" var="obj">
                        <option value="${obj.id}" <c:if test="${video.type == obj.id}">selected="selected"</c:if>>${obj.categoryName}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label" for="category2">ๅฃๅณๆ?็ญพ๏ผ</label>
            <div class="layui-input-inline" style="width: 110px">
                <select name="category" lay-filter="category5" id="category5">
                    <option value="">--่ฏท้ๆฉ--</option>
                </select>
            </div>
            <div class="layui-input-inline" style="width: 110px; ">
                <select name="category"   lay-filter="category6" id="category6">
                    <option value="">--่ฏท้ๆฉ--</option>
                </select>
            </div>
            <div class="layui-input-inline" style="width: 110px;">
                <select name="category"   lay-filter="category7" id="category7">
                    <option value="">--่ฏท้ๆฉ--</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">่ๅไธๆถๅนดไปฝ๏ผ</label>
                <div class="layui-input-inline">
                    <input type="text" name="year" class="layui-input" id="year3" placeholder="yyyy">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">็ชๅฃ่ด่ดฃไบบ๏ผ</label>
            <div class="layui-input-block">
                <input type="starring" lay-verify="required" id="starring3" name="starring" lay-verify="starring" autocomplete="off" placeholder="่ฏท่พๅฅ็ชๅฃ่ด่ดฃไบบ๏ผๅคไธช่ด่ดฃไบบไปฅ็ฉบๆ?ผๅ้๏ผ" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">ๆ?กๅไฝ็ฝฎ๏ผ</label>
            <div class="layui-input-inline">
                <select id="location3" name="location" lay-filter="location">
                    <option value="">--่ฏท้ๆฉ--</option>
                    <option value="ๆธ็้ฃๅ?">ๆธ็้ฃๅ?</option>
                    <option value="Lๅบงไธๆฅผ่ช่ฅ้ฃๅ?">Lๅบงไธๆฅผ่ช่ฅ้ฃๅ?</option>
                    <option value="Lๅบงไธๆฅผ้บฆๅๅ้คๅ">Lๅบงไธๆฅผ้บฆๅๅ้คๅ</option>
                    <option value="Lๅบงไบๆฅผ่ช่ฅ้ฃๅ?">Lๅบงไบๆฅผ่ช่ฅ้ฃๅ?</option>
                    <option value="Lๅบงไบๆฅผ้บฆๅๅ้คๅ">Lๅบงไบๆฅผ้บฆๅๅ้คๅ</option>
                    <option value="Lๅบงไบๆฅผ้บฆๅๅ้คๅ">Lๅบงไบๆฅผๆๅธ้คๅ</option>
                    <option value="Mๅบง้ฃๅ?ไธๆฅผ่ฅฟ้คๅ">Mๅบง้ฃๅ?ไธๆฅผ่ฅฟ้คๅ</option>
                    <option value="Mๅบง้ฃๅ?ๅธ็้คๅ">Mๅบง้ฃๅ?ๅธ็้คๅ</option>
                    <option value="ๅถไป">ๅถไป</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">่ๅ็ถๆ๏ผ</label>
            <div class="layui-input-inline">
                <select id="statue3" name="statue" lay-filter="statue">
                    <option value="">--่ฏท้ๆฉ--</option>
                    <option value="0">่ๅๆชไธๆถ</option>
                    <option value="1">็ซ็ญๅฎๅไธญ</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">่ๅๆป้๏ผ</label>
            <input id="totalEpisode3" style="width: 200px" type="text" name="totalEpisode" lay-verify="" autocomplete="off" placeholder="่ฏท่พๅฅ่ๅๆป้๏ผๆฐๅญ๏ผ" class="layui-input">
            <div class="layui-input-inline">

            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">ๅทฒ้ๅฎ่ๅๆฐ้๏ผ</label>
            <div class="layui-input-inline">
                <input id="currentEpisode3" style="width: 200px" type="text" name="currentEpisode" lay-verify="" autocomplete="off" placeholder="่ฏท่พๅฅๅทฒๅฎๅบ่ๅๆฐ้๏ผๆฐๅญ๏ผ" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">็ฎไป๏ผ</label>
            <div class="layui-input-block">
                <textarea name="description" id="description3" placeholder="่ฏท่พๅฅ่ๅๆ่ฟฐ" class="layui-textarea"></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block" style="margin-top: 50px;">
                <button type="submit" id="submit3" class="layui-btn" style="margin-right: 60px;" lay-submit="" lay-filter="demo1">็ซๅณๆไบค</button>
                <button type="reset" class="layui-btn layui-btn-primary">้็ฝฎ</button>
            </div>
        </div>
    </form>
</div>

<script type="text/html" id="toolbarLeft">
    <div class="layui-inline" title="ๆทปๅ?่ๅ" lay-event="addCuisine">
        <i class="layui-icon layui-icon-add-1" style="color: #77746e">
        </i>
    </div>
</script>

<script>
    $(".layui-nav-item").click(function () {
        $(".layui-nav-item").not(this).removeClass('layui-nav-itemed');
        $(".layui-nav-bar").css({top: $(this).position().top+'px'})
    });
//JavaScriptไปฃ็?ๅบๅ
layui.use(['element','table','layer','jquery','form','laydate','upload'], function() {
    var element = layui.element
        , table = layui.table
        , layer = layui.layer
        ,$ = layui.jquery
        ,form = layui.form
        ,laydate = layui.laydate
        ,upload = layui.upload;

    /**
     * ๆ็ดขๆกไปถๆฐๆฎๅๆพ
     * @type {string}
     */
    var video = "${video}";
    if (video != null || video != ' ') {
        //ๅ็งฐๆๆฌๆกๅๆพ
        $("input[name='name']").val('${video.name}');
        //ๅ็ฑปไธๆๆกๅๆพ
        if (${video.type != null}){
            var type = '${video.type}';
            var category = '${video.category}';
            var html = '<option value="">--่ฏท้ๆฉ--</option>';
            var selected = '';
            $.ajax({
                url:'manager/video/getCategoryByPid/'+type
                ,success:function (data) {
                    for (var i = 0; i <data.length;i++){
                        if (data[i].id == category){
                            console.log(data[i].id + " " +category);
                            selected = 'selected';
                        }else{
                            selected = '';
                        }
                        html += '<option value="'+ data[i].id +'"'+ selected +'>'+ data[i].categoryName +'</option>'
                }
                    $("#category").html(html);
                    form.render();
                }
            })
        }

    }

    /**
     * ่กจๆ?ผๆธฒๆ
     */
    table.init('demo', {
        limit: 10 //ๆณจๆ๏ผ่ฏทๅกๅฟ็กฎไฟ limit ๅๆฐ๏ผ้ป่ฎค๏ผ10๏ผๆฏไธไฝ?ๆๅก็ซฏ้ๅฎ็ๆฐๆฎๆกๆฐไธ่ด
        ,page: true //ๅผๅฏๅ้กต
        ,toolbar: '#toolbarLeft'
        ,limits:[10,20,30,40,50,60,70,80,90,100,${fn:length(videos)}]
        //ๆฏๆๆๆๅบ็กๅๆฐ
    });



    //่กจๆ?ผๅคดๅทฅๅทๆ?ไบไปถ
    table.on('toolbar(demo)', function(obj){
        switch(obj.event){
            case 'addCuisine':    //ๆทปๅ?่ง้ข
                layer.open({
                    type:1
                    ,title:'ๆทปๅ?่ๅ'
                    ,area:['700px','720px']
                    ,content:$("#addForm")
                    ,success:function () {
                        var layerForm = layui.form.render('select');

                        layerForm.on('select(type2)',function () {
                            //่ทๅ้ไธญ็็ฑปๅid
                            var type =$('#type2').val();
                            var html = '<option value="">--่ฏท้ๆฉ--</option>';
                            if(type == 0){
                                $("#category2,#category3,#category4").html(html);
                                layerForm.render();
                            }else{
                                $.ajax({
                                    url:'manager/video/getCategoryByPid/'+type
                                    ,success:function (data) {
                                        for (var i = 0; i <data.length;i++){
                                            html += '<option value="'+ data[i].id +'">'+ data[i].categoryName +'</option>'
                                        }
                                        $("#category2,#category3,#category4").html(html);
                                        layerForm.render();
                                    }
                                })
                            }
                        });
                        layerForm.on('select(statue)',function () {
                            //่ทๅ้ไธญ็็ฑปๅid
                        })
                    }
                });
                break;
        }
    });

    //ๅคๆญๆฏๅฆ้็จ่กจๅๆไบค๏ผไธไผ?ๅพ็ๆถไธไฝฟ็จ่กจๅๆไบค
    var updateImgFlag = true;
    $("#updateForm").submit(function () {
        return updateImgFlag;
    });
    //่กจๆ?ผ่กๆไฝๆ้ฎ็นๅปไบไปถ
    table.on('tool(demo)', function(obj) {
        var data = obj.data; //่ทๅพๅฝๅ่กๆฐๆฎ
        var layEvent = obj.event; //่ทๅพ lay-event ๅฏนๅบ็ๅผ๏ผไนๅฏไปฅๆฏ่กจๅคด็ event ๅๆฐๅฏนๅบ็ๅผ๏ผ
        if (layEvent == 'delete'){
            var id1 = $(this).attr("objId");
            layer.confirm('็กฎ่ฎคๅ?้ค่ๅ \"'+ data.name + '\" ?', {title:'ๆ็คบ'}, function(index){
                $.get('manager/video/del?id='+id1,function (data) {
                    if (data >= 1){
                        layer.msg("ๅ?้คๆๅ");
                        obj.del();
                    }else{
                        layer.msg("ๅ?้คๅคฑ่ดฅ");
                    }
                });
                layer.close(index);
            });
        }

        //็ผ่พ่ง้ขไฟกๆฏ
        if (layEvent == 'update'){
            //้ไธญ่ก็id
            var id = $(this).attr("objId");
            var html = '<option value="">--่ฏท้ๆฉ--</option>';

            layer.open({
                type:1
                ,title:'ไฟฎๆน่ๅไฟกๆฏ'
                ,area:['700px','720px']
                ,content:$("#updateForm")
                ,success:function () {
                    var layerForm = layui.form.render('select');

                    //ๆ?นๆฎ้ๆฉ็็ฑปๅ่ทๅๅ็ฑป
                    layerForm.on('select(type3)',function () {
                        //่ทๅ้ไธญ็็ฑปๅid
                        var type =$('#type3').val();
                        var selected = '';
                        var html = '<option value="">--่ฏท้ๆฉ--</option>';

                        if(type == 0){
                            html = '<option value="">--่ฏท้ๆฉ--</option>';
                            $("#category5,#category6,#category7").html(html);
                            layerForm.render();
                        }else{
                            $.ajax({
                                url:'manager/video/getCategoryByPid/'+type
                                ,success:function (data) {
                                    for (var i = 0; i <data.length;i++){
                                        html += '<option value="'+ data[i].id +'">'+ data[i].categoryName +'</option>'
                                    }
                                    $("#category5,#category6,#category7").html(html);
                                    layerForm.render();
                                }
                            })
                        }
                    });

                    $.ajax({
                        url:'manager/video/getVideoById'
                        ,type:'post'
                        ,data:{id:id}
                        ,success:function (result) {
                            $("input[type='hidden']").val(id);

                            $("#name3").val(result.name);

                            $("select[id='type3'] option").each(function (index,el) {
                                if($(this).val() == result.type){
                                    $(this)[0].selected=true;
                                    layui.form.render('select');
                                    $("select[id='type3']").next().children('.layui-anim-upbit').children(".layui-this").click();
                                }
                            });

                            setTimeout(function () {
                                $("select[id='category5'] option").each(function (index, el) {
                                    if (result.categoryList[0] != null){
                                        if(result.categoryList[0].id == $(this).val()){
                                            $(this)[0].selected=true;
                                            layui.form.render('select');
                                        }
                                    }
                                });
                                $("select[id='category6'] option").each(function (index, el) {
                                    if (result.categoryList[1] != null){
                                        if(result.categoryList[1].id == $(this).val()){
                                            $(this)[0].selected=true;
                                            layui.form.render('select');
                                        }
                                    }
                                });
                                $("select[id='category7'] option").each(function (index, el) {
                                    if (result.categoryList[2] != null){
                                        if(result.categoryList[2].id == $(this).val()){
                                            $(this)[0].selected=true;
                                            layui.form.render('select');
                                        }
                                    }
                                });
                            },150);

                            $("#year3").val(new Date(result.publishDate).getFullYear());
                            $("#location3").val(result.location);
                            $("#starring3").val(result.starring);

                            if (result.finished){
                                $("#statue3").val(1);
                            } else{
                                $("#statue3").val(0);
                            }

                            $("#totalEpisode3").val(result.totalEpisode);
                            $("#currentEpisode3").val(result.currentEpisode);
                            $("#description3").val(result.description);
                            layui.form.render('select');
                        }
                    });


                }
            });
        }
    });


    /**
     * ่กจๅ้ๆฉไธๆๆก็ๅฌ
     */
    form.on('select(type)',function () {
        //่ทๅ้ไธญ็็ฑปๅid
        var type =$('#type').val();
        var html = '<option value="">--่ฏท้ๆฉ--</option>';

        if(type == 0){
            $("#category").html(html);
            form.render();
        }else{
            $.ajax({
                url:'manager/video/getCategoryByPid/'+type
                ,success:function (data) {
                    for (var i = 0; i <data.length;i++){
                        html += '<option value="'+ data[i].id +'">'+ data[i].categoryName +'</option>'
                    }
                    $("#category").html(html);
                    form.render();
                }
            })
        }
    });



    //ๆถ้ด้ๆฉๅจๆธฒๆ
    laydate.render({
        elem: '#year2'
        ,type:'year'
        ,value: '2019' //ๅฟ้กป้ตๅพชformatๅๆฐ่ฎพๅฎ็ๆ?ผๅผ
        ,max:'2019'
    });
    //ๆถ้ด้ๆฉๅจๆธฒๆ
    laydate.render({
        elem: '#year3'
        ,type:'year'
        ,value: '2019' //ๅฟ้กป้ตๅพชformatๅๆฐ่ฎพๅฎ็ๆ?ผๅผ
        ,max:'2019'
    });


    var imgFlag = false;//ๆ?่ฎฐๆฏๅฆไฝฟ็จๅพ็ไธไผ?
    $(".videoAddForm").submit(function () {
        if(!imgFlag){
            layer.msg("่ฏทๅ้ๆฉๆตทๆฅๅพ็");
        }
        return false;
    });


    /**
     * ๆไปถไธไผ?
     */
    var uploadIns = upload.render({
        elem: '#imgSelectBtn'
        ,url: 'manager/video/add'
        ,auto: false //้ๆฉๆไปถๅไธ่ชๅจไธไผ?
        ,bindAction: '#submit' //ๆๅไธไธชๆ้ฎ่งฆๅไธไผ?
        ,multiple:false
        ,data:{
            name:function () {
                return $("#name2").val();
            }
            ,totalEpisode:function () {
                return $("#totalEpisode").val();
            }
            ,currentEpisode:function () {
                return $("#currentEpisode").val();
            }
            ,type:function () {
                return $("#type2").val();
            }
            ,category:function () {
                return [$("#category2").val(),$("#category3").val(),$("#category4").val()];
            }
            ,starring:function () {
                return $("#starring2").val();
            }
            ,year:function () {
                return $("#year2").val();
            }
            ,location:function () {
                return $("#location2").val();
            }
            ,statue:function () {
                return $("#statue2").val();
            }
            ,description:function () {
                return $("#description").val();
            }
        }
        ,choose: function(obj){
            //้ข่ฏปๆฌๅฐๆไปถ
            obj.preview(function(index, file, result){
                imgFlag = true;
                $("#fileName").html(file.name);
                $("#fileSize").html((file.size/1024).toFixed(1) + 'kb');

                $(".layui-btn-primary").on('click',function () {
                    $("#fileName").html('');
                    $("#fileSize").html('');
                    uploadIns.config.elem.next()[0].value = ''; //ๆธ็ฉบ input file ๅผ๏ผไปฅๅๅ?้คๅๅบ็ฐๅๅๆไปถไธๅฏ้
                    imgFlag = false;
                })
            });
        }
        ,before: function(obj){ //objๅๆฐๅๅซ็ไฟกๆฏ๏ผ่ท chooseๅ่ฐๅฎๅจไธ่ด๏ผๅฏๅ่งไธๆใ
            layer.load(1); //ไธไผ?loading
        }
        ,done:function (res, index, upload) {
            if(res.code == 1 ){
                layer.closeAll('loading'); //ๅณ้ญloading
                layer.msg("ๆทปๅ?่ๅๆๅ๏ผ");
                layer.close();
                location.reload();
            }else if(res.code == 0 ){
                layer.closeAll('loading'); //ๅณ้ญloading
                layer.msg("ๆทปๅ?่ๅๅคฑ่ดฅ๏ผ");
            }
        }
    });



    /**
     * ็ผ่พ่ง้ขไฟกๆฏ็ๆไปถไธไผ?
     */
    var uploadUpd = upload.render({
        elem: '#imgSelectBtn3'
        ,url: 'manager/video/update'
        ,auto: false //้ๆฉๆไปถๅไธ่ชๅจไธไผ?
        ,bindAction: '#submit3' //ๆๅไธไธชๆ้ฎ่งฆๅไธไผ?
        ,multiple:false
        ,data:{
            id:function(){
                return $("input[type='hidden']").val();
            }
            ,name:function () {
                return $("#name3").val();
            }
            ,totalEpisode:function () {
                return $("#totalEpisode3").val();
            }
            ,currentEpisode:function () {
                return $("#currentEpisode3").val();
            }
            ,type:function () {
                return $("#type3").val();
            }
            ,category:function () {
                return [$("#category5").val(),$("#category6").val(),$("#category7").val()];
            }
            ,starring:function () {
                return $("#starring3").val();
            }
            ,year:function () {
                return $("#year3").val();
            }
            ,location:function () {
                return $("#location3").val();
            }
            ,statue:function () {
                return $("#statue3").val();
            }
            ,description:function () {
                return $("#description3").val();
            }
        }
        ,choose: function(obj){
            updateImgFlag = false;
            //้ข่ฏปๆฌๅฐๆไปถ
            obj.preview(function(index, file, result){
                imgFlag = true;
                $("#fileName3").html(file.name);
                $("#fileSize3").html((file.size/1024).toFixed(1) + 'kb');
            });
        }
        ,before: function(obj){ //objๅๆฐๅๅซ็ไฟกๆฏ๏ผ่ท chooseๅ่ฐๅฎๅจไธ่ด๏ผๅฏๅ่งไธๆใ
            layer.load(1); //ไธไผ?loading
        }
        ,done:function (res, index, upload) {
            if(res.code == 1 ){
                layer.closeAll('loading'); //ๅณ้ญloading
                layer.msg("ไฟฎๆน่ๅๆๅ๏ผ");
                layer.close();
                location.reload();
            }else if(res.code == 0 ){
                layer.closeAll('loading'); //ๅณ้ญloading
                layer.msg("ไฟฎๆน่ๅๅคฑ่ดฅ๏ผ");
            }
        }
    });
})
</script>
</body>
</html>
