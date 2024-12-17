package com.rabbit.service;

import com.rabbit.po.Comment;

import java.util.List;

/**
 * @author
 * @date 17:21
 */
public interface CommentService {

    public boolean addComment(Comment comment);


    public List<Comment> selectComment(Integer bookid);

}
