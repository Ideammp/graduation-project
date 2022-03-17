package com.example.pojo;

public class CanteenBulletin {
    private String canteenBulletinTitle;
    private String canteenBulletinCantent;
    private String canteenUplodDate;

    public String getCanteenBulletinTitle() {
        return canteenBulletinTitle;
    }

    public void setCanteenBulletinTitle(String canteenBulletinTitle) {
        this.canteenBulletinTitle = canteenBulletinTitle;
    }

    public String getCanteenBulletinCantent() {
        return canteenBulletinCantent;
    }

    public void setCanteenBulletinCantent(String canteenBulletinCantent) {
        this.canteenBulletinCantent = canteenBulletinCantent;
    }

    public String getCanteenUplodDate() {
        return canteenUplodDate;
    }

    public void setCanteenUplodDate(String canteenUplodDate) {
        this.canteenUplodDate = canteenUplodDate;
    }


    @Override
    public String toString() {
        return "CanteenBulletin{" +
                "canteenBulletinTitle='" + canteenBulletinTitle + '\'' +
                ", canteenBulletinCantent='" + canteenBulletinCantent + '\'' +
                ", canteenUplodDate='" + canteenUplodDate + '\'' +
                '}';
    }
}
