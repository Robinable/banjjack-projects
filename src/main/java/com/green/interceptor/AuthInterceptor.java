package com.green.interceptor;

import com.green.vo.UserVo;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AuthInterceptor implements HandlerInterceptor {
    // preHandle
    // 컨트롤러로 request 들어가기 전에 수행함
    @Override
    public boolean preHandle(
            HttpServletRequest request,
            HttpServletResponse response,
            Object handler) throws Exception {

        // session 객체 가져옴
        // 컨트롤러에서 만든 vo를 담은 세션을 불러와서 변수에 저장
        HttpSession session = request.getSession();
        UserVo userVo = (UserVo) session.getAttribute("login");
        System.out.println("preHaondle: " + userVo);
//        if(ObjectUtils.isEmpty(userVo.get_id())) {
//            // vo를 담은 login 세션이 비어있다면 == 로그인 안되어있음
//            // 로그인이 되어있지 않다면 /login으로 이동
//
//           // response.sendRedirect("/login");
////            return false;                         // 로그인페이지로 넘어갔기 때문에 컨트롤러 요청 더 받지않음
//        } else {
//            session.setMaxInactiveInterval(30*60);
////            return true;
//        }
        return true;
        // request.getRequestURL(): 요청된 URL 전체 주소 정보 반환
        // requsetUrl:전체주소 정보가 /login이면 페이지 이동
//        String requsetUrl = request.getRequestURL().toString();
//        if(requsetUrl.contains("/login")) {
//            return true;
//        }

//        return HandlerInterceptor.super.preHandle(request, response, handler);
        // true: 컨트롤러 실행-페이지 넘어감 false:컨트롤러 실행x-페이지 안 넘어감

    }
    
    // postHandle
    // 컨트롤러 실행 후, 뷰 실행 전에 수행함
    @Override
    public void postHandle(
            HttpServletRequest request,
            HttpServletResponse response,
            Object handler,
            ModelAndView modelAndView) throws Exception {

        HttpSession session = request.getSession();
        UserVo userVo = (UserVo) session.getAttribute("login");
        System.out.println("postHaondle: " + userVo);
        Object userInfo = modelAndView.addObject("vo", userVo);




        HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);

    }
    
    // afterCompletion
    // 뷰(화면) response 끝난 후 실행
    @Override
    public void afterCompletion(
            HttpServletRequest request,
            HttpServletResponse response,
            Object handler, Exception ex) throws Exception {
        HandlerInterceptor.super.afterCompletion(request, response, handler, ex);

    }
}
