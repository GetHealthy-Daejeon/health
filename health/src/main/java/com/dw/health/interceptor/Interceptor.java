package com.dw.health.interceptor;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component
public class Interceptor implements HandlerInterceptor{
// logsService 만들면 연결 필요
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) // preHandle : 컨트롤러 도착 전 가로채는 함수
			throws Exception {
		String url = request.getRequestURI();
		String ip = request.getHeader("X-forwarded-For");
		String httpMethod = request.getMethod();
		
		if(ip == null) ip = request.getRemoteAddr();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.KOREA); // 한국 시간 포맷
		String time = formatter.format(Calendar.getInstance().getTime());
		System.out.println(ip+url+httpMethod+time);
		
		// 세션 체크
		HttpSession session = request.getSession();
		String excludeUrl = request.getRequestURI().toString();
		if(excludeUrl.contains("/health/index")) {
			return true; // index 주소는 기본으로 접근 가능
		}
		
		// 세션에 이름이 없는 경우
		if(session.getAttribute("memberName") == null) {
			if(excludeUrl.contains("/health/login") || excludeUrl.contains("/health/join") || excludeUrl.contains("/health/logout")) {
				return true; // login, join 주소 접근 가능
			}
			response.sendRedirect("/health/login");
			return false; // 예외페이지를 제외한 다른 페이지에 접속시 로그인 페이지로 이동
		}
		
		// 세션에 이름이 있는 경우
		if(session.getAttribute("memberName") != null) {
			if(excludeUrl.contains("/health/login") || excludeUrl.contains("/health/join")) {
				response.sendRedirect("/health/index");
				return false; // 주소가 login, join 이라면 접근 불가능
			}
			if((int)session.getAttribute("authority") == 3) { // 권한이 3인 경우
				if(excludeUrl.contains("/health/logout")) {
					response.sendRedirect("/health/index");
					return true; // 로그아웃 페이지에 접속 후 초기페이지로 이동
				}
				response.sendRedirect("/health/index"); // 그 외엔 초기페이지로 이동
				return false;
			}
			if((int)session.getAttribute("authority") == 1) { // 권한이 1인 경우
				if(excludeUrl.contains("/admin/member") 
						|| excludeUrl.contains("/admin/member/search")
						|| excludeUrl.contains("/admin/addr")
						|| excludeUrl.contains("/admin/addr/search")) {
					response.sendRedirect("/health/index");
					return false; // 관리페이지 접근 불가능
				}
			}
		}
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}
}
