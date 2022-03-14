package com.example.controller;


import com.alibaba.fastjson.JSONObject;
import com.example.pojo.SchoolBulletin;
import com.example.pojo.User;
import com.example.service.BulletinSchoolService;
import com.example.service.impl.BulletinSchoolServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("bulletin")
public class BulletinController {

    @Resource
    BulletinSchoolService bulletinSchoolService;


    /*查询所有的学校告示信息*/
@RequestMapping(value = "getSchoolAll",produces = "text/html;charset=utf-8")
@ResponseBody
public String getSchoolAll(int page,int limit){
    int start = (page-1)*limit;
    List<SchoolBulletin> schoolBulletinList = bulletinSchoolService.getSchoolAll(start , limit);
    int count = bulletinSchoolService.getCount();
    JSONObject jsonObject = new JSONObject();
    jsonObject.put("code",0);
    jsonObject.put("count",count);
    jsonObject.put("data",schoolBulletinList);

    System.out.println(jsonObject.toString());
    return jsonObject.toString();
}

    /*根据id查询告示信息*/
@RequestMapping("school/detail/{id}")
public String schoolBulletinDetail(@PathVariable("id")int id,HttpServletRequest request){
    SchoolBulletin schoolBulletin = bulletinSchoolService.getSBulletinById(id);
    request.setAttribute("sbulletin",schoolBulletin);
    return "manager/bulletin_school_detail";
}

    /*根据id删除校内告示信息*/
@RequestMapping("school/delete/{id}")
public int schoolBulletinDelete(@PathVariable("id")int id,HttpServletRequest request){
    return bulletinSchoolService.deleteById(id);
}







}
