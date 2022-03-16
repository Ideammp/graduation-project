package com.example.test;

import com.example.mapper.SchoolBulletinMapper;
import com.example.mapper.UserMapper;
import com.example.pojo.User;
import com.example.service.BulletinSchoolService;
import com.example.service.impl.BulletinSchoolServiceImpl;
import com.example.service.impl.UserServiceImpl;
import org.junit.jupiter.api.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

public class Test1 {
    @Test
    /*public void test01(){
        System.out.println(new Date().getYear());
    }*/

    public void test01(){
        ApplicationContext ioc = new ClassPathXmlApplicationContext("applicationContext.xml");



        //delete Mapper层测试
        SchoolBulletinMapper schoolBulletinMapper = (SchoolBulletinMapper)ioc.getBean("schoolBulletinMapper");
        System.out.println(schoolBulletinMapper.delById(2));


        //mapper 层测试完成
      /*  SchoolBulletinMapper schoolBulletinMapper = (SchoolBulletinMapper)ioc.getBean("schoolBulletinMapper");
        System.out.println(schoolBulletinMapper.selectSchoolAll(0,10));
        System.out.println(schoolBulletinMapper.selectCount());*/

       /* UserServiceImpl userService = (UserServiceImpl) ioc.getBean("userService");

        System.out.println(userService.getAll(0,10));*/



    }

}
