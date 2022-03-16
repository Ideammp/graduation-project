package com.example.mapper;

import com.example.pojo.SchoolBulletin;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface SchoolBulletinMapper {

    /*查询所有校内告示信息*/
    List<SchoolBulletin> selectSchoolAll(int start , int limit);

    /*查询记录条数*/
    int selectCount();

    /*根据id查询告示信息*/
    @Select("select * from school_bulletin where id = #{param1}")
    SchoolBulletin selectById(int id);

    /* 根据id删除校内告示信息*/
    @Delete("delete from school_bulletin where id = #{param1}")
    int delById(int id);


}
