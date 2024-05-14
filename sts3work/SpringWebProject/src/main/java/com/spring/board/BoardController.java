package com.spring.board;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	BoardDaoIn dao;

	@GetMapping("/list")
	   public ModelAndView list(@RequestParam(value="currentPage",defaultValue = "1") int currentPage) {
	      ModelAndView mview=new ModelAndView();
	   
	      //페이징에 필요한 변수
	      int totalcount=dao.getTotalCount();
	      int perPage=5; //한페이지당 보여질 글의 갯수
	      int perBlock=5; //한 블럭당 보여질 페이지 갯수
	      int start; //db에서 가져올 글의 시작번호(mysql은 첫글이 0번, 오라클은 1번)
	      int startPage; //각 블럭당 보여질 시작페이지
	      int endPage; //각 블럭당 보여질 끝페이지
	      int totalPage; // 총 페이지
	      int no; //각 페이지당 출력할 시작번호
	      
	      //총 페이지수 구하기
	      //총 글갯수/한페이지당보여질갯수로 나눔(7/5=1)
	      //나머지가 1이라도 있으면 무조건 1페이지 추가
	      totalPage=totalcount/perPage+(totalcount%perPage==0?0:1);
	         
	      //각 블럭당 보여질 시작페이지
	      //perBlock=5일 경우 현제페이지가 1~5일 경우, 시작페이지가 1, 끝페이지가 5
	      //현재가 13이면, 시작:11 끝: 15
	      startPage=(currentPage-1)/perBlock*perBlock+1;
	      endPage=startPage+perBlock-1;
	      
	      //총 페이지가 23일경우 마지막블럭은 끝페이지가 25가 아니라 23
	      if(endPage>totalPage){
	         endPage=totalPage;
	      }
	      //각 페이지에서 보여질 시작번호
	      //1페이지:0, 2페이지:5 3페이지:10....
	      start=(currentPage-1)*perPage;
	      
	      //각 페이지당 출력할 시작번호 구하기
	      //총글갯수가 23, 1페이지:23 2페이지:18 3페이지:13
	      no=totalcount-(currentPage-1)*perPage;
	      
	      //List<BoardDto> list=dao.getAllDatas();
	      List<BoardDto> list=dao.getList(start, perPage);
	      
	      //request에 저장
	      mview.addObject("totalcount", totalcount);
	      mview.addObject("list", list);
	      mview.addObject("no", no);
	      mview.addObject("startPage", startPage);
	      mview.addObject("endPage", endPage);
	      mview.addObject("currentPage", currentPage);
	      mview.addObject("totalPage", totalPage);
	      
	      
	      //포워드
	      mview.setViewName("board/boardList");
	      
	      return mview;
	   }

	@GetMapping("/addform")
	public String addform() {
		return "board/writeForm";
	}

	@PostMapping("/insert")
	public String insert(@ModelAttribute("dto") BoardDto dto, @RequestParam ArrayList<MultipartFile> upload,
			HttpSession session, @RequestParam String currentPage) {

		// 이미지가 업로드될 폴더
		String path = session.getServletContext().getRealPath("/WEB-INF/photo");
		System.out.println(path);

		// 이미지 업로드 안할경우 no라고 저장
		String photo = "";

		// 사진선책을 하면 ,로 나열
		if (upload.get(0).getOriginalFilename().equals("")) {
			photo = "no";
		} else {
			for (MultipartFile f : upload) {
				String fname = f.getOriginalFilename();
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
		//dto의 photo에 넣어주기
		dto.setPhoto(photo);
		
		dao.insertBoard(dto);
		
		//목록이 아닌내용보기로
		int num = dao.getMaxNum();
		

		return "redirect:content?num="+num+"&currentPage="+1;
	}
	
	@GetMapping("/content")
	public String content(@RequestParam int num, Model model
			,@RequestParam String currentPage) {
		
		dao.updateReadCount(num);
		
		BoardDto dto = dao.getOneData(num);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("dto",dto);
		
		return "board/content";	
	}
	
	@GetMapping("/updateform")
	public ModelAndView updateform(@RequestParam int num, @RequestParam String currentPage) {
		ModelAndView model = new ModelAndView();
		
		BoardDto dto = dao.getOneData(num);
		model.addObject("dto",dto);
		model.addObject("currentPage",currentPage);
		
		model.setViewName("board/updateForm");
		return model;
	}
	
	@PostMapping("/update")
	public String update(@ModelAttribute("dto") BoardDto dto, @RequestParam ArrayList<MultipartFile> upload,
			HttpSession session, @RequestParam String currentPage, @RequestParam int num) {

		// 이미지가 업로드될 폴더
		String path = session.getServletContext().getRealPath("/WEB-INF/photo");
		System.out.println(path);

		// 이미지 업로드 안할경우 no라고 저장
		String photo = "";

		// 사진선책을 하면 ,로 나열
		if (upload.get(0).getOriginalFilename().equals("")) {
			photo = "no";
		} else {
			for (MultipartFile f : upload) {
				String fname = f.getOriginalFilename();
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
		//dto의 photo에 넣어주기
		dto.setPhoto(photo);
		
		dao.updateBoard(dto);
		
		return "redirect:content?num="+num+"&currentPage="+currentPage;
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam int num,HttpSession session, @RequestParam String currentPage) {
		String photo = dao.getOneData(num).getPhoto();
		
		if(!photo.equals("no")) {
			String []fname=photo.split(",");
			//실제 업로드 경로
			String path = session.getServletContext().getRealPath("/WEB-INF/photo");
			for(String f:fname) {
				File file = new File(path+"\\"+f);
				file.delete();
			}
		}
		
		dao.deleteBoard(num);
		
		return "redirect:list?currentPage="+currentPage;
	}
	
	@GetMapping("/list2")
	public String list2() {
		return "board/ajaxList";
		
	}
	
}
