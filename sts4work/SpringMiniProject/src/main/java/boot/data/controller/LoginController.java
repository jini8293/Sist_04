package boot.data.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import boot.data.dto.MemberDto;
import boot.data.service.MemberService;

@Controller
public class LoginController {

	@Autowired
	MemberService service;

	@GetMapping("/login/main")
	public String form(HttpSession session, Model model) {

		String myid = (String) session.getAttribute("myid");

		String loginok = (String) session.getAttribute("loginok");

		// 한번도 실행안하면 null
		if (loginok == null) {
			return "/login/loginform";
		} else {
			String name = service.getName(myid);
			model.addAttribute("name", name);
			return "/login/logoutform";
		}

	}

	// (required = false) -> null값 체크

	@PostMapping("/login/loginprocess")
	public String loginprocess(@RequestParam String id, @RequestParam String pass,
			@RequestParam(required = false) String cbsave, HttpSession session, Model model) {
		int check = service.loginCheck(id, pass);

		if (check == 1) {
			session.setMaxInactiveInterval(60 * 60 * 8); // 8시간동안 로그인 유지
			session.setAttribute("myid", id);
			session.setAttribute("loginok", "yes");
			session.setAttribute("saveok", cbsave);

			MemberDto mdto = service.getData(id);
			session.setAttribute("loginphoto", mdto.getPhoto());

			return "redirect:main";
		} else {
			return "/login/passfail";
		}

	}

	@GetMapping("/login/logoutprocess")
	public String logoutprocess(HttpSession session) {
		session.removeAttribute("loginok");
		return "redirect:main";
	}

}
