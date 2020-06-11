package com.dmu.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor{

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object arg2) throws Exception {
		String uri = req.getRequestURI();
		//设置不拦截静态资源
		if(uri.equals("/zzy/login") || uri.equals("/zzy/findPwd")|| uri.equals("/zzy/showproduct") || uri.equals("/zzy/productinfo")
				|| uri.equals("/zzy/sortingproduct") || uri.equals("/zzy/search") || uri.equals("/zzy/register")
				|| uri.indexOf("images")!=-1 || uri.indexOf("js")!=-1 || uri.indexOf("css")!=-1) {
			return true;
		}else {
			Object obj = req.getSession().getAttribute("user");
			if(obj!=null) {
				return true;
			}
			System.out.println("拦截器："+uri);
			System.out.println("我被拦截了");
			//resp.setContentType("text/html;charset=utf-8");
			//因为如果只在rightframe下登录，登录成功后会有套娃页面
			resp.getWriter().write("<script type=\"text/javascript\">window.top.location=\"login.jsp\"</script>");
			//resp.sendRedirect("/zzy/login.jsp");
			return false;	
		}
	}
}
