package com.zcc.dao;

import com.zcc.entity.Msg;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by dell on 2018/5/13.
 */
public interface MsgRepository extends JpaRepository<Msg, Long> {
}
