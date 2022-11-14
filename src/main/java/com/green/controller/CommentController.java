package com.green.controller;

import com.green.dao.CommentDao;
import com.green.service.CommentService;
import com.green.vo.CommentVo;
import com.green.vo.PageVo;
import org.apache.ibatis.reflection.SystemMetaObject;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.sql.SQLOutput;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class CommentController {
	PageVo page= new PageVo();
	@Autowired
	CommentService commentService;

	@GetMapping("/commentListPage")
	public String commentListPage(Model model, @RequestParam int content_id, @RequestParam int num ) throws Exception {

		page.setNum(num);
		page.setCount(commentService.commentCount(content_id));
		System.out.println("vpdlwl"+page.getPostnum());
		model.addAttribute("content_id", content_id);
		model.addAttribute("page", page);
		return "/commentListPage";
	}

	//페이징 된 리스트
	@GetMapping("comment/getCommentListPage")
	@ResponseBody
	public List<JSONObject> getCommentList(@RequestParam int content_id, @RequestParam(value="num", required = false, defaultValue = "1") int num) throws Exception {

		page.setNum(num);
		page.setCount(commentService.commentCount(content_id));
		int postNum = page.getPostnum();
		int displayPost = page.getDisplaypost();


		List<JSONObject> commentList = new ArrayList<>();
		for (CommentVo cl : commentService.coommentListPage(content_id, displayPost, postNum)) {
			JSONObject obj = new JSONObject();
			obj.put("name", cl.getUsername());
			obj.put("_id", cl.get_id());
			obj.put("content", cl.getContent());
			obj.put("time", cl.getTime());
			obj.put("pagingNum",displayPost);
			commentList.add(obj);

		}
		System.out.println(commentList);
		return commentList;
	}
	//댓글쓰기 전송
	@PostMapping("comment/writeComment")
	@ResponseBody
	public  Map<String, Object>  writeComment(CommentVo commentVo) {
		System.out.println(commentVo);
		Map<String, Object> map = new HashMap <String, Object>();
		try {
			commentService.writeComment(commentVo);
			map.put("result", "success");
		}catch (Exception e) {
			e.printStackTrace();
			map.put("result", "fail");
		}
		System.out.println("map"+map);
		return  map ;

	}
	//댓글수정 전송
	@PostMapping("comment/updatecomment")
	@ResponseBody
	public  Map<String, Object>  commentUpdate(@RequestParam int _id, String content, String username){

		Map<String, Object>commentupdate = new HashMap<String, Object>();
		commentupdate.put("_id", _id);
		commentupdate.put("content", content);
		commentupdate.put("username", username);

		Map<String, Object> map = new HashMap <String, Object>();
		try {
			commentService.commentUpdate(commentupdate);
			map.put("result", "success");
		}catch (Exception e) {
			e.printStackTrace();
			map.put("result", "fail");
		}
		return  map ;

	}
	//댓글삭제
	@PostMapping("comment/deletecomment")
	@ResponseBody
	public Map<String, Object> commentDelete(@RequestParam int _id){
		Map<String, Object> map = new HashMap <String, Object>();
		try {
			commentService.commentDelete(_id);
			map.put("result", "success");
		}catch (Exception e) {
			e.printStackTrace();
			map.put("result", "fail");
		}
		return  map ;

	}

	//댓글 jsp파일 호출

}
