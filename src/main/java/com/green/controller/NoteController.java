package com.green.controller;

import com.green.service.NoteService;
import com.green.vo.NoteVo;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
public class NoteController {
@Autowired private NoteService noteService;

	@RequestMapping ("/writeNoteForm")
	public String writeNoteForm() {
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

    // // 받은 쪽지함 + 페이징 (받은 아이디로 조회)
	@GetMapping ("/receptNote")
	public String recept(@RequestParam int num, @RequestParam String recept, Model model){

		int count = noteService.receptcount(recept);
		int postnum = 10;
		int pagenum = (int)Math.ceil((double)count/postnum);
		int displaypost = (num - 1) * postnum;

		model.addAttribute("pagenum",pagenum);
        model.addAttribute("num",num);
		return "/receptNote2";
	}


	@GetMapping("/getreceptnote")
	@ResponseBody
	public  List<JSONObject> getreceptnote(@RequestParam String recept, @RequestParam int num){

		int postnum = 10;
		int displaypost = (num - 1) * postnum;

		List<JSONObject> NoteVoList = new ArrayList<>();
		for (NoteVo vo : noteService.receptpage(recept,displaypost,postnum)){
			JSONObject obj = new JSONObject();
			obj.put("_id", vo.get_id());
			obj.put("content", vo.getContent());
			obj.put("send", vo.getSend());
			obj.put("time", vo.getTime());
			obj.put("displaypost", vo.getDisplaypost());
			obj.put("postnum", vo.getPostnum());

			NoteVoList.add(obj);
		}
		return NoteVoList;
	}


    // 보낸쪽지 확인 (보낸 아이디로 조회)
	@GetMapping("/sendNote")
	public String sendNote(@RequestParam int num, @RequestParam String send, Model model){

		int count = noteService.sendcount(send);
		int postnum = 10;
		int pagenum = (int)Math.ceil((double)count/postnum);
		int displaypost = (num - 1) * postnum;

		System.out.println(count);

		model.addAttribute("pagenum",pagenum);
		model.addAttribute("num",num);

		return "/sendNote2";
	}

//	@GetMapping("/getsendnote")
//	@ResponseBody
//	public  List<JSONObject> getsendnote(@RequestParam String send) {
//		List<JSONObject> NoteVoList = new ArrayList<>();
//		for (NoteVo vo : noteService.selectSend(send)) {
//			JSONObject obj = new JSONObject();
//			obj.put("_id", vo.get_id());
//			obj.put("content", vo.getContent());
//			obj.put("recept", vo.getRecept());
//			obj.put("time", vo.getTime());
//			NoteVoList.add(obj);
//		}
//		return NoteVoList;
//	}

    // 보낸쪽지확인 + 페이징
	@GetMapping("/getsendnote")
	@ResponseBody
	public  List<JSONObject> getsendnote(@RequestParam String send, @RequestParam int num) {

		int postnum = 10;
		int displaypost = (num - 1) * postnum;

		List<JSONObject> NoteVoList = new ArrayList<>();
		for (NoteVo vo : noteService.sendpage(send, displaypost, postnum)) {
			JSONObject obj = new JSONObject();
			obj.put("_id", vo.get_id());
			obj.put("content", vo.getContent());
			obj.put("recept", vo.getRecept());
			obj.put("time", vo.getTime());
			obj.put("displaypost", vo.getDisplaypost());
			obj.put("postnum", vo.getPostnum());

			NoteVoList.add(obj);
		}
		System.out.println(NoteVoList);
		return NoteVoList;
	}




	// 쪽지 내용 확인
	@GetMapping("/readNote")
	public String readNote(@RequestParam int _id, Model model) {
		//int _id = Integer.valueOf(request.getParameter("_id"));
		model.addAttribute("_id",_id);

		return "/contNote";
	}

	@GetMapping("/getcontNote")
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

		return NoteVoList;
	}


	// 쪽지 삭제
	@GetMapping("/deleteNote")
	public String deletenote(@RequestParam int _id){
		noteService.deleteNote(_id);

		return "/receptNote";
	}

	@PostMapping("/selectDeleteNote")
    public String selectDeleteNote(HttpServletRequest request){

		String[] a = request.getParameterValues("valueArr");
		int size = a.length;
		int _id = 0;
		for (int i=0; i<size; i++){
			noteService.deleteNote(Integer.parseInt(a[i]));
		}

		return "receptNote";
	}


}


//@RequestParam 주소줄 값 가져옴, HttpServletRequest 본문 값 가져옴(?)