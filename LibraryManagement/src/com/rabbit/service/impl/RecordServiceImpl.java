package com.rabbit.service.impl;

import com.rabbit.dao.RecordDao;
import com.rabbit.dao.impl.RecordDaoImpl;
import com.rabbit.po.Record;
import com.rabbit.service.RecordService;

import java.util.List;

/**
 * @author
 * @date 22:18
 */
public class RecordServiceImpl implements RecordService {

    private RecordDao recordDao = new RecordDaoImpl();

    @Override
    public List<Record> selectRecords() {
        return recordDao.selectRecords();
    }

    @Override
    public List<Record> selectRecord(Integer userid) {
        return recordDao.selectRecord(userid);
    }

    @Override
    public boolean addRecord(Record record) {
        return recordDao.addRecord(record);
    }

    @Override
    public boolean deleteRecord(Integer borrowid) {
        return recordDao.deleteRecord(borrowid);
    }
}
