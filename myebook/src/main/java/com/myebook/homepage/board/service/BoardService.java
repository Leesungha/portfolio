package com.myebook.homepage.board.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.myebook.homapage.common.Search;
import com.myebook.homepage.board.db.BoardDTO;
import com.myebook.homepage.board.db.ReplyDTO;
import com.myebook.homepage.book.db.BooklikeDTO;

public interface BoardService {

	// 게시글 리스트 가져오기
	public List<BoardDTO> getBoardList(String cate_cd, Search search) throws Exception;

	// 게시글 입력
	public void insertBoard(BoardDTO board, HttpServletResponse response) throws Exception;

	// 게시글 수정
	public void updateBoard(BoardDTO board, HttpServletResponse response) throws Exception;

	// 게시글 삭제
	public int deleteBoard(int bid, HttpServletResponse response) throws Exception;

	// 게시글 조회
	public BoardDTO getBoardContent(int bid) throws Exception;

	// 게시글 조회수 반환
	public int getBoardListCnt(Search search, String cate_cd) throws Exception;

	// 게시글 댓글 리스트 가져오기
	public List<ReplyDTO> getReplyList(int bid) throws Exception;

	// 게시글 댓글 저장
	public int saveReply(ReplyDTO reply) throws Exception;

	// 게시글 댓글 수정
	public int updateReply(ReplyDTO reply) throws Exception;

	// 게시글 댓글 삭제
	public int deleteReply(int rid) throws Exception;

	// 공지게시판 불러오기
	public List<BoardDTO> getNoticeList(Search search) throws Exception;

}
