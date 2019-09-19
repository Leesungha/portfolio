package com.myebook.homepage;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myebook.homepage.book.db.BookCateDTO;
import com.myebook.homepage.member.db.MemberDTO;
import com.myebook.homepage.member.service.MemberServiceImpl;

@Controller
@RequestMapping("/")
public class MemberController {

	@Inject
	private MemberServiceImpl service;

	// 카테고리별 상품 리스트
	// @RequestMapping(value = "home.do", method = RequestMethod.GET)
	// public String getList(@RequestParam("cn") int cate_name, @RequestParam("l")
	// int level, Model model)
	// throws Exception {
	// List<BookCateDTO> list = null;
	// list = service.list(level, cate_name);
	// model.addAttribute("list", list);
	// return "include/shop/list";
	// }

	// @RequestMapping(value = "/testLogin")
	// public String isComplete(HttpSession session) {
	// return "member/naverlogin";
	//
	// }

	// 네이버 로그인 callback
	@RequestMapping(value = "/callback")
	public String navLogin(HttpServletRequest request) throws Exception {
		return "member/callback";

	}

	// 네이버 로그인 정보 받아오기
	@RequestMapping(value = "/personalInfo")
	public String personalInfo(HttpServletRequest request) throws Exception {
		String token = "";// 네이버 로그인 접근 토큰; 여기에 복사한 토큰값을 넣어줍니다.
		String header = "Bearer " + token; // Bearer 다음에 공백 추가
		try {
			String apiURL = "https://openapi.naver.com/v1/nid/me";
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("Authorization", header);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
			System.out.println(response.toString());
		} catch (Exception e) {
			System.out.println(e);
		}

		return "index";
	}

	// 메인 페이지 이동
	@RequestMapping(value = "move_index.do")
	public String move_index() throws Exception {
		return "index";
	}

	// 회원 가입
	@RequestMapping(value = "join_member.do", method = RequestMethod.POST)
	public String join_member(@ModelAttribute MemberDTO member, RedirectAttributes rttr, HttpServletResponse response)
			throws Exception {
		rttr.addFlashAttribute("result", service.join_member(member, response));
		return "member/send_message";
	}

	// 회원 가입 폼 이동
	@RequestMapping(value = "memberJoinForm.do")
	public String memberJoinForm() throws Exception {
		return "member/memberJoinForm";
	}

	// 아이디 중복 검사(AJAX)
	@RequestMapping(value = "check_id.do", method = RequestMethod.POST)
	public void check_id(@RequestParam("user_id") String user_id, HttpServletResponse response) throws Exception {
		service.check_id(user_id, response);
	}

	// 아이디 중복 검사(AJAX)
	@RequestMapping(value = "check_nickname.do", method = RequestMethod.POST)
	public void check_nickname(@RequestParam("nickname") String nickname, HttpServletResponse response)
			throws Exception {
		service.check_nickname(nickname, response);
	}

	// 이메일 중복 검사(AJAX)
	@RequestMapping(value = "check_email.do", method = RequestMethod.POST)
	public void check_email(@RequestParam("email") String email, HttpServletResponse response) throws Exception {
		service.check_email(email, response);
	}

	// 회원 인증
	@RequestMapping(value = "approval_member.do", method = RequestMethod.POST)
	public void approval_member(@ModelAttribute MemberDTO member, HttpServletResponse response) throws Exception {
		System.out.println("인증하러 오냐~~");
		service.approval_member(member, response);
	}

	// 로그인 폼 이동
	@RequestMapping(value = "login_form.do", method = RequestMethod.GET)
	public String login_form() throws Exception {
		System.out.println("로그인으로 오긴 오니");
		return "member/loginForm";
	}

	// 로그인
	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String login(@ModelAttribute MemberDTO member, HttpSession session, HttpServletResponse response)
			throws Exception {
		System.out.println(member.getUser_id());
		member = service.login(member, response);
		session.setAttribute("member", member);
		return "index";
	}

	// 로그아웃
	@RequestMapping(value = "logout.do", method = RequestMethod.GET)
	public void logout(HttpSession session, HttpServletResponse response) throws Exception {
		System.out.println("로그아웃~~~~");
		session.invalidate();
		// session.removeAttribute("member");
		service.logout(session, response);
	}

	// 아이디 찾기 폼
	@RequestMapping(value = "find_id_form.do")
	public String find_id_form() throws Exception {
		return "member/find_id_form";
	}

	// 아이디 찾기
	@RequestMapping(value = "find_id.do", method = RequestMethod.POST)
	public String find_id(HttpServletResponse response, @RequestParam("email") String email, Model md)
			throws Exception {
		md.addAttribute("user_id", service.find_id(response, email));
		return "member/find_id";
	}

	// 비밀번호 찾기 폼
	@RequestMapping(value = "find_pw_form.do")
	public String find_pw_form() throws Exception {
		return "member/find_pw_form";
	}

	// 비밀번호 찾기
	@RequestMapping(value = "find_pw.do", method = RequestMethod.POST)
	public void find_pw(@ModelAttribute MemberDTO member, HttpServletResponse response) throws Exception {
		service.find_pw(response, member);
	}

	// 마이페이지 이동
	@RequestMapping(value = "mypage.do")
	public String mypage() throws Exception {
		System.out.println("마이 페이지 이동~~~");
		return "member/myInfo";
	}

	// mypage 수정
	@RequestMapping(value = "update_mypage.do", method = RequestMethod.POST)
	public String update_mypage(@ModelAttribute MemberDTO member, HttpSession session, RedirectAttributes rttr)
			throws Exception {
		session.setAttribute("member", service.update_mypage(member));
		rttr.addFlashAttribute("msg", "회원정보 수정 완료");
		return "member/myInfo";
	}

	// 비밀번호 변경
	@RequestMapping(value = "update_pw.do", method = RequestMethod.POST)
	public String update_pw(@ModelAttribute MemberDTO member, @RequestParam("old_pw") String old_pw,
			HttpSession session, HttpServletResponse response, RedirectAttributes rttr) throws Exception {
		session.setAttribute("member", service.update_pw(member, old_pw, response));
		rttr.addFlashAttribute("msg", "비밀번호 수정 완료");
		return "member/myInfo";
	}

	// 회원탈퇴
	@RequestMapping(value = "withdrawal.do", method = RequestMethod.POST)
	public String withdrawal_form(@ModelAttribute MemberDTO member, HttpSession session, HttpServletResponse response)
			throws Exception {
		System.out.println("탈퇴~~??");
		if (service.withdrawal(member, response)) {
			session.invalidate();
			System.out.println("탈퇴~~~~");
		}
		return "index";
	}

	// 회원 리스트 가져오기
	@RequestMapping(value = "getUserList.do", method = RequestMethod.GET)
	public String getUserList(Model model) throws Exception {
		model.addAttribute("userList", service.getUserList());
		return "writer/userList";
	}

	// 마이북 페이지 이동
	@RequestMapping(value = "move_myebook.do")
	public String move_myebook() throws Exception {
		return "include/shop_manage";
	}

}
