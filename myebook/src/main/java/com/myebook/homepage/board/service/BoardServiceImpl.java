package com.myebook.homepage.board.service;

import java.io.PrintWriter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import com.myebook.homapage.common.Search;
import com.myebook.homepage.board.db.BoardDAO;
import com.myebook.homepage.board.db.BoardDTO;
import com.myebook.homepage.board.db.ReplyDTO;
import com.myebook.homepage.book.db.BooklikeDTO;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO boardDAO;

	// 게시글 리스트 가져오기
	@Override
	public List<BoardDTO> getBoardList(String cate_cd, Search search) throws Exception {
		return boardDAO.getBoardList(cate_cd, search);
	}

	// 게시글 입력
	@Override
	public void insertBoard(BoardDTO board, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		System.out.println("service" + board);
		System.out.println("서비스에 드루와따~~");		
		boardDAO.insertBoard(board);		
		out.println("<script>");
		out.println("alert('게시물 작성 완료');");		
		out.println("</script>");
	}
	
	//게시글 수정
	@Override
	public void updateBoard(BoardDTO board, HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		System.out.println("service" + board);
		System.out.println("업데이뚜에 드루와따~~");
		boardDAO.updateBoard(board);
		out.println("<script>");
		out.println("alert('게시물 수정 완료');");
		out.println("</script>");
	}
	
	// 게시글 삭제
	@Override
	public int deleteBoard(int bid, HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		boardDAO.deleteBoard(bid);
		out.println("<script>");
		out.println("alert('게시물 삭제 완료');");
		out.println("</script>");
		return bid;
	}
	
	// 게시글 조회
	@Override
	public BoardDTO getBoardContent(int bid) throws Exception {
		boardDAO.updateViewCnt(bid);
		return boardDAO.getBoardContent(bid);

	}

	// 총 게시글 개수 확인
	@Override
	public int getBoardListCnt(Search search, String cate_cd) throws Exception {
		return boardDAO.getBoardListCnt(search, cate_cd);

	}

	// 댓글 리스트
	@Override
	public List<ReplyDTO> getReplyList(int bid) throws Exception {
		return boardDAO.getReplyList(bid);

	}

	// 게시글 댓글 저장
	@Override
	public int saveReply(ReplyDTO reply) throws Exception {
		return boardDAO.saveReply(reply);

	}

	// 게시글 댓글 수정
	@Override
	public int updateReply(ReplyDTO reply) throws Exception {
		return boardDAO.updateReply(reply);

	}

	// 게시글 댓글 삭제
	@Override
	public int deleteReply(int rid) throws Exception {
		return boardDAO.deleteReply(rid);

	}
	
	// 게시글 리스트 가져오기
	@Override
	public List<BoardDTO> getNoticeList(Search search) throws Exception {
		return boardDAO.getNoticeList(search);
	}

	

}