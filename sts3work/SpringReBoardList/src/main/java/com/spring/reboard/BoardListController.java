package com.spring.reboard;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.answerdata.AnswerDao;
import com.spring.data.BoardDaoIn;
import com.spring.data.BoardDto;

@Controller
public class BoardListController {
   
   @Autowired
   BoardDaoIn dao;
   @Autowired
   AnswerDao adao;
   
   @GetMapping("/") //루트
   public String start() {
      return "redirect:board/list"; //시작 redirect는 주소 다 씀
   }
   
   @GetMapping("/board/list")
   public ModelAndView list(@RequestParam(value="currentPage",defaultValue = "1") int currentPage) {
      ModelAndView mview=new ModelAndView();
      
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
      
      //리스트에 각글에 대한 갯수 추가
      for(BoardDto d:list) {
    	  d.setAcount(adao.getAnswerList(d.getNum()).size());
    	  
      }
      
      //request에 저장
      mview.addObject("totalcount", totalcount);
      mview.addObject("list", list); //댓글을 포함한 후 전달
      mview.addObject("no", no);
      mview.addObject("startPage", startPage);
      mview.addObject("endPage", endPage);
      mview.addObject("currentPage", currentPage);
      mview.addObject("totalPage", totalPage);
      
      //포워드
      
      mview.addObject("totalcount", totalcount);
      mview.setViewName("board/boardList");
      return mview;
   }
}