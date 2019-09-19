package com.myebook.homepage.board.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myebook.homapage.common.Pagination;
import com.myebook.homapage.common.Search;
import com.myebook.homepage.board.db.BoardDTO;
import com.myebook.homepage.board.db.ReplyDTO;
import com.myebook.homepage.board.service.BoardService;
import com.myebook.homepage.member.db.MemberDTO;

@Controller

@RequestMapping(value = "/")
public class BoardController {
	
	@Inject
	private BoardService boardService;

	// 게시글 리스트 가져오기
	@RequestMapping(value = "/getBoardList.do", method = RequestMethod.GET)
	public String getBoardList(Model model
		, @RequestParam(required = false, defaultValue = "1") int page
		, @RequestParam(required = false, defaultValue = "1") int range
		, @RequestParam(required = false, defaultValue = "title") String searchType
		, @RequestParam(required = false) String keyword 
		, @RequestParam("cate_cd") String cate_cd
		, HttpSession session) throws Exception {
		
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		boolean admin_status = member.getAdmin_status();
		model.addAttribute("admin_status",admin_status);
		
		System.out.println(cate_cd);
		
		Search search = new Search();
		search.setSearchType(searchType);
		search.setKeyword(keyword);

		// 전체 게시글 개수
		int listCnt = boardService.getBoardListCnt(search, cate_cd);	
		search.pageInfo(page, range, listCnt);

		// Pagination 객체생성

		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);		

		model.addAttribute("pagination", search);
		System.out.println(cate_cd+"실종되신게 이쯤이십니까?");
		model.addAttribute("boardList", boardService.getBoardList(cate_cd, search));
		model.addAttribute("cate_cd",cate_cd);
		model.addAttribute("listCnt",listCnt);
		
		
		return "board/index";

	}
	
	// 게시글 입력 폼 이동
	@RequestMapping(value = "/boardForm.do", method = RequestMethod.GET)
	public String boardForm(Model model, @RequestParam("cate_cd") String cate_cd,
			HttpSession session) {
		
		System.out.println("입력창에서 cate_cd"+cate_cd);
		model.addAttribute("cate_cd",cate_cd);
		
		return "board/insertForm";

	}
	
	// 게시글 입력
	@RequestMapping(value = "/insertBoard.do", method = RequestMethod.POST)
	public void saveBoard(@ModelAttribute("BoardDTO") BoardDTO board 
	, RedirectAttributes rttr,HttpServletResponse response, Model model) throws Exception {
		    System.out.println("컨트롤러에 드루왔다~");
			boardService.insertBoard(board, response);	
			
			
	}
	
	// 게시글 업데이트
	@RequestMapping(value = "/updateBoard.do", method = RequestMethod.POST)
	public void saveBoard(@ModelAttribute("board") BoardDTO board
			, HttpServletResponse response) {
		System.out.println("update들어오십니까..");
			try {
				boardService.updateBoard(board, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}			
		
	}
	
	// 게시글 삭제
	@RequestMapping(value = "/deleteBoard", method = RequestMethod.GET)
	public String deleteBoard(RedirectAttributes rttr, 
			HttpServletResponse response, @RequestParam("bid") int bid,
			@RequestParam("cate_cd") String cate_cd,
			HttpSession session) throws Exception {
		String cate_cd1 = cate_cd;
		System.out.println(bid+" : bid값");
		boardService.deleteBoard(bid, response);
		
		return "/getBoardList.do"+"?cate_cd"+cate_cd1;
	}

	// 게시글 조회
	@RequestMapping(value = "/getBoardContent.do", method = RequestMethod.GET)
		public String getBoardContent(Model model, @RequestParam("bid") int bid,
				@RequestParam("cate_cd") String cate_cd,
				HttpSession session) throws Exception {
		
			MemberDTO member = (MemberDTO)session.getAttribute("member");
			boolean admin_status = member.getAdmin_status();
			model.addAttribute("admin_status",admin_status);
			
			model.addAttribute("boardContent", boardService.getBoardContent(bid));
			model.addAttribute("reply", new ReplyDTO());
			model.addAttribute("cate_cd",cate_cd);
			
			return "board/boardContent";
	}
	
	//게시글 수정
	@RequestMapping(value = "/editForm.do", method = RequestMethod.GET)
		public String editForm(@RequestParam("bid") int bid, 
					@RequestParam("cate_cd") String cate_cd, 
					@RequestParam("mode") String mode, Model model, HttpSession session) throws Exception {
		
		model.addAttribute("cate_cd",cate_cd);
		model.addAttribute("boardContent", boardService.getBoardContent(bid));
		model.addAttribute("mode", mode);
		model.addAttribute("board", new BoardDTO());
		return "board/updateForm";

	}
	
	@InitBinder
	 public void allowEmptyDateBinding(WebDataBinder binder, HttpServletRequest request) {
	  // 빈문자열(empty string) 대신 NULL로 전송값을 대체 합니다..
	  binder.registerCustomEditor(String.class, new StringTrimmerEditor(true));
	  //이전 페이지 기억
	  String referrer = request.getHeader("Referer");
	     request.getSession().setAttribute("prevPage", referrer);
	}
	
}

	


