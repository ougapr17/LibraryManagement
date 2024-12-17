package com.rabbit.service.impl;

import com.rabbit.dao.BookShelfDao;
import com.rabbit.dao.impl.BookShelfDaoImpl;
import com.rabbit.po.BookShelf;
import com.rabbit.service.BookShelfService;

import java.util.List;

/**
 * @author
 * @date 12:36
 */
public class BookShelfServiceImpl implements BookShelfService {

    private BookShelfDao bookShelfDao = new BookShelfDaoImpl();

    @Override
    public List<BookShelf> selectBookShelf(Integer userid) {
        return bookShelfDao.selectBookShelf(userid);
    }

    @Override
    public boolean addBookShelf(BookShelf bookShelf) {
        return bookShelfDao.addBookShelf(bookShelf);
    }

    @Override
    public boolean removeBookShelf(Integer userid, Integer bookid) {
        return bookShelfDao.removeBookShelf(userid,bookid);
    }
}
