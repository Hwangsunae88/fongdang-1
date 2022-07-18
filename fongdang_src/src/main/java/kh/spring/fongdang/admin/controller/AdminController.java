package kh.spring.fongdang.admin.controller;

import java.util.Map;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import kh.spring.fongdang.admin.model.service.AdminServiceImpl;
import kh.spring.fongdang.ans.domain.Ans;
import kh.spring.fongdang.ans.model.service.AnsServiceImpl;
import kh.spring.fongdang.ask.domain.Ask;
import kh.spring.fongdang.ask.model.service.AskServiceImpl;
import kh.spring.fongdang.admin.domain.Sales;
import kh.spring.fongdang.admin.model.service.AdminService;
import kh.spring.fongdang.member.domain.Member;
import kh.spring.fongdang.common.Criteria;


@Controller
@RequestMapping("/admin")
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private AdminService service;
	@Autowired
	private AnsServiceImpl AnsService;
	@Autowired
	private AskServiceImpl AskService;
	
	@RequestMapping(value="/memberManagement", method= RequestMethod.GET)
	public ModelAndView pageMemberManagement(ModelAndView mv
			, @RequestParam(value="related_search", required=false) String keyword
			, @RequestParam(value="page", defaultValue="nothing") String currentPageStr
			, HttpSession session) {		
		List<Member> memberList =null; 		
		System.out.println("keyword: " + keyword);
		// 로그인 상태 확인 
//		TODO: 추후에 관리자(admin) 로그인 확인 후 관리자페이지로 넘어오게 하기
//		Member authInfo = (Member)session.getAttribute("loginInfo");
//		if(authInfo == null) {
//			System.out.println("\n현재 로그아웃 상태입니다.");
//			mv.setViewName("redirect:/member/login");
//			return mv;
//		}		
		int currentPage = 1;	
		int memberLimit = 5;
		
		try {
			if(currentPageStr !=null && !currentPageStr.equals("nothing"))
				currentPage = Integer.parseInt(currentPageStr);
		}catch (NumberFormatException e) {
			e.printStackTrace();
		}
		
		final int pageSize = 6;  // 한페이지에 보여줄 행
		final int pageBlock = 3;  // 페이징에 나타날 페이지수
		int startPage=0;
		int endPage=0;
		int startNum=0;
		int endNum=0;
		
		// 총 회원 수
		int totalCnt = 0;
		if(keyword != null) {
			totalCnt = service.countSearchMember(keyword);
		}
		else {
			totalCnt = service.countMember();
		}
		
		System.out.println("\n총 회원 수 :\t" + totalCnt); 
		
		/* Paging 처리 */
		int totalPageCnt = (totalCnt/pageSize) + (totalCnt%pageSize==0 ? 0 : 1);
		if(currentPage%pageBlock == 0) {
			startPage = ((currentPage/pageBlock)-1)*pageBlock + 1;
		} else {
			startPage = (currentPage/pageBlock)*pageBlock + 1;
		}
		endPage = startPage + pageBlock - 1;
		if(endPage>totalPageCnt) {
			endPage = totalPageCnt;
		}
		System.out.println("page:"+ startPage +"~"+endPage);
		
		/* rownum 처리 */
		startNum = (currentPage-1)*pageSize + 1;
		endNum = startNum + pageSize -1;
		if(endNum>totalCnt) {
			endNum = totalCnt;
		}
		System.out.println("rnum:"+ startNum +"~"+endNum);			
		
		if(keyword != null) {
			memberList = service.relatedSearch(currentPage, memberLimit, keyword);	
		} else {
			memberList = service.selectMemberList(currentPage, memberLimit);			
		}
		
		if(memberList == null) {
			System.out.println("selectMemberList() 조회 실패");			
		} else {
			System.out.println("\n[memberList]\n\t" + memberList);
		}
		
		mv.addObject("memberList", memberList);	
		mv.addObject("totalCnt", totalCnt);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		mv.addObject("currentPage", currentPage);
		mv.addObject("totalPageCnt", totalPageCnt);
		mv.addObject("related_search", keyword);
		
		mv.setViewName("admin/memberManagement");
		return mv;
	}
	
	@RequestMapping(value="/memberWithdraw", method=RequestMethod.POST)
	public ModelAndView updateWithdrawMember(ModelAndView mv
			, RedirectAttributes rttr
			, @RequestParam(value="chk_box", required=false) String [] emails) {
		int result = 0;
		
		if(emails == null) {
			System.out.println("회원을 선택해주세요.");
			rttr.addFlashAttribute("msg", "회원을 선택해주세요.");
			mv.setViewName("redirect:/admin/memberManagement");
			return mv;
		}
		
		for(int i=0; i<emails.length; i++) {
			System.out.println("email:\t" + emails[i]);
		}		
		
		result = service.updateWithDrawMember(emails);
		if(result == 0) {
			rttr.addFlashAttribute("msg", "회원탈퇴에 실패하였습니다.");
			mv.setViewName("redirect:/admin/memberManagement");
			return mv;
		}
		
		rttr.addFlashAttribute("msg", "회원의 정보를 변경했습니다.");
		mv.setViewName("redirect:/admin/memberManagement");
		return mv;		
	}
	
@RequestMapping(value = "/ask", method = RequestMethod.GET)
	public ModelAndView selectAsk(ModelAndView mv, HttpSession session, RedirectAttributes rttr) {

		Member member = (Member) session.getAttribute("loginInfo");
		if (member == null) {
			mv.setViewName("redirect:/member/login");
			return mv;
		}

		mv.addObject("ask_Y", AskService.selectAskY());
		mv.addObject("ask_N", AskService.selectAskN());
		mv.setViewName("admin/askManagement");
		return mv;
	}

	@GetMapping("/answer/{ask_no}")
	public ModelAndView selectAsk2(ModelAndView mv, HttpSession session, RedirectAttributes rttr,
			@PathVariable("ask_no") int ask_no) {

		Member member = (Member) session.getAttribute("loginInfo");
		if (member == null) {
			mv.setViewName("redirect:/member/login");
			return mv;
		}
		mv.addObject("ask", AskService.selectAsk2(ask_no));
		mv.setViewName("admin/answer");
		return mv;
	}

	@PostMapping("/answer.do")
	public ModelAndView insertAns(ModelAndView mv, HttpSession session, HttpServletRequest req, Ans ans, 
			@RequestParam(name ="ask_no", defaultValue = "0") int ask_no,
			RedirectAttributes rttr) {

		Member member = (Member) session.getAttribute("loginInfo");

		if (member == null) {
			mv.setViewName("redirect:/member/login");
			return mv;
		}

		mv.addObject("insertAns", AnsService.insertAns(ans));
		mv.addObject("updateAsk", AskService.updateAsk(ask_no));
		mv.setViewName("redirect:/admin/ask");
		return mv;
	}



	@GetMapping("/sales/read")
    public ModelAndView selectOneSales(ModelAndView mv, HttpServletRequest req
    		, @RequestParam(name = "p_no", defaultValue = "0") String pno) {
		if (pno == "0") {
			mv.setViewName("redirect:salesList");
			return mv;
		}
		logger.debug(pno);
		logger.debug(req.getParameter("p_no"));
		// DB
		Sales result = service.selectOneSales(pno);
		mv.addObject("sales", result);
		mv.setViewName("admin/sales"); // 
		return mv;
	}
	
	//@RequestMapping(value = "/sales/list", method = RequestMethod.GET)
	@GetMapping("/sales/list")
	public ModelAndView selectSalesList(ModelAndView mv, @ModelAttribute Criteria criteria,
			HttpServletRequest req, Model model
			) {
		logger.debug("######################################");
		logger.debug(criteria.toString());
		List<Sales> salesList = service.selectSalesList(criteria);
		
		mv.addObject("salesList", salesList);
		mv.setViewName("admin/salesList");  
		criteria.setTotalCount(service.selectSalesListCnt());
		model.addAttribute("pages", criteria);
		return mv;
	}
	
}
