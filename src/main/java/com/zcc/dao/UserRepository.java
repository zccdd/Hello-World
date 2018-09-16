package com.zcc.dao;

import com.zcc.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by dell on 2018/5/13.
 */
public interface UserRepository extends JpaRepository<User, Long> {
    User findByUserName(String userName);
}
