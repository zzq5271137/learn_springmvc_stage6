package com.mycomp.springmvc.web.interceptor;

import org.springframework.lang.Nullable;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * 拦截器:
 * 拦截处理器方法;
 *
 * (过滤器是拦截请求)
 */

public class MyFirstInterceptor implements HandlerInterceptor {

    /*
     * 处理器方法执行之前调用;
     * 返回值: true(放行), false(不放行, 不放行的话就执行不了处理器方法)
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
                             Object handler)
            throws Exception {
        System.out.println("MyFirstInterceptor, preHandle执行了");
        return true;
    }

    /*
     * 处理器方法执行之后会自动地调用;
     */
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response,
                           Object handler, @Nullable ModelAndView modelAndView)
            throws Exception {
        System.out.println("MyFirstInterceptor, postHandle执行了");
    }

    /*
     * 请求处理完毕之后, 会调用
     */
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response,
                                Object handler, @Nullable Exception ex)
            throws Exception {
        System.out.println("MyFirstInterceptor, afterCompletion执行了");
    }

}
