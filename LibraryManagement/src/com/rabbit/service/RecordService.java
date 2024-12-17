package com.rabbit.service;

import com.rabbit.po.Record;

import java.util.List;

/**
 * @author
 * @date 22:17
 */
public interface RecordService {


    public List<Record> selectRecords();


    public List<Record> selectRecord(Integer userid);


    public boolean addRecord(Record record);


    public boolean deleteRecord(Integer borrowid);
}
