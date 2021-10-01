package com.test.blog.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.test.blog.model.Reply;

public interface ReplyRepository extends JpaRepository<Reply, Integer>{

}
