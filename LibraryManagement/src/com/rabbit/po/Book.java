package com.rabbit.po;

import java.io.Serializable;
import java.util.Date;

/**
 * @author
 * @date  22:40
 */

public class Book implements Serializable {

    private static final long serialVersionUID = 1L;
    private Integer bookid;
    private String bookname;
    private Double price;
    private String author;
    private String publish;
    private Integer categoryid;
    private String booklink;
    private Date deadline;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Integer getBookid() {
        return bookid;
    }

    public void setBookid(Integer bookid) {
        this.bookid = bookid;
    }

    public String getBookname() {
        return bookname;
    }

    public void setBookname(String bookname) {
        this.bookname = bookname;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPublish() {
        return publish;
    }

    public void setPublish(String publish) {
        this.publish = publish;
    }

    public Integer getCategoryid() {
        return categoryid;
    }

    public void setCategoryid(Integer categoryid) {
        this.categoryid = categoryid;
    }

    public String getBooklink() {
        return booklink;
    }

    public void setBooklink(String booklink) {
        this.booklink = booklink;
    }

    public Date getDeadline() {
        return deadline;
    }

    public void setDeadline(Date deadline) {
        this.deadline = deadline;
    }

    @Override
    public String toString() {
        return "Book{" +
                "bookid=" + bookid +
                ", bookname='" + bookname + '\'' +
                ", price=" + price +
                ", author='" + author + '\'' +
                ", publish='" + publish + '\'' +
                ", categoryid=" + categoryid +
                ", booklink='" + booklink + '\'' +
                ", deadline=" + deadline +
                '}';
    }
}
