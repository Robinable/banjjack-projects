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

	@GetMapping("/list")
	public String list(Model model, @RequestParam String category) {
		model.addAttribute("category", category);
		return "/list";
	}
	@GetMapping("/getlist")
	@ResponseBody
	public List<JSONObject> getList(@RequestParam String category) {
		List<JSONObject> getList = new ArrayList<>();
		for (WriteVo vo : writeService.getList(category)){
			JSONObject data = new JSONObject();
			data.put("_id", vo.get_id());
			data.put("title", vo.getTitle());
			data.put("username", vo.getUsername());
			data.put("category", vo.getCategory());
			data.put("time", vo.getTime());
			data.put("readcount", vo.getReadcount());
			getList.add(data);
		}
		return getList;
	}

	@GetMapping("/viewform")
	public String viewForm(Model model, @RequestParam String _id, @RequestParam String category) {
		model.addAttribute("_id", _id);
		model.addAttribute("category", category);
		return "/view";
	}

	@GetMapping("/getview")
	@ResponseBody
	public List<JSONObject> getView(@RequestParam String _id) {
		List<JSONObject> getView = new ArrayList<>();
		for (WriteVo vo : writeService.getViewVo(_id)){
			vo.setContent(vo.getContent().replace("\n", "<br>" ));
			JSONObject data = new JSONObject();
			data.put("_id", vo.get_id());
			data.put("title", vo.getTitle());
			data.put("username", vo.getUsername());
			data.put("content", vo.getContent());
			data.put("category", vo.getCategory());
			data.put("time", vo.getTime());
			data.put("readcount", vo.getReadcount());
			getView.add(data);
		}
		return getView;
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
		return "redirect:/list?category=" + writeVo.getCategory();
	}

	@GetMapping("/updateForm")
	public String updateFormJson(Model model, @RequestParam String _id) {
		model.addAttribute("_id", _id);
		return "/update";
	}

	@GetMapping("/viewupdate")
	@ResponseBody
	public List<JSONObject> updateFormJson(@RequestParam String _id) {
		List<JSONObject> getView = new ArrayList<>();
		for (WriteVo vo : writeService.getViewVo(_id)){
			JSONObject data = new JSONObject();
			data.put("_id", vo.get_id());
			data.put("title", vo.getTitle());
			data.put("username", vo.getUsername());
			data.put("content", vo.getContent());
			data.put("category", vo.getCategory());
			data.put("time", vo.getTime());
			data.put("readcount", vo.getReadcount());
			getView.add(data);
		}
		return getView;
	}

	@GetMapping("/update")
	public String update(HttpServletRequest request) {
		WriteVo writeVo = new WriteVo();
		writeVo.set_id(Integer.parseInt(request.getParameter("_id")));
		writeVo.setCategory(Integer.parseInt(request.getParameter("category")));
		writeVo.setContent(request.getParameter("content"));
		writeVo.setTitle(request.getParameter("title"));
		System.out.println("control" + writeVo.toString());
		writeService.updateBoard(writeVo);
		return "redirect:/list?category=" + writeVo.getCategory();
	}

	@GetMapping("/delete")
	public String delete(@RequestParam String _id, @RequestParam String category) {
		writeService.delete(_id);
		System.out.println(category);
		return "redirect:/list?category=" + category ;
	}



}
