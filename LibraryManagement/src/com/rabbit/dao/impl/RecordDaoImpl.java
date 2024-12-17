package com.rabbit.dao.impl;

import com.rabbit.dao.RecordDao;
import com.rabbit.po.Record;
import com.rabbit.utils.BaseDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author
 * @date 22:18
 */
public class RecordDaoImpl implements RecordDao {


    @Override
    public List<Record> selectRecords() {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        List<Record> list = new ArrayList<>();
        try {
            // 1.�������ݿ�
            con = BaseDao.getConnection();
            // 2.Ԥ����
            String sql = "select * from record";
            ps = con.prepareStatement(sql);
            // 3.ִ��sql
            rs = ps.executeQuery();
            while (rs.next()){
                Record record = new Record();
                record.setBorrowid(rs.getInt("borrowid"));
                record.setUserid(rs.getInt("userid"));
                record.setBookid(rs.getInt("bookid"));
                record.setBookname(rs.getString("bookname"));
                record.setBooklink(rs.getString("booklink"));
                record.setBorrowtime(rs.getDate("borrowtime"));

                list.add(record);
            }

            return list;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            // �ر���Դ����������쳣
            BaseDao.close(con,ps,rs);
        }
        return null;
    }

    @Override
    public List<Record> selectRecord(Integer userid) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        List<Record> list = new ArrayList<>();
        try {

            con = BaseDao.getConnection();

            String sql = "select * from record where userid=?";
            ps = con.prepareStatement(sql);
            ps.setInt(1,userid);

            rs = ps.executeQuery();
            while (rs.next()){
                Record record = new Record();
                record.setBorrowid(rs.getInt("borrowid"));
                record.setUserid(rs.getInt("userid"));
                record.setBookid(rs.getInt("bookid"));
                record.setBookname(rs.getString("bookname"));
                record.setBooklink(rs.getString("booklink"));
                record.setBorrowtime(rs.getDate("borrowtime"));

                list.add(record);
            }

            return list;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            // �ر���Դ����������쳣
            BaseDao.close(con,ps,rs);
        }
        return null;
    }

    @Override
    public boolean addRecord(Record record) {
        String sql = "insert into record values (0,?,?,?,?,now())";
        List<Object> list = new ArrayList<Object>();
        list.add(record.getUserid());
        list.add(record.getBookid());
        list.add(record.getBookname());
        list.add(record.getBooklink());


        boolean flag = BaseDao.addUpdateDelete(sql,list.toArray());
        if(flag){
            return true;
        }else {
            return false;
        }
    }

    @Override
    public boolean deleteRecord(Integer borrowid) {
        String sql = "delete from record where borrowid=?";
        List<Object> list = new ArrayList<Object>();
        list.add(borrowid);

        boolean flag = BaseDao.addUpdateDelete(sql,list.toArray());
        if(flag){
            return true;
        }else {
            return false;
        }
    }
}
