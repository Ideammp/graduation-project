package com.example.service.impl;

import com.example.mapper.CanteenMapper;
import com.example.pojo.CanteenBulletin;
import com.example.service.BulletinCanteenService;

import javax.annotation.Resource;
import java.util.List;

public class BulletinCanteenServiceImpl implements BulletinCanteenService {

    @Resource
    CanteenMapper canteenMapper;

    @Override
    public List<CanteenBulletin> getAllCanteen(int start, int limit) {
        return canteenMapper.selectCanteenAll(start,limit);
    }

    @Override
    public int selectCount() {
        return canteenMapper.selectCount();
    }

    @Override
    public CanteenBulletin getById(int id) {
        return canteenMapper.selectById(id);
    }

    @Override
    public int delById(int id) {
        return canteenMapper.delById(id);
    }

    @Override
    public int addNewCanteenBulletin(String title, String content, String date) {
        return canteenMapper.addNewCanteenBulletin(title, content, date);
    }
}
