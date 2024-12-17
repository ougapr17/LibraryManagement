package com.rabbit.service.impl;

import com.rabbit.dao.UserDao;
import com.rabbit.dao.impl.UserDaoImpl;
import com.rabbit.po.User;
import com.rabbit.service.UserService;

import java.util.ArrayList;
import java.util.List;

/**
 * @author
 * @date  22:56
 */
public class UserServiceImpl implements UserService {

    // 定义dao对象
    private UserDao userDao = new UserDaoImpl();

    /**
     * 查询用户信息
     * @param username
     * @return
     */
    @Override
    public List<User> selectUser(String username) {

        StringBuffer sql = new StringBuffer("select * from user where 1 = 1 ");
        List<Object> list = new ArrayList<Object>();
        if(username != null&&!username.equals("")){

            sql.append(" and username LIKE ?");
            list.add("%" + username + "%");
        }
        // 交给dao层处理逻辑
        return userDao.selectUser(sql.toString(),list.toArray());
    }

    @Override
    public User getUser(Integer userid) {
        return userDao.getUser(userid);
    }

    @Override
    public boolean addUser(User user) {
        return userDao.addUser(user);
    }

    @Override
    public boolean updateUser(User user) {
        return userDao.updateUser(user);
    }

    @Override
    public boolean deleteUser(Integer userid) {
        return userDao.deleteUser(userid);
    }
}
