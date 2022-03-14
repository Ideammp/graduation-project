package com.example.service.impl;

import com.example.mapper.SchoolBulletinMapper;
import com.example.pojo.SchoolBulletin;
import com.example.service.BulletinSchoolService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class BulletinSchoolServiceImpl implements BulletinSchoolService {

    @Resource
    SchoolBulletinMapper schoolBulletinMapper;

    /*查询所有校内告示*/
    @Override
    public List<SchoolBulletin> getSchoolAll(int start, int limit) {
        return schoolBulletinMapper.selectSchoolAll(start , limit);
    }
    /*查询校内告示记录条数*/
    @Override
    public int getCount() {
        return schoolBulletinMapper.selectCount();
    }
    /*更具id查询告示信息*/
    @Override
    public SchoolBulletin getSBulletinById(int id) {
        return schoolBulletinMapper.selectById(id);
    }

    @Override
    public int deleteById(int id) {
        return schoolBulletinMapper.delById(id);
    }


}
