package com.example.mapper;

import com.example.pojo.CanteenBulletin;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface CanteenMapper {

    /*查询所有有关食堂公告的表内容*/
    List<CanteenBulletin> selectCanteenAll(int start , int limit);

    /*查询当前有多少条记录*/
    int selectCount();


    /*根据id查找相关的表信息实现查看详情的功能*/
    @Select("select * from canteen_bulletin where id = #{prama1}")
    CanteenBulletin selectById(int id);

    /*根据id删除对应的表信息实现删除的功能*/
    @Delete("delete from canteen_bulletin where id = #{prama}")
    int delById(int id );

    /*添加餐厅的告示*/
    @Insert("insert into canteen_bulletin values(default,#{param1},#{param2},#{param3})")
    int addNewCanteenBulletin(String title , String content , String date);




}
