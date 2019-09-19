package com.myebook.homepage.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myebook.homepage.board.db.ReplyDTO;
import com.myebook.homepage.board.service.BoardService;

@Controller
@RequestMapping(value = "/")
public class RestBoardController {

	@Inject
	private BoardService boardService;
	
	// 게시글 댓글 리스트 가져오기
	@RequestMapping(value = "/getReqlyList", method = RequestMethod.POST)
	@ResponseBody
	public List<ReplyDTO> getReplyList(Model model, 
			@RequestParam("bid") int bid) throws Exception {
		System.out.println("댓글 오니~~?");
		
		return boardService.getReplyList(bid);
	}
	
	// 게시글 댓글 저장
	@RequestMapping(value = "saveReqly.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> saveReply(@RequestBody ReplyDTO reply) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			System.out.println("댓글 저장!");
			boardService.saveReply(reply);
			
			result.put("status", "OK");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "False");
		}
		return result;
	}
	
	// 게시글 댓글 수정
	@RequestMapping(value = "/editReqly", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> editReqly(@RequestBody ReplyDTO reply) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			boardService.updateReply(reply);
			result.put("status", "OK");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "False");
		}
		return result;
	}
	
	// 게시글 댓글 삭제
	@RequestMapping(value = "/deleteReqly", method = RequestMethod.POST)
	@ResponseBody
	public void deleteReqly(@RequestParam int rid) throws Exception {
			System.out.println("오십니까...");
			boardService.deleteReply(rid);
		
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
