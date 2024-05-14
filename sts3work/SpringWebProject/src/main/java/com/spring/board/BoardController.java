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
	   
	      //����¡�� �ʿ��� ����
	      int totalcount=dao.getTotalCount();
	      int perPage=5; //���������� ������ ���� ����
	      int perBlock=5; //�� ���� ������ ������ ����
	      int start; //db���� ������ ���� ���۹�ȣ(mysql�� ù���� 0��, ����Ŭ�� 1��)
	      int startPage; //�� ���� ������ ����������
	      int endPage; //�� ���� ������ ��������
	      int totalPage; // �� ������
	      int no; //�� �������� ����� ���۹�ȣ
	      
	      //�� �������� ���ϱ�
	      //�� �۰���/���������纸���������� ����(7/5=1)
	      //�������� 1�̶� ������ ������ 1������ �߰�
	      totalPage=totalcount/perPage+(totalcount%perPage==0?0:1);
	         
	      //�� ���� ������ ����������
	      //perBlock=5�� ��� ������������ 1~5�� ���, ������������ 1, ���������� 5
	      //���簡 13�̸�, ����:11 ��: 15
	      startPage=(currentPage-1)/perBlock*perBlock+1;
	      endPage=startPage+perBlock-1;
	      
	      //�� �������� 23�ϰ�� ���������� ���������� 25�� �ƴ϶� 23
	      if(endPage>totalPage){
	         endPage=totalPage;
	      }
	      //�� ���������� ������ ���۹�ȣ
	      //1������:0, 2������:5 3������:10....
	      start=(currentPage-1)*perPage;
	      
	      //�� �������� ����� ���۹�ȣ ���ϱ�
	      //�ѱ۰����� 23, 1������:23 2������:18 3������:13
	      no=totalcount-(currentPage-1)*perPage;
	      
	      //List<BoardDto> list=dao.getAllDatas();
	      List<BoardDto> list=dao.getList(start, perPage);
	      
	      //request�� ����
	      mview.addObject("totalcount", totalcount);
	      mview.addObject("list", list);
	      mview.addObject("no", no);
	      mview.addObject("startPage", startPage);
	      mview.addObject("endPage", endPage);
	      mview.addObject("currentPage", currentPage);
	      mview.addObject("totalPage", totalPage);
	      
	      
	      //������
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

		// �̹����� ���ε�� ����
		String path = session.getServletContext().getRealPath("/WEB-INF/photo");
		System.out.println(path);

		// �̹��� ���ε� ���Ұ�� no��� ����
		String photo = "";

		// ������å�� �ϸ� ,�� ����
		if (upload.get(0).getOriginalFilename().equals("")) {
			photo = "no";
		} else {
			for (MultipartFile f : upload) {
				String fname = f.getOriginalFilename();
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
		//dto�� photo�� �־��ֱ�
		dto.setPhoto(photo);
		
		dao.insertBoard(dto);
		
		//����� �ƴѳ��뺸���
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

		// �̹����� ���ε�� ����
		String path = session.getServletContext().getRealPath("/WEB-INF/photo");
		System.out.println(path);

		// �̹��� ���ε� ���Ұ�� no��� ����
		String photo = "";

		// ������å�� �ϸ� ,�� ����
		if (upload.get(0).getOriginalFilename().equals("")) {
			photo = "no";
		} else {
			for (MultipartFile f : upload) {
				String fname = f.getOriginalFilename();
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
		//dto�� photo�� �־��ֱ�
		dto.setPhoto(photo);
		
		dao.updateBoard(dto);
		
		return "redirect:content?num="+num+"&currentPage="+currentPage;
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam int num,HttpSession session, @RequestParam String currentPage) {
		String photo = dao.getOneData(num).getPhoto();
		
		if(!photo.equals("no")) {
			String []fname=photo.split(",");
			//���� ���ε� ���
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
