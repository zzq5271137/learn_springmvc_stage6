package com.mycomp.springmvc.web.controller;

import com.mycomp.springmvc.domain.User;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;

@Controller
public class MyController {

    /*
     * @ResponseBody:
     * 返回json数据, 需要加上@ResponseBody;
     * 可以返回一个对象, 也可以返回List集合和Map集合
     */
    @RequestMapping("getJson")
    @ResponseBody
    public User getJson() {
        User user = new User();
        user.setName("zzq");
        user.setAge(10);
        user.setGender(0);
        return user;
    }

    /*
     * @RequestBody:
     * 默认情况下我们发送的都是content-type: application/x-www-form-urlencoded, 这种数据是可以直接使用@RequestParam接收;
     * 但如果不是这种类型, 如application/json, application/xml等, 就不能使用@RequestParam接收;
     * 需要使用@RequestBody接收;
     */
    @RequestMapping("formJson")
    @ResponseBody
    public User formJson(@RequestBody User user) {
        System.out.println(user);
        return user;
    }

    /*
     * 接收文件
     */
    @RequestMapping("myFile")
    public String myFile(@RequestBody String body) {
        System.out.println(body);
        return "result";
    }

    /*
     * 文件下载
     */
    @RequestMapping("/download/{filename:.+}")
    public ResponseEntity download(@PathVariable String filename, HttpSession session) throws Exception {
        System.out.println("下载: " + filename);

        // 1. 获取文件路径
        ServletContext context = session.getServletContext();
        String realPath = context.getRealPath("/download/" + filename);
        System.out.println("真实路径: " + realPath);

        // 2. 把文件读到程序中
        InputStream inputStream = new FileInputStream(realPath);
        byte[] body = new byte[inputStream.available()];
        inputStream.read(body);

        // 3. 设置相应头, 使文件以附件的形式下载
        HttpHeaders httpHeaders = new HttpHeaders();
        // 解决中文文件名编码问题
        filename = URLEncoder.encode(filename, "UTF-8");
        httpHeaders.add("Content-Disposition", "attachment;filename=" + filename);
        ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(body, httpHeaders, HttpStatus.OK);

        return responseEntity;
    }

    /*
     * 文件上传
     */
    @RequestMapping("upload")
    public String upload(@RequestParam("file") CommonsMultipartFile file, HttpSession session)
            throws IOException {
        System.out.println("文件上传");
        System.out.println("文件类型: " + file.getContentType());
        System.out.println("文件名称: " + file.getOriginalFilename());
        System.out.println("文件大小: " + file.getSize());
        System.out.println("input的name属性名称: " + file.getName());

        // 确定上传的路径
        ServletContext context = session.getServletContext();
        String realPath = context.getRealPath("/upload");
        // 将路径变成程序当中的路径
        File uploadPath = new File(realPath);
        // 如果路径不存在, 创建一个
        if (!uploadPath.exists()) {
            uploadPath.mkdirs();
        }
        // 确认最终的路径: /文件夹/文件名
        String filename = file.getOriginalFilename();
        uploadPath = new File(uploadPath + "/" + filename);

        // 开始上传
        file.transferTo(uploadPath);

        return "success";
    }

    @RequestMapping("exception")
    public String exception() {
        int i = 1 / 0;
        return "success";
    }

    /*
     * 寻找异常处理的方法的优先级, 是根据继承关系比较近的;
     *
     * 如果当前类中没有找到相应的异常处理方法, 就会去找有没有标记为@ControllerAdvice的类, 在那里面找@ExceptionHandler方法
     */
    /*
    @ExceptionHandler(value = ArithmeticException.class)
    public String handleException(Exception e) {
        System.out.println(e.getMessage());
        return "error";
    }

    @ExceptionHandler(value = RuntimeException.class)
    public String handleException2(Exception e) {
        System.out.println(e.getMessage());
        return "error";
    }

    @ExceptionHandler(value = Exception.class)
    public String handleException3(Exception e) {
        System.out.println(e.getMessage());
        return "error";
    }
    */

    @RequestMapping("local")
    public String local() {
        return "local";
    }
}
