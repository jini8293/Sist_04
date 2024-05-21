package mycar.controller;

import java.util.List;

import org.springframework.dao.support.DaoSupport;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import mycar.data.MyCarCommentDto;
import mycar.data.MyCarDto;
import mycar.repository.MyCarCommentDao;

@RestController
@RequiredArgsConstructor //final or @NotNull멤버변수만 자동주입
public class MyCarCommentController {
	
	private final MyCarCommentDao commentDao;
	
	@GetMapping("/addcomment")
	public void addComment(@RequestParam Long num, @RequestParam String comment) {
		
		//먼저 MyCarDto에 num값을 넣은후 MyCarCommentDto에 넣어준다 (외부키로 지정된 값)
		MyCarDto dto = MyCarDto.builder().num(num).build();
		
		//dto에 값 지정
		MyCarCommentDto cdto = MyCarCommentDto.builder()
				.comment(comment).mycar(dto).build();
		
		//db insert
		commentDao.insertCommentMyCar(cdto);
		
	}
	
	//부모글에 달린 댓글 반환
	@GetMapping("/commentlist")
	public List<MyCarCommentDto> commentlist(@RequestParam Long num) {
		
		return commentDao.getMyCarCommentList(num);
	}
	
	
	

}
