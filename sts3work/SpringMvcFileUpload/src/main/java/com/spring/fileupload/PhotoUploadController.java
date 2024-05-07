package com.spring.fileupload;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/board")
public class PhotoUploadController {

	// 업로드 폼 1으로 가기
	@GetMapping("/upform1")
	public String uform1() {
		return "board/uploadform1";
	}

	@PostMapping("/upload1")
	public ModelAndView read1(@RequestParam String title, @RequestParam MultipartFile photo,
			HttpServletRequest request) {
		ModelAndView model = new ModelAndView();

		// 업로드할 실제경로 구하기
		String path = request.getSession().getServletContext().getRealPath("/WEB-INF/image");
		System.out.println(path);
		String fileName = photo.getOriginalFilename(); // 업로드한 파일명

		// 현재날짜와 시간을 이용해 파일명 저장
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");

		if (!fileName.equals("")) {
			fileName = sdf.format(new Date()) + "_" + "fileName";
			// path에 업로드
			try {
				photo.transferTo(new File(path + "\\" + fileName));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			fileName="no"; //업로드 안했을경우
		}

		model.addObject("fileName", fileName);
		model.addObject("title", title);
		model.addObject("path", path);

		model.setViewName("board/uploadresult1");

		return model;
	}
	
	@GetMapping("/upform2")
	public String uform2() {
		return "board/uploadform2";
	}
	
	@PostMapping("/upload2")
	public ModelAndView read2(@RequestParam String title, @RequestParam ArrayList<MultipartFile> photo,
			HttpServletRequest request) {
		ModelAndView model = new ModelAndView();

		// 업로드할 실제경로 구하기
		String path = request.getSession().getServletContext().getRealPath("/WEB-INF/image");
		// 현재날짜와 시간을 이용해 파일명 저장
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		ArrayList<String> files = new ArrayList<String>();
		
		//파일명 담기
		for(MultipartFile f : photo) {
			String fileName = sdf.format(new Date())+"_"+f.getOriginalFilename();
			files.add(fileName);
			
			//실제업로드
			try {
				f.transferTo(new File(path+"\\"+fileName));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}

		model.addObject("fileName", files);
		model.addObject("title", title);
		model.addObject("path", path);

		model.setViewName("board/uploadresult1");

		return model;
	}

}
