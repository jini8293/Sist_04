package com.spring.reboard;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.data.BoardDaoIn;
import com.spring.data.BoardDto;

@Controller
public class BoardWriteController {

	@Autowired
	BoardDaoIn dao;

	// 새글 답글 모두 해당
	@GetMapping("/board/writeform")
	public ModelAndView form(@RequestParam Map<String, String> map) {
		ModelAndView model = new ModelAndView();

		// 아래 5개의 값은 답글일경우에만 넘어옴(새글은 안넘어옴)
		String currentPage = map.get("currentPage");
		String num = map.get("num");
		String regroup = map.get("regroup");
		String restep = map.get("restep");
		String relevel = map.get("relevel");

		System.out.println(currentPage + "," + num);

		// 입력폼에 hidden으로 넣어줘야함.. 답글일때를 대비
		model.addObject("currentPage", currentPage == null ? "1" : currentPage);
		model.addObject("num", num == null ? "0" : num);
		model.addObject("regroup", regroup == null ? "0" : regroup);
		model.addObject("restep", restep == null ? "0" : restep);
		model.addObject("relevel", relevel == null ? "0" : relevel);

		// 0으로 넣어야 dao에서 새글로 인식

		model.setViewName("board/writeForm");

		return model;
	}

	@PostMapping("/board/insert")
	public String insert(@ModelAttribute("dto") BoardDto dto, @RequestParam ArrayList<MultipartFile> upload,
			HttpSession session) {

		// 이미지가 업로드될 폴더
		String path = session.getServletContext().getRealPath("/WEB-INF/photo");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		System.out.println(path);

		// 이미지 업로드 안할경우 no라고 저장
		String photo = "";

		// 사진선책을 하면 ,로 나열
		if (upload.get(0).getOriginalFilename().equals("")) {
			photo = "no";
		} else {
			for (MultipartFile f : upload) {
				String fname = sdf.format(new Date()) + f.getOriginalFilename();
				photo += fname + ",";

				// 업로드
				try {
					f.transferTo(new File(path + "\\" + fname));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			// photo에서 마지막 ,제거
			photo = photo.substring(0, photo.length() - 1);
		}
		// dto의 photo에 넣어주기
		dto.setPhoto(photo);

		dao.insertBoard(dto);

		// 목록이 아닌내용보기로
		int num = dao.getMaxNum();
		
		return "redirect:content?num="+num+"&currentPage="+1;
	}
}
