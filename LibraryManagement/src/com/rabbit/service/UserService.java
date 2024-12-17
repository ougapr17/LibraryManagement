package com.rabbit.service;

import com.rabbit.po.User;

import java.util.List;

/**
 * @author
 * @date  22:54
 * Service层
 */
public interface UserService {

    /**
     * 查询用户信息
     * @param username
     * @return
     */
    public List<User> selectUser(String username);



    /**
     * 根据用户编号进行查询
     * @param userid
     * @return
     */
    public User getUser(Integer userid);


    /**
     * 图书新增
     * @param user
     * @return
     */
    public boolean addUser(User user);

    /**
     * 图书修改
     * @param user
     * @return
     */
    public boolean updateUser(User user);

    /**
     * 删除用户
     * @param userid
     * @return
     */
    public boolean deleteUser(Integer userid);
}
