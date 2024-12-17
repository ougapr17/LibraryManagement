package com.rabbit.po;

import java.io.Serializable;

/**
 * @author
 * @date  22:19
 * 用户的实体类
 */

public class User implements Serializable {

    // 增加序列号,作用是反序列化的时候不会报错，切能进行IO的持久化
    public static final long serialVersionUID = 1L;
    private Integer userid;
    private String username;
    private String password;
    private String email;
    private String phone;
    private Integer isadmin;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Integer getIsadmin() {
        return isadmin;
    }

    public void setIsadmin(Integer isadmin) {
        this.isadmin = isadmin;
    }

    @Override
    public String toString() {
        return "User{" +
                "userid=" + userid +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", isadmin=" + isadmin +
                '}';
    }
}
