package com.myebook.homepage.member.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public interface MemberDAO {

	@Autowired
	SqlSession sqlsession = null;

	// 아이디 중복 검사
	public int check_id(String user_id) throws Exception;

	// 닉네임 중복 검사
	public int check_nickname(String nickname) throws Exception;

	// 이메일 중복 검사
	public int check_email(String email) throws Exception;

	// 가입
	public int join_member(MemberDTO member) throws Exception;

	// 이메일 인증
	public int approval_member(MemberDTO member) throws Exception;

	// 로그인 검사
	public MemberDTO login(String user_id) throws Exception;

	// 로그인 접속일자 변경
	public int update_log(String user_id) throws Exception;

	// 아이디 찾기
	public String find_id(String email) throws Exception;

	// 비밀번호 변경
	public int update_pw(MemberDTO member) throws Exception;

	// 마이페이지
	public int update_mypage(MemberDTO member) throws Exception;

	// 회원탈퇴
	public int withdrawal(MemberDTO member) throws Exception;

	public List<MemberDTO> getUserList() throws Exception;

	public MemberDTO getUserInfo(String user_id) throws Exception;

}
