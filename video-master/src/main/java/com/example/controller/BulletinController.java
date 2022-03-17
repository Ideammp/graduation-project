package com.example.controller;


import com.alibaba.fastjson.JSONObject;
import com.example.pojo.CanteenBulletin;
import com.example.pojo.SchoolBulletin;
import com.example.pojo.User;
import com.example.service.BulletinCanteenService;
import com.example.service.BulletinSchoolService;
import com.example.service.impl.BulletinSchoolServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("bulletin")
public class BulletinController {

    @Resource
    BulletinSchoolService bulletinSchoolService;
    @Resource
    BulletinCanteenService bulletinCanteenService;


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
@ResponseBody//保留数据到页面
public int schoolBulletinDelete(@PathVariable("id")int id,HttpServletRequest request){
    return bulletinSchoolService.deleteById(id);
}

    /*添加新的学校公告*/
@RequestMapping("school/addNewBulletin")
@ResponseBody
public Map<String,Object> addNewSchoolBulletin(String title,String content,String date){
    Map<String,Object> map = new HashMap<>();
    map.put("result",bulletinSchoolService.addNewBulletin(title,content,date));
    return map;
}


    /*查询所有的食堂告示信息*/
@RequestMapping(value = "getCanteenAll",produces = "text/html;charset=utf-8")
@ResponseBody
public String getCanteenAll(int page ,int limit){
    int start = (page-1)*limit;
    List<CanteenBulletin> canteenBulletinList = bulletinCanteenService.getAllCanteen(start,limit);
    int count = bulletinCanteenService.selectCount();
    JSONObject jsonObject = new JSONObject();
    jsonObject.put("code",0);
    jsonObject.put("count",count);
    jsonObject.put("data",canteenBulletinList);
    System.out.println(jsonObject);
    return jsonObject.toString();
}


    /*根据id查询学校告示信息*/
    @RequestMapping("canteen/detail/{id}")
    public String canteenBulletinDetail(@PathVariable("id")int id,HttpServletRequest request){
        CanteenBulletin canteenBulletin = bulletinCanteenService.getById(id);
        request.setAttribute("cbulletin",canteenBulletin);
        return "manager/bulletin_canteen_detail";
    }

    /*根据id删除校内告示信息*/
    @RequestMapping("canteen/delete/{id}")
    @ResponseBody//保留数据到页面
    public int canteenBulletinDelete(@PathVariable("id")int id,HttpServletRequest request){
        return bulletinCanteenService.delById(id);
    }

    /*添加新的学校公告*/
    @RequestMapping("canteen/addNewBulletin")
    @ResponseBody
    public Map<String,Object> addNewCanteenBulletin(String title,String content,String date){
        Map<String,Object> map = new HashMap<>();
        map.put("result",bulletinCanteenService.addNewCanteenBulletin(title,content,date));
        return map;
    }





}
