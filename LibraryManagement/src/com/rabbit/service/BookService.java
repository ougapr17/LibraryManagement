package com.rabbit.service;

import com.rabbit.po.Book;

import java.util.List;

/**
 * @author
 * @date  23:37
 * Book的Service层
 */
public interface BookService {

    /**
     * 查询图书信息
     * @param bookname
     * @return
     */
    public List<Book> select(String bookname);

    /**
     * 根据图书编号进行查询
     * @param id
     * @return
     */
    public Book getBook(Integer id);


    /**
     * 图书新增
     * @param book
     * @return
     */
    public boolean addBook(Book book);

    /**
     * 图书修改
     * @param book
     * @return
     */
    public boolean updateBook(Book book);

    /**
     * 删除图书
     * @param bookid
     * @return
     */
    public boolean deleteBook(Integer bookid);
}
