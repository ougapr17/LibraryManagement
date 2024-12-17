package com.rabbit.dao;

import com.rabbit.po.User;

import java.util.List;

/**
 * @author
 * @date  22:10
 * 创建一个接口用于声明用户登录注册的方法
 */

public interface UserDao {

    /**
     * 用户登录
     * @param user
     * @return
     */
    public User login(User user);

    /**
     * 用户注册
     * @param user
     * @return
     */
    public boolean register(User user);

    /**
     * 查询用户信息
     * @param sql
     * @param arr
     * @return
     */
    public List<User> selectUser(String sql, Object arr[]);



    /**
     * 根据用户编号进行查询
     * @param userid
     * @return
     */
    public User getUser(Integer userid);


    /**
     * 新增用户
     * @param user
     * @return
     */
    public boolean addUser(User user);

    /**
     * 修改用户
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

//    public User getPassword(Integer userid);
}
