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

	// ���� ��� ��� �ش�
	@GetMapping("/board/writeform")
	public ModelAndView form(@RequestParam Map<String, String> map) {
		ModelAndView model = new ModelAndView();

		// �Ʒ� 5���� ���� ����ϰ�쿡�� �Ѿ��(������ �ȳѾ��)
		String currentPage = map.get("currentPage");
		String num = map.get("num");
		String regroup = map.get("regroup");
		String restep = map.get("restep");
		String relevel = map.get("relevel");

		System.out.println(currentPage + "," + num);

		// �Է����� hidden���� �־������.. ����϶��� ���
		model.addObject("currentPage", currentPage == null ? "1" : currentPage);
		model.addObject("num", num == null ? "0" : num);
		model.addObject("regroup", regroup == null ? "0" : regroup);
		model.addObject("restep", restep == null ? "0" : restep);
		model.addObject("relevel", relevel == null ? "0" : relevel);

		// 0���� �־�� dao���� ���۷� �ν�

		model.setViewName("board/writeForm");

		return model;
	}

	@PostMapping("/board/insert")
	public String insert(@ModelAttribute("dto") BoardDto dto, @RequestParam ArrayList<MultipartFile> upload,
			HttpSession session) {

		// �̹����� ���ε�� ����
		String path = session.getServletContext().getRealPath("/WEB-INF/photo");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		System.out.println(path);

		// �̹��� ���ε� ���Ұ�� no��� ����
		String photo = "";

		// ������å�� �ϸ� ,�� ����
		if (upload.get(0).getOriginalFilename().equals("")) {
			photo = "no";
		} else {
			for (MultipartFile f : upload) {
				String fname = sdf.format(new Date()) + f.getOriginalFilename();
				photo += fname + ",";

				// ���ε�
				try {
					f.transferTo(new File(path + "\\" + fname));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			// photo���� ������ ,����
			photo = photo.substring(0, photo.length() - 1);
		}
		// dto�� photo�� �־��ֱ�
		dto.setPhoto(photo);

		dao.insertBoard(dto);

		// ����� �ƴѳ��뺸���
		int num = dao.getMaxNum();
		
		return "redirect:content?num="+num+"&currentPage="+1;
	}
}
