package com.example.pojo;

import java.util.Date;

public class SchoolBulletin {
    private Integer id;
    private String schoolBulletinTitle;
    private String schoolBulletinContent;
    private String schoolUplodDate;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSchoolBulletinTitle() {
        return schoolBulletinTitle;
    }

    public void setSchoolBulletinTitle(String schoolBulletinTitle) {
        this.schoolBulletinTitle = schoolBulletinTitle;
    }

    public String getSchoolBulletinContent() {
        return schoolBulletinContent;
    }

    public void setSchoolBulletinContent(String schoolBulletinContent) {
        this.schoolBulletinContent = schoolBulletinContent;
    }

    public String getSchoolUplodDate() {
        return schoolUplodDate;
    }

    public void setSchoolUplodDate(String schoolUplodDate) {
        this.schoolUplodDate = schoolUplodDate;
    }

    @Override
    public String toString() {
        return "SchoolBulletin{" +
                "id=" + id +
                ", schoolBulletinTitle='" + schoolBulletinTitle + '\'' +
                ", schoolBulletinContent='" + schoolBulletinContent + '\'' +
                ", schoolUplodDate='" + schoolUplodDate + '\'' +
                '}';
    }
}
