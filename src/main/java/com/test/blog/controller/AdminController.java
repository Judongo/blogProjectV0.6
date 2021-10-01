package com.test.blog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.test.blog.service.AdminService;
import com.test.blog.service.BoardService;
import com.test.blog.service.UserService;

@Controller
public class AdminController {

	@Autowired
	private BoardService boardService;
	@Autowired
	private UserService userService;
	@Autowired
	private AdminService adminService;

	// users에 사용자목록을 페이징해서 가져옴
	@GetMapping("/admin/user")
	public String index(Model model,
			@PageableDefault(size = 5, sort = "id", direction = Sort.Direction.DESC) Pageable pageable) {

		model.addAttribute("users", adminService.사용자목록(pageable));

		return "admin/user";
	}

	@GetMapping("/admin/{id}")
	public String findById(@PathVariable int id, Model model) {
		model.addAttribute("admin", adminService.유저상세보기(id));
		return "admin/detail";

	}

	@GetMapping("/admin/point/{id}")
	public String pointById(@PathVariable int id, Model model) {
		model.addAttribute("admin", adminService.유저상세보기(id));
		return "admin/pointDetail";

	}

	@GetMapping("/admin/index")
	public String adminIndex() {

		return "admin/index";
	}

	@GetMapping("/admin/board")
	public String adminBoard(Model model,
			@PageableDefault(size = 5, sort = "id", direction = Sort.Direction.DESC) Pageable pageable) {
		model.addAttribute("boards",adminService.게시글목록(pageable));
		return "admin/board";
	}

	@GetMapping("/admin/board/{id}")
	public String deleteBoardById(@PathVariable int id, Model model) {
		model.addAttribute("admin", adminService.게시글상세보기(id));
		
		return "admin/boardDetail";
	}
	
	@GetMapping("/admin/data")
	public String adminData() {

		return "admin/data";
	}
}
