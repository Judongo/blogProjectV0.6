package com.test.blog.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.test.blog.model.Board;
import com.test.blog.model.User;
import com.test.blog.repository.BoardRepository;
import com.test.blog.repository.ReplyRepository;
import com.test.blog.repository.UserRepository;

@Service // 스프링이 컴포넌트 스캔을 통해서 bean에 등록을 해줌. Ioc를 해줌.
public class AdminService {

	@Autowired
	private BoardRepository boardRepository;

	@Autowired
	private ReplyRepository replyRepository;
	
	@Autowired
	private UserRepository userRepository;


	//사용자 리스트 출력. 
	@Transactional(readOnly = true)
	public Page<User> 사용자목록(Pageable pageable){
		return userRepository.findAll(pageable);
	}
	
	//게시글 리스트 출력
	@Transactional(readOnly = true)
	public Page<Board> 게시글목록(Pageable pageable){
		return boardRepository.findAll(pageable);
	}

	@Transactional(readOnly = true)
	public User 유저상세보기(int id) {
		return userRepository.findById(id)
				.orElseThrow(()->{
					return new IllegalArgumentException("글 상세보기 실패: 아이디를 찾을 수 없습니다.");
				});
	}
	
	@Transactional(readOnly = true)
	public Board 게시글상세보기(int id) {
		return boardRepository.findById(id)
				.orElseThrow(()->{
					return new IllegalArgumentException("글 상세보기 실패: 아이디를 찾을 수 없습니다.");
				});
	}
}
