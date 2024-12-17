package com.rabbit.dao;

import com.rabbit.po.Record;

import java.util.List;

/**
 * @author

 */
public interface RecordDao {


    public List<Record> selectRecords();


    public List<Record> selectRecord(Integer userid);



    public boolean addRecord(Record record);


    public boolean deleteRecord(Integer borrowid);
}
