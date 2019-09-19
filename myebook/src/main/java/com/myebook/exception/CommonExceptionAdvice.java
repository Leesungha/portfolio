package com.myebook.exception;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

public class CommonExceptionAdvice {

	@ExceptionHandler(Exception.class)
	public ModelAndView errorModelAndView(Exception ex, HttpServletRequest request) {
		// logger.info(ex.toString());
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("error/error_common");
		modelAndView.addObject("exception", ex);

		// 에러시 이전페이지 이동 코딩시작
		HttpSession session = request.getSession();
		String redirectUrl = (String) session.getAttribute("prevPage");
		if (redirectUrl != null) {
			session.removeAttribute("prevPage");
		}

		modelAndView.addObject("prevPage", redirectUrl);
		// 에러시 이전페이지 이동 코딩끝
		return modelAndView;
	}
}
