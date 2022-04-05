package co.micol.prj.notice.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.micol.prj.notice.service.NoticeService;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeDao;
	
	//요청들을 처리하는 메소드 작성
	
	@RequestMapping("/noticeList.do")
	public String noticeSelectList(Model model) {
		//리스트 가져오는 것 처리
		model.addAttribute("notices", noticeDao.noticeSelectList());
		return "notice/noticeList";
	}
}
