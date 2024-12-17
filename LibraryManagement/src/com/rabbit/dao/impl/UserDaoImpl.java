package com.rabbit.dao.impl;

import com.rabbit.dao.UserDao;
import com.rabbit.po.User;
import com.rabbit.utils.BaseDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author
 * @date  22:15
 * 实现UserDao接口
 */

public class UserDaoImpl implements UserDao {

    /**
     * 用户登录
     * @param user
     * @return
     */
    @Override
    public User login(User user) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            // 1.获取数据库连接
            con = BaseDao.getConnection();
            // 2.写sql
            String sql = "select * from user where username = ? and password = ?";
            // 3.预编译
            ps = con.prepareStatement(sql);
            // 4.设置值
            ps.setObject(1,user.getUsername());
            ps.setObject(2,user.getPassword());
            rs = ps.executeQuery();
            User users = null;
            if(rs.next()){
                users = new User();
                // 从数据库中获取值到实体类的setter方法中
                users.setUserid(rs.getInt("userid"));
                users.setUsername(rs.getString("username"));
                users.setPassword(rs.getString("password"));
                users.setEmail(rs.getString("email"));
                users.setPhone(rs.getString("phone"));
                users.setIsadmin(rs.getInt("isadmin"));
                // 返回的是你查询出来的完整的对象
                return users;

            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            // 关闭资源，避免出现异常
            BaseDao.close(con,ps,rs);
        }
        return null;
    }

    /**
     * 用户注册
     * @param user
     * @return
     */
    @Override
    public boolean register(User user) {
        String sql = "insert into user values (0,?,?,?,?,0)";
        List<Object> list = new ArrayList<Object>();
        list.add(user.getUsername());
        list.add(user.getPassword());
        list.add(user.getEmail());
        list.add(user.getPhone());

        boolean flag = BaseDao.addUpdateDelete(sql,list.toArray());
        if(flag){
            return true;
        }else {
            return false;
        }
    }

    /**
     * 查询用户信息
     * @param sql
     * @param arr
     * @return
     */
    @Override
    public List<User> selectUser(String sql, Object[] arr) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // 1.连接数据库
            con = BaseDao.getConnection();
            // 2.预编译
            ps = con.prepareStatement(sql);
            if(arr != null){
                for (int i = 0; i < arr.length; i++) {
                    ps.setObject(i+1,arr[i]);
                }
            }
            // 3.执行sql
            rs = ps.executeQuery();
            // 4.保存查询出来的数据到list
            List<User> list = new ArrayList<User>();
            while(rs.next()){
                User user = new User();
                // 从数据库中获取值到实体类的setter方法中
                user.setUserid(rs.getInt("userid"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setIsadmin(rs.getInt("isadmin"));

                // 测试数据
                System.out.println("Dao层测试日志，显示用户信息：");
                System.out.println(user);
                // 将对象保存到list中
                list.add(user);
            }
            return list;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            // 关闭资源，避免出现异常
            BaseDao.close(con,ps,rs);
        }
        return null;
    }

    /**
     * 根据用户编号进行查询
     * @param userid
     * @return
     */
    @Override
    public User getUser(Integer userid) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            // 1.连接数据库
            con = BaseDao.getConnection();
            // 2.预编译
            String sql = "select * from user where userid = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1,userid);
            // 3.执行sql
            rs = ps.executeQuery();
            while (rs.next()){
                User user = new User();
                user.setUserid(rs.getInt("userid"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setIsadmin(rs.getInt("isadmin"));

                return user;
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            // 关闭资源，避免出现异常
            BaseDao.close(con,ps,rs);
        }
        return null;
    }

    /**
     * 新增用户
     * @param user
     * @return
     */
    @Override
    public boolean addUser(User user) {
        String sql = "insert into user values (?,?,?,?,?,?)";
        List<Object> list = new ArrayList<Object>();
        list.add(user.getUserid());
        list.add(user.getUsername());
        list.add(user.getPassword());
        list.add(user.getEmail());
        list.add(user.getPhone());
        list.add(user.getIsadmin());

        boolean flag = BaseDao.addUpdateDelete(sql,list.toArray());
        if(flag){
            return true;
        }else {
            return false;
        }
    }

    /**
     * 修改用户
     * @param user
     * @return
     */
    @Override
    public boolean updateUser(User user) {
        String sql = "update user set password=?,email=?,phone=?,isadmin=? where userid=?";
        List<Object> list = new ArrayList<Object>();
        list.add(user.getPassword());
        list.add(user.getEmail());
        list.add(user.getPhone());
        list.add(user.getIsadmin());
        list.add(user.getUserid());

        boolean flag = BaseDao.addUpdateDelete(sql,list.toArray());
        if(flag){
            return true;
        }else {
            return false;
        }
    }

    /**
     * 删除用户
     * @param userid
     * @return
     */
    @Override
    public boolean deleteUser(Integer userid) {
        String sql = "delete from user where userid=?";
        List<Object> list = new ArrayList<Object>();
        list.add(userid);

        boolean flag = BaseDao.addUpdateDelete(sql,list.toArray());
        if(flag){
            return true;
        }else {
            return false;
        }
    }
}
