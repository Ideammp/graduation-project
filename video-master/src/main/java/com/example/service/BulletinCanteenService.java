package com.example.service;

import com.example.pojo.CanteenBulletin;

import java.util.List;

public interface BulletinCanteenService {

    /*实现表格填充，查询表内所有数据*/
    List<CanteenBulletin> getAllCanteen(int start, int limit);

    /*查询表格条数*/
    int selectCount();

    /*根据id实现单条查询*/
    CanteenBulletin getById(int id);

    /*根据id实现单条记录删除*/
    int delById(int id);

    /*插入一条餐厅告示*/
    int addNewCanteenBulletin(String title , String content , String date);
}
