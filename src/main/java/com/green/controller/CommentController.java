package com.green.controller;

import com.green.dao.CommentDao;
import com.green.service.CommentService;
import com.green.vo.CommentVo;
import com.green.vo.PageVo;
import com.green.vo.TimeGap;
import org.apache.ibatis.reflection.SystemMetaObject;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.SQLOutput;
import java.text.ParseException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class CommentController {
	PageVo page = new PageVo();
	TimeGap timeGap = new TimeGap();
	@Autowired
	CommentService commentService;

	@Autowired
	CommentDao commentDao;


	//댓글 jsp파일 호출
	@GetMapping("/comment")

	public String getComment() {

		return "/comment";
	}

	//댓글 리스트 호출
	@GetMapping("comment/commentList")
	@ResponseBody
	public List<JSONObject> getCommentList(@RequestParam int content_id, int menu_id, int num) throws ParseException {
		System.out.println("num"+num);
		page.setNum(num);
		page.setCount(commentService.listCount(num, menu_id, content_id));

		int displaypost = page.getDisplaypost();
		int postnum = page.getPostnum();

		List<JSONObject> commentList = new ArrayList<>();
		JSONObject paging = new JSONObject();
		paging.put("commentCount", page.getCount());
		paging.put("num", num);
		paging.put("startPageNum", page.getStartpagenum());
		paging.put("endPageNum", page.getEndpagenum());
		paging.put("prev", page.getPrev());
		paging.put("next", page.getNext());
		paging.put("select", num);
		commentList.add(paging);

		for (CommentVo cl : commentService.getCommentList(content_id, menu_id, displaypost, postnum)) {
			System.out.println("du");
			timeGap.setTime(cl.getTime());
			JSONObject obj = new JSONObject();
			obj.put("name", cl.getUsername());
			obj.put("_id", cl.get_id());
			obj.put("content", cl.getContent());
			obj.put("time", timeGap.getTime());
			obj.put("profiledata", cl.getProfiledata());

			commentList.add(obj);
		}
		System.out.println("CL"+commentList);
		return commentList;
	}

	//댓글쓰기 전송
	@PostMapping("comment/writeComment")
	@ResponseBody
	public Map<String, Object> writeComment(CommentVo commentVo, HttpSession session) {
		Map<String, Object> map = new HashMap<>();

		if(session.getAttribute("login")==null) {

			map.put("result", "loginFail");

		}else{
			commentService.writeComment(commentVo);
			map.put("result", "success");
		}
		return map;

	}

	//댓글수정 전송
	@PostMapping("comment/updatecomment")
	@ResponseBody
	public Map<String, Object> commentUpdate(@RequestParam int _id, String content, String username) {
		Map<String, Object> commentupdate = new HashMap<>();
		commentupdate.put("_id", _id);
		commentupdate.put("content", content);
		commentupdate.put("username", username);

		Map<String, Object> map = new HashMap<String, Object>();
		try {
			commentService.commentUpdate(commentupdate);
			map.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("result", "fail");
		}
		return map;

	}

	//댓글삭제
	@PostMapping("comment/deletecomment")
	@ResponseBody
	public Map<String, Object> commentDelete(@RequestParam int _id) {
		CommentVo commentVo = new CommentVo();
		commentVo.set_id(_id);

		Map<String, Object> map = new HashMap<String, Object>();
		try {
			commentService.commentDelete( commentVo );
			map.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("result", "fail");
		}
		return map;
	}
}
