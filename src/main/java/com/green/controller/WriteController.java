package com.green.controller;

import com.green.service.WriteService;
import com.green.vo.WriteVo;
import com.green.vo.FileVo;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;


@Controller
public class WriteController {
	@Autowired
	private WriteService writeService;

	@PostMapping("/writeAction")
	public String writeAction() {

		return "/writeAction";
	}

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
			FileVo fileVo = writeService.getFile(_id);
			if(fileVo != null) {
				data.put("filename", fileVo.getFilename());
				data.put("filepath", fileVo.getFilepath());
			}
			getView.add(data);}

		return getView;
	}

	@GetMapping("/writeform")
	public String getWriteForm(Model model, @RequestParam String username){
		model.addAttribute("username", username);
		return "/write";
	}

	@PostMapping("/write_insert")
	public String insertWrite(HttpServletRequest request, MultipartFile file) throws IOException {
		//컨텐츠 테이블에 인설트
		WriteVo writeVo = new WriteVo();
		writeVo.setCategory(Integer.parseInt(request.getParameter("category")));
		writeVo.setContent(request.getParameter("content"));
		writeVo.setTitle(request.getParameter("title"));
		writeVo.setUsername(request.getParameter("username"));
		writeVo.setTime(request.getParameter("time"));
		writeVo.setReadcount(Integer.parseInt(request.getParameter("readcount")));
		writeService.Write(writeVo);

		//컨텐츠 테이블에 셀렉 => _id가져옴
		writeService.get_id(writeVo);
		System.out.println("content_id controller:" + writeVo.get_id());
		System.out.println(file.getName());
		//파일디비에 인설트 할때 컨텐츠 아이디에 위에서 셀렉한놈 집어넣음
		if (file.isEmpty()) {

		} else {
			FileVo fileVo = new FileVo();
			System.out.println(file);
			String projectPath = /*System.getProperty("user.dir") +*/  "C:\\Users\\GGG\\Desktop\\aaa\\green-spring2\\src\\main\\webapp\\WEB-INF\\resources\\files\\";
			UUID uuid = UUID.randomUUID();
			String fileName = uuid + "_" + file.getOriginalFilename();
			File saveFile = new File(projectPath, fileName);
			file.transferTo(saveFile);
			fileVo.setFilename(fileName);
			fileVo.setFilepath("/files/" + fileName);
			fileVo.setContent_id(writeVo.get_id());
			writeService.writeFile(fileVo);
		}

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
			vo.setContent(vo.getContent().replace("\n", "<br>" ));
			JSONObject data = new JSONObject();
			data.put("_id", vo.get_id());
			data.put("title", vo.getTitle());
			data.put("username", vo.getUsername());
			data.put("content", vo.getContent());
			data.put("category", vo.getCategory());
			data.put("time", vo.getTime());
			data.put("readcount", vo.getReadcount());
			FileVo fileVo = writeService.getFile(_id);
			if(fileVo != null) {
				data.put("filename", fileVo.getFilename());
				data.put("filepath", fileVo.getFilepath());
			}
			getView.add(data);
		}
		return getView;
	}

	@PostMapping("/update")
	public String update(HttpServletRequest request, MultipartFile file) throws IOException {
		WriteVo writeVo = new WriteVo();
		writeVo.set_id(Integer.parseInt(request.getParameter("_id")));
		writeVo.setCategory(Integer.parseInt(request.getParameter("category")));
		writeVo.setContent(request.getParameter("content"));
		writeVo.setTitle(request.getParameter("title"));
		System.out.println("control" + writeVo.toString());
		writeService.updateBoard(writeVo);

		//컨텐츠 테이블에 셀렉 => _id가져옴
		writeService.get_id(writeVo);
		System.out.println("content_id controller:" + writeVo.get_id());
		System.out.println(file.getName());
		//파일디비에 인설트 할때 컨텐츠 아이디에 위에서 셀렉한놈 집어넣음
		if (file.isEmpty()) {

		} else {
			FileVo fileVo = new FileVo();
			System.out.println(file);
			String projectPath = /*System.getProperty("user.dir") +*/  "C:\\Users\\GGG\\Desktop\\aaa\\green-spring2\\src\\main\\webapp\\WEB-INF\\resources\\files\\";
			UUID uuid = UUID.randomUUID();
			String fileName = uuid + "_" + file.getOriginalFilename();
			File saveFile = new File(projectPath, fileName);
			file.transferTo(saveFile);
			fileVo.setFilename(fileName);
			fileVo.setFilepath("/files/" + fileName);
			fileVo.setContent_id(writeVo.get_id());
			writeService.writeFile(fileVo);
		}

		return "redirect:/list?category=" + writeVo.getCategory();
	}

	@GetMapping("/delete")
	public String delete(@RequestParam String _id, @RequestParam String category) {
		writeService.delete(_id);
		System.out.println(category);
		return "redirect:/list?category=" + category ;
	}



}
