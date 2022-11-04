package com.green.controller;

import com.green.service.WriteService;
import com.green.vo.WriteVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class WriteController {
	@Autowired
	private WriteService writeService;

	@GetMapping("/list")
	public String List(Model model, @RequestParam String category) {

		List<WriteVo> boardList = writeService.getList(category);
		model.addAttribute("boardList", boardList);
		return "/list";
	}

	@GetMapping("/writeform")
	public String getWriteForm(@RequestParam String username){
		System.out.println(username);
		return "/write";
	}

	@GetMapping("/write_insert")
	public String insertWrite(HttpServletRequest request){
		WriteVo writeVo = new WriteVo();
		writeVo.set_id(Integer.parseInt(request.getParameter("_id")));
		writeVo.setCategory(Integer.parseInt(request.getParameter("category")));
		writeVo.setContent(request.getParameter("content"));
		writeVo.setTitle(request.getParameter("title"));
		writeVo.setUsername(request.getParameter("username"));
		writeVo.setTime(request.getParameter("time"));
		writeVo.setReadcount(Integer.parseInt(request.getParameter("readcount")));
		System.out.println(writeVo.toString());
		writeService.Write(writeVo);
		return "/list";
	}

	@GetMapping("/view")
	public String view(Model model, @RequestParam String _id) {
		WriteVo board = writeService.getBoard(_id);
		model.addAttribute("board", board);
		return "/view";
	}



}
