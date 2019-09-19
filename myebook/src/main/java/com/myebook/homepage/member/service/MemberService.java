package com.myebook.homepage.member.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.myebook.homepage.member.db.MemberDTO;

public interface MemberService {

	public void check_id(String user_id, HttpServletResponse response) throws Exception;

	public void check_nickname(String nickname, HttpServletResponse response) throws Exception;

	public void check_email(String email, HttpServletResponse response) throws Exception;

	public int join_member(MemberDTO member, HttpServletResponse response) throws Exception;

	public void send_mail(MemberDTO member, String div) throws Exception;

	public String create_key() throws Exception;

	void approval_member(MemberDTO member, HttpServletResponse response) throws Exception;

	public MemberDTO login(MemberDTO member, HttpServletResponse response) throws Exception;

	public void logout(HttpSession session, HttpServletResponse response) throws Exception;

	public String find_id(HttpServletResponse response, String email) throws Exception;

	public void find_pw(HttpServletResponse response, MemberDTO member) throws Exception;

	public MemberDTO update_mypage(MemberDTO member) throws Exception;

	public MemberDTO update_pw(MemberDTO member, String old_pw, HttpServletResponse response) throws Exception;

	public boolean withdrawal(MemberDTO member, HttpServletResponse response) throws Exception;

	public List<MemberDTO> getUserList() throws Exception;

	public MemberDTO getUserInfo(String user_id) throws Exception;

}
