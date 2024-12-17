package com.rabbit.service;

import com.rabbit.po.BookShelf;

import java.util.List;

/**
 * @author
 * @date 12:36
 */
public interface BookShelfService {


    public List<BookShelf> selectBookShelf(Integer userid);


    public boolean addBookShelf(BookShelf bookShelf);


    public boolean removeBookShelf(Integer userid,Integer bookid);

}
