package com.rabbit.dao;

import com.rabbit.po.Comment;

import java.util.List;

/**
 * @author
 * @date 17:21
 */
public interface CommentDao {


    public boolean addComment(Comment comment);


    public List<Comment> selectComment(Integer bookid);
}
