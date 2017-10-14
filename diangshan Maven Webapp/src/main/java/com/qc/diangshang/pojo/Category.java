package com.qc.diangshang.pojo;

import java.util.Date;

public class Category {
    private Integer id;

    private Integer parentId;

    private String name;

    private String parentUrl;

	private Boolean status;

    private Integer sortOrder;

    private Date createTime;

    private Date updateTime;
    

    
    public String getParentUrl() {
		return parentUrl;
	}

	public void setParent_url(String parent_url) {
		this.parentUrl = parent_url;
	}

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public Integer getSortOrder() {
        return sortOrder;
    }

    public void setSortOrder(Integer sortOrder) {
        this.sortOrder = sortOrder;
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