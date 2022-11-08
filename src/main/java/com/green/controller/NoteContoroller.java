package com.green.controller;

import com.green.service.NoteService;
import com.green.vo.NoteVo;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
public class NoteContoroller {
@Autowired private NoteService noteService;

	@RequestMapping ("/writeNoteForm")
	public String writeMsgForm() {
		return "/writeNote";
	}

	// 쪽지 쓰기
	@RequestMapping(value = "/writenote", method = RequestMethod.POST )
	public String write(HttpServletRequest request){
		NoteVo noteVo = new NoteVo();
		noteVo.setContent(request.getParameter("content"));
		noteVo.setSend(request.getParameter("send"));
		noteVo.setRecept(request.getParameter("recept"));
		noteService.insertNote(noteVo);
		return "/receptNote";
	}

    // 받은 쪽지확인 (받은 아이디로 조회)

	@GetMapping ("/receptNote")
	public String recepte(){
		return "/receptNote";
	}

	@GetMapping("/getreceptnote")
	@ResponseBody
	public  List<JSONObject> getreceptnote(@RequestParam String recept){
		List<JSONObject> NoteVoList = new ArrayList<>();
		for (NoteVo vo : noteService.selectRecept(recept)){
			JSONObject obj = new JSONObject();
			obj.put("_id", vo.get_id());
			obj.put("content", vo.getContent());
			obj.put("send", vo.getSend());
			obj.put("time", vo.getTime());
			NoteVoList.add(obj);
		}
		return NoteVoList;
	}

    // 보낸쪽지 확인 (보낸 아이디로 조회)
	@GetMapping("/sendNote")
	public String sendNote(){
		return "/sendNote";
	}

	@GetMapping("/getsendnote")
	@ResponseBody
	public  List<JSONObject> getsendnote(@RequestParam String send) {
		List<JSONObject> NoteVoList = new ArrayList<>();
		for (NoteVo vo : noteService.selectSend(send)) {
			JSONObject obj = new JSONObject();
			obj.put("_id", vo.get_id());
			obj.put("content", vo.getContent());
			obj.put("recept", vo.getRecept());
			obj.put("time", vo.getTime());
			NoteVoList.add(obj);
		}
		return NoteVoList;
	}




	// 쪽지 내용 확인
	@GetMapping("/readNote")
	public String sendMessage() {
		return "/contNote";
	}

	@GetMapping("/getcontnote")
	@ResponseBody
	public  List<JSONObject> getcontnote(@RequestParam int _id) {
		List<JSONObject> NoteVoList = new ArrayList<>();
		NoteVo vo = noteService.selectCont(_id);
			JSONObject obj = new JSONObject();
			obj.put("content", vo.getContent());
		    obj.put("recept", vo.getRecept());
			obj.put("send", vo.getSend());
			obj.put("time", vo.getTime());
			NoteVoList.add(obj);
			System.out.println(NoteVoList);

		return NoteVoList;
	}


}

