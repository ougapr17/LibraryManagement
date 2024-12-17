package com.rabbit.service.impl;

import com.rabbit.dao.BookDao;
import com.rabbit.dao.impl.BookDaoImpl;
import com.rabbit.po.Book;
import com.rabbit.service.BookService;

import java.util.ArrayList;
import java.util.List;

/**
 * @author
 * @date  23:42
 * Book的Service实现层
 */
public class BookServiceImpl implements BookService {

    private BookDao bookDao = new BookDaoImpl();

    /**
     * 按照书籍名查询图书信息
     * @param bookname
     * @return
     */
    @Override
    public List<Book> select(String bookname) {
        StringBuffer sql = new StringBuffer("SELECT * FROM book WHERE 1 = 1 ");
        List<Object> list = new ArrayList<Object>();
        if (bookname != null && !bookname.equals("")) {
            sql.append(" AND bookname LIKE ?");
            list.add("%" + bookname + "%");
        }
        return bookDao.select(sql.toString(),list.toArray());
    }

    @Override
    public Book getBook(Integer bookid) {
        return bookDao.getBook(bookid);
    }

    @Override
    public boolean addBook(Book book) {
        return bookDao.addBook(book);
    }

    @Override
    public boolean updateBook(Book book) {
        return bookDao.updateBook(book);
    }

    @Override
    public boolean deleteBook(Integer bookid) {
        return bookDao.deleteBook(bookid);
    }


}
