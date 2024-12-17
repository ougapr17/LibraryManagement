package com.rabbit.service.impl;

import com.rabbit.dao.CommentDao;
import com.rabbit.dao.impl.CommentDaoImpl;
import com.rabbit.po.Comment;
import com.rabbit.service.CommentService;

import java.util.List;

/**
 * @author
 * @date 17:22
 */
public class CommentServiceImpl implements CommentService {

    private CommentDao commentDao = new CommentDaoImpl();


    @Override
    public boolean addComment(Comment comment) {
        return commentDao.addComment(comment);
    }

    @Override
    public List<Comment> selectComment(Integer bookid) {
        return commentDao.selectComment(bookid);
    }
}
