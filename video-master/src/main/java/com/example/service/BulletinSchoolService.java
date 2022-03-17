package com.example.service;

import com.example.pojo.SchoolBulletin;

import java.util.List;

public interface BulletinSchoolService {

    //请求所有告示信息
    List<SchoolBulletin> getSchoolAll(int start , int limit);

    //请求告示的总数量
    int getCount();

    //根据id查询告示信息实现：查看详情功能
    SchoolBulletin getSBulletinById(int id);

    //根据id删除校内告示信息
    int deleteById(int id);

    //添加新的学校告示
    int addNewBulletin(String title,String content,String date);

}
