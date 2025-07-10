
package com.tech.blog.entities;

import java.sql.Timestamp;


public class Post {
    private int pid;
    private String pTitle;
    private String pContent;
    private String pCode;
    private String postpic;
    private Timestamp pdate;
    private int catId;
    private int userId;

    public Post() {
    }

    public Post(int pid, String pTitle, String pContent, String pCode, String postpic, Timestamp pdate, int catId,int userId) {
        this.pid = pid;
        this.pTitle = pTitle;
        this.pContent = pContent;
        this.pCode = pCode;
        this.postpic = postpic;
        this.pdate = pdate;
        this.catId = catId;
        this.userId=userId;
    }

    public Post(String pTitle, String pContent, String pCode, String postpic, Timestamp pdate, int catId,int userId) {
        this.pTitle = pTitle;
        this.pContent = pContent;
        this.pCode = pCode;
        this.postpic = postpic;
        this.pdate = pdate;
        this.catId = catId;
        this.userId=userId;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getPtitle() {
        return pTitle;
    }

    public void setPtitle(String pTitle) {
        this.pTitle = pTitle;
    }

    public String getPcontent() {
        return pContent;
    }

    public void setPcontent(String pcontent) {
        this.pContent = pcontent;
    }

    public String getPcode() {
        return pCode;
    }

    public void setPcode(String pcode) {
        this.pCode = pcode;
    }

    public String getPostpic() {
        return postpic;
    }

    public void setPostpic(String postpic) {
        this.postpic = postpic;
    }

    public Timestamp getPdate() {
        return pdate;
    }

    public void setPdate(Timestamp pdate) {
        this.pdate = pdate;
    }

    public int getCatId() {
        return catId;
    }

    public void setCatid(int catId) {
        this.catId = catId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
    
    
    
    
}
