package com.zcc.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by dell on 2018/5/13.
 */
@Entity
public class Msg implements Serializable {

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private long id;
    @Column(nullable = false)
    private String userName;
    @Column(nullable = false)
    private String message;
    @Column(nullable = false)
    private Date current;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Date getCurrent() {
        return current;
    }

    public void setCurrent(Date current) {
        this.current = current;
    }

    @Override
    public String toString() {
        return "Msg{" +
                "id=" + id +
                ", userName='" + userName + '\'' +
                ", message='" + message + '\'' +
                ", current=" + current +
                '}';
    }
}
