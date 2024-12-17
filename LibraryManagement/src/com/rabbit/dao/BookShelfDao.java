package com.rabbit.dao;

import com.rabbit.po.BookShelf;

import java.util.List;

/**
 * @author
 * @date 12:23
 */
public interface BookShelfDao {



    public List<BookShelf> selectBookShelf(Integer userid);



    public boolean addBookShelf(BookShelf bookShelf);



    public boolean removeBookShelf(Integer userid,Integer bookid);
}
