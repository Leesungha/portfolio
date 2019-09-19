package com.myebook.homepage.board.db;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.myebook.homapage.common.Search;

@Repository
public interface BoardDAO {
	
	// 게시글 리스트 가져오기
	public List<BoardDTO> getBoardList(String cate_cd, Search search) throws Exception;	
	
	// 게시글 조회
	public BoardDTO getBoardContent(int bid) throws Exception;
	
	// 게시글 입력
	public void insertBoard(BoardDTO board) throws Exception;
	
	// 게시글 수정
	public int updateBoard(BoardDTO board) throws Exception;
	
	// 게시글 삭제
	public int deleteBoard(int bid) throws Exception;
	
	// 게시글 조회수 반환
	public int updateViewCnt(int bid) throws Exception;
	
	// 게시글 리스트 수 반환
	public int getBoardListCnt(Search search, String cate_cd) throws Exception;
	
	// 게시글 댓글 가져오기
	public List<ReplyDTO> getReplyList(int bid) throws Exception;
	
	// 게시글 댓글 입력
	public int saveReply(ReplyDTO reply) throws Exception;
	
	// 게시글 댓글 수정
	public int updateReply(ReplyDTO reply) throws Exception;
	
	// 게시글 댓글 삭제
	public int deleteReply(int rid) throws Exception;
	
	// 게시글 리스트 가져오기
	public List<BoardDTO> getNoticeList(Search search) throws Exception;	
		

}