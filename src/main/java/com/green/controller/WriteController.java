package com.green.controller;

import com.green.service.CommentService;
import com.green.service.WriteService;
import com.green.vo.PageVo;
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
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;


@Controller
public class WriteController {
	PageVo page = new PageVo();
	@Autowired
	private WriteService writeService;
	@Autowired
	CommentService commentService;

	@PostMapping("/writeAction")
	public String writeAction() {

		return "/writeAction";
	}

	@GetMapping("/list")
	public String list(Model model, @RequestParam String category, @RequestParam int num) {
		page.setNum(num);
		page.setCount(writeService.listCount(category));

		model.addAttribute("page", page);
		model.addAttribute("category", category);
		model.addAttribute("select", num);
		model.addAttribute("num", num);

		return "/list";
	}

	@GetMapping("/getlist")
	@ResponseBody
	public List<JSONObject> getList(@RequestParam String category, @RequestParam int num) {
		int postnum = page.getPostnum();
		int displayPost = page.getDisplaypost();



		System.out.println("postnum : " + postnum + "displayPost : " + displayPost + "num : " + num);


		List<WriteVo> writeVo = writeService.getList(category, displayPost, postnum);
		System.out.println(writeVo);
		List<JSONObject> getList = new ArrayList<>();
		for (WriteVo vo : writeVo) {
			System.out.println("vo : " + vo);
			JSONObject data = new JSONObject();
			data.put("_id", vo.get_id());
			data.put("title", vo.getTitle());
			data.put("username", vo.getUsername());
			data.put("category", vo.getCategory());
			data.put("time", vo.getTime());
			data.put("readcount", vo.getReadcount());
			data.put("bnum", vo.getBnum());
			data.put("lvl", vo.getLvl());
			data.put("step", vo.getStep());
			getList.add(data);
		}
		return getList;
	}

	@GetMapping("/viewform")
	public String viewForm(Model model, @RequestParam String _id, @RequestParam String category) throws Exception {
		model.addAttribute("_id", _id);
		model.addAttribute("category", category);

		return "/view";
	}

	@GetMapping("/getview")
	@ResponseBody
	public List<JSONObject> getView(@RequestParam String _id) {
		List<JSONObject> getView = new ArrayList<>();
		for (WriteVo vo : writeService.getViewVo(_id)) {
			vo.setContent(vo.getContent().replace("\n", "<br>"));
			JSONObject data = new JSONObject();
			data.put("_id", vo.get_id());
			data.put("title", vo.getTitle());
			data.put("username", vo.getUsername());
			data.put("content", vo.getContent());
			data.put("category", vo.getCategory());
			data.put("time", vo.getTime());
			data.put("readcount", vo.getReadcount());
			data.put("bnum", vo.getBnum());
			data.put("lvl", vo.getLvl());
			data.put("step", vo.getStep());
			FileVo fileVo = writeService.getFile(_id);
			if (fileVo != null) {
				data.put("filename", fileVo.getFilename());
				data.put("filepath", fileVo.getFilepath());
			}
			getView.add(data);
		}

		return getView;
	}

	@GetMapping("/writeform")
	public String getWriteForm(Model model, @RequestParam String username, @RequestParam String bnum,
							   @RequestParam int lvl, @RequestParam String step, @RequestParam String _id) {
		model.addAttribute("username", username);
		model.addAttribute("bnum", bnum);
		model.addAttribute("lvl", lvl);
		model.addAttribute("step", step);
		model.addAttribute("_id", _id);

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
		writeVo.setBnum(Integer.parseInt(request.getParameter("bnum")));
		writeVo.setLvl(Integer.parseInt(request.getParameter("lvl")));
		writeVo.setStep(Integer.parseInt(request.getParameter("step")));
		writeService.Write(writeVo);

		//컨텐츠 테이블에 셀렉 => _id가져옴
		writeService.get_id(writeVo);

		//파일디비에 인설트 할때 컨텐츠 아이디에 위에서 셀렉한놈 집어넣음
		if (file.isEmpty()) {

		} else {
			FileVo fileVo = new FileVo();

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

		return "redirect:/list?num=1&category=" + writeVo.getCategory();
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
		for (WriteVo vo : writeService.getViewVo(_id)) {
			JSONObject data = new JSONObject();
			data.put("_id", vo.get_id());
			data.put("title", vo.getTitle());
			data.put("username", vo.getUsername());
			data.put("content", vo.getContent());
			data.put("category", vo.getCategory());
			data.put("time", vo.getTime());
			data.put("readcount", vo.getReadcount());
			data.put("bnum", vo.getBnum());
			data.put("lvl", vo.getLvl());
			data.put("step", vo.getStep());
			FileVo fileVo = writeService.getFile(_id);
			if (fileVo != null) {
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
		writeService.updateBoard(writeVo);

		//컨텐츠 테이블에 셀렉 => _id가져옴
		writeService.get_id(writeVo);

		//파일디비에 인설트 할때 컨텐츠 아이디에 위에서 셀렉한놈 집어넣음
		if (file.isEmpty()) {

		} else {
			FileVo fileVo = new FileVo();
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

		return "redirect:/list?num=1&category=" + writeVo.getCategory();
	}

	@GetMapping("/delete")
	public String delete(@RequestParam String _id, @RequestParam String category) {
		writeService.delete(_id);
		return "redirect:/list?num=1&category=" + category;
	}


}