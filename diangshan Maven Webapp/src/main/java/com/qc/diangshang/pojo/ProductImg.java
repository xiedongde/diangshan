package com.qc.diangshang.pojo;

import java.util.Date;

public class ProductImg {
    private Integer id;

    private Integer productId;

    private String minImg;

	private String maxImg;

    private String detail;

    private String barnner;

    private String barnnerUrl;

    private Integer status;

    private Date createTime;

    private Date updateTime;


    public String getMaxImg() {
		return maxImg;
	}

	public void setMaxImg(String maxImg) {
		this.maxImg = maxImg;
	}

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public String getMinImg() {
        return minImg;
    }

    public void setMinImg(String minImg) {
        this.minImg = minImg == null ? null : minImg.trim();
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail == null ? null : detail.trim();
    }

    public String getBarnner() {
        return barnner;
    }

    public void setBarnner(String barnner) {
        this.barnner = barnner == null ? null : barnner.trim();
    }

    public String getBarnnerUrl() {
        return barnnerUrl;
    }

    public void setBarnnerUrl(String barnnerUrl) {
        this.barnnerUrl = barnnerUrl == null ? null : barnnerUrl.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
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