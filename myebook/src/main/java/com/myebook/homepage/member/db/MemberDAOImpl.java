package com.myebook.homepage.member.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	SqlSession sqlsession = null;

	// 아이디 중복 검사
	public int check_id(String user_id) throws Exception {
		return sqlsession.selectOne("member.check_id", user_id);
	}

	// 닉네임 중복 검사
	public int check_nickname(String nickname) throws Exception {
		return sqlsession.selectOne("member.check_nickname", nickname);
	}

	// 이메일 중복 검사
	public int check_email(String email) throws Exception {
		return sqlsession.selectOne("member.check_email", email);
	}

	@Transactional
	public int join_member(MemberDTO member) throws Exception {
		return sqlsession.insert("member.join_member", member);
	}

	// 이메일 인증
	@Transactional
	public int approval_member(MemberDTO member) throws Exception {
		return sqlsession.update("member.approval_member", member);
	}

	// 로그인 검사
	public MemberDTO login(String user_id) throws Exception {
		return sqlsession.selectOne("member.login", user_id);
	}

	// 로그인 접속일자 변경
	@Transactional
	public int update_log(String user_id) throws Exception {
		return sqlsession.update("member.update_log", user_id);
	}

	// 아이디 찾기
	public String find_id(String email) throws Exception {
		return sqlsession.selectOne("member.find_id", email);
	}

	// 비밀번호 변경
	@Transactional
	public int update_pw(MemberDTO member) throws Exception {
		return sqlsession.update("member.update_pw", member);
	}

	// 마이페이지
	@Transactional
	public int update_mypage(MemberDTO member) throws Exception {
		return sqlsession.update("member.update_mypage", member);
	}

	// 회원탈퇴
	@Transactional
	public int withdrawal(MemberDTO member) throws Exception {
		return sqlsession.delete("member.withdrawal", member);
	}

	@Override
	public List<MemberDTO> getUserList() throws Exception {
		return sqlsession.selectList("member.getUserList");
	}

	@Override
	public MemberDTO getUserInfo(String user_id) throws Exception {
		return sqlsession.selectOne("member.getUserInfo", user_id);
	}

}
