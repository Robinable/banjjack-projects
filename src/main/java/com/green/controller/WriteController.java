package com.green.controller;

import com.green.service.WriteService;
import com.green.vo.WriteVo;
import jdk.jfr.Category;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
public class WriteController {
	@Autowired
	private WriteService writeService;


	@GetMapping("/writejson")
	public String writeJson(Model model, @RequestParam String category) {
		model.addAttribute("category", category);
		return "/list";
	}
	@GetMapping("/getwritejson")
	@ResponseBody
	public List<JSONObject> getWriteJson(@RequestParam String category) {
		List<JSONObject> writeJson = new ArrayList<>();
		for (WriteVo vo : writeService.getWriteJson(category)){
			JSONObject data = new JSONObject();
			data.put("_id", vo.get_id());
			data.put("title", vo.getTitle());
			data.put("username", vo.getUsername());
			data.put("category", vo.getCategory());
			data.put("time", vo.getTime());
			data.put("readcount", vo.getReadcount());
			writeJson.add(data);
		}
		return writeJson;
	}

	@GetMapping("/viewjson")
	public String viewJson(Model model, @RequestParam String _id, @RequestParam String category) {
		model.addAttribute("_id", _id);
		model.addAttribute("category", category);
		return "/view";
	}

	@GetMapping("/getviewjson")
	@ResponseBody
	public List<JSONObject> getViewJson(@RequestParam String _id) {
		List<JSONObject> viewJson = new ArrayList<>();
		for (WriteVo vo : writeService.getViewJson(_id)){
			vo.setContent(vo.getContent().replace("\n", "<br>" ));
			JSONObject data = new JSONObject();
			data.put("_id", vo.get_id());
			data.put("title", vo.getTitle());
			data.put("username", vo.getUsername());
			data.put("content", vo.getContent());
			data.put("category", vo.getCategory());
			data.put("time", vo.getTime());
			data.put("readcount", vo.getReadcount());
			viewJson.add(data);
		}
		return viewJson;
	}


	@GetMapping("/writeform")
	public String getWriteForm(Model model, @RequestParam String username){
		model.addAttribute("username", username);
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
		writeService.Write(writeVo);
		return "redirect:/writejson?category=" + writeVo.getCategory();
	}

	@GetMapping("/updateForm")
	public String updateForm(Model model, @RequestParam String _id){
		WriteVo board = writeService.getBoard(_id);
		model.addAttribute("board", board);
		return "/update";
	}

	@GetMapping("/update")
	public String update(HttpServletRequest request, @RequestParam String category) {
		WriteVo writeVo = new WriteVo();
		writeVo.set_id(Integer.parseInt(request.getParameter("_id")));
		writeVo.setContent(request.getParameter("content"));
		writeVo.setTitle(request.getParameter("title"));
		writeService.updateBoard(writeVo);
		return "redirect:/writejson?category=" + category;
	}

	@GetMapping("/delete")
	public String delete(@RequestParam String _id, @RequestParam String category) {
		writeService.delete(_id);
		System.out.println(category);
		return "redirect:/writejson?category=" + category ;
	}



}
