package com.qc.diangshang.pojo;

import java.util.Date;

public class Barnner {
    private Integer id;

    private String barnnerName;

    private String barnnerUrl;

    private String barnnerImage;

    private Date createTime;

    private Date updateTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getBarnnerName() {
        return barnnerName;
    }

    public void setBarnnerName(String barnnerName) {
        this.barnnerName = barnnerName == null ? null : barnnerName.trim();
    }

    public String getBarnnerUrl() {
        return barnnerUrl;
    }

    public void setBarnnerUrl(String barnnerUrl) {
        this.barnnerUrl = barnnerUrl == null ? null : barnnerUrl.trim();
    }

    public String getBarnnerImage() {
        return barnnerImage;
    }

    public void setBarnnerImage(String barnnerImage) {
        this.barnnerImage = barnnerImage == null ? null : barnnerImage.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}