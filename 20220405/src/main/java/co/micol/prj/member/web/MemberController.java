package co.micol.prj.member.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.micol.prj.member.service.MemberService;
import co.micol.prj.member.vo.MemberVO;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberDao;
	
	@RequestMapping("/memberSelectList.do")
	public String memberSelectList(Model model) {
		model.addAttribute("members", memberDao.memberSelectList());
		return "member/memberSelectList";
	}
	
	@RequestMapping("/memberJoinForm.do")
	public String memberJoinForm() {
		return "member/memberJoinForm";
	}
	
	@PostMapping("/memberJoin.do")
	public String memberJoin(MemberVO vo) {
		memberDao.memberInsert(vo);
		return "redirect:memberSelectList.do"; //직접 실행 구문을 호출할 때 
	}
	
	@RequestMapping("/memberLoginForm.do")
	public String memberLoginForm() {
		return "member/memberLoginForm";
	}
	
	@PostMapping("/memberLogin.do")
	public String memberLogin(MemberVO vo, Model model, HttpSession session) {
		vo = memberDao.memberSelect(vo);
		if(vo != null) {
			session.setAttribute("id", vo.getId());
			session.setAttribute("author", vo.getAuthor());
			session.setAttribute("name", vo.getName());
			model.addAttribute("message", vo.getName() + "님 환영합니다.");
		} else {
			model.addAttribute("message", "아이디 또는 패스워드가 틀렸습니다.");
		}
		return "member/memberLoginMessage";
	}
	
	@RequestMapping("/memberLogout.do")
	public String memberLogout(HttpSession session, Model model) {
		session.invalidate();
		model.addAttribute("message", "정상적으로 로그아웃 되었습니다.");
		return "member/memberMessage";
	}
	
	@RequestMapping(value="/ajaxIdCheck.do", produces="application/text;charset=UTF-8")
	@ResponseBody //ajax 사용시 호출된 페이지로 결과를 돌려주는 어노테이션
	public String ajaxIdCheck(MemberVO vo, @RequestParam("id") String id) {
		String str = null;
		vo = memberDao.memberSelect(vo);
		if(vo != null) {
			str = "Yes";
		} else {
			str = "No";
		}
		return str;
	}
}
