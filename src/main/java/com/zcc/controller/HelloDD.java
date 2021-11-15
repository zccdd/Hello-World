package com.zcc.controller;

import com.google.common.collect.Maps;
import com.zcc.dao.MsgRepository;
import com.zcc.dao.UserRepository;
import com.zcc.entity.Msg;
import com.zcc.entity.User;
import com.zcc.util.ZxingHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.beans.BeanMap;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

/**
 * Created by dell on 2018/5/13.
 */
@Controller
@RequestMapping("/")
public class HelloDD {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private MsgRepository msgRepository;

    @RequestMapping("/msgList")
    public String msgList(Model model,HttpServletRequest req){
        System.out.println("login success..." + new Date());
        User user = (User)req.getSession().getAttribute("user");
        if(user!=null){
            try {
                List<Msg> msgList = msgRepository.findAll();
                List<User> userList = userRepository.findAll();
                Map<String, User> userMap = userList.stream().collect(Collectors.toMap(User::getUserName, Function.identity()));
                Collections.reverse(msgList);
                List<Map<String, Object>> maps = msgList.stream().map(msg -> {
                    Map<String, Object> map = Maps.newHashMap(BeanMap.create(msg));
                    if (userMap.get(msg.getUserName()) != null) {
                        map.put("urlpath", userMap.get(msg.getUserName()).getUrlpath());
                    } else {
                        map.put("urlpath", "/img/pp.jpg");
                    }
                    return map;
                }).collect(Collectors.toList());
                model.addAttribute("msgList",maps);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return "msg/msgList";
        }else{
            return "index";
        }
    }

    @RequestMapping("/adduser")
    public String addUser(User user){
        System.out.println("insert user..." + user.getUserName());
        userRepository.save(user);
        return "redirect:/userList";
    }

    @RequestMapping("/userList")
    public String userList(Model model){
        System.out.println("find user..." + new Date());
        List<User> userList = userRepository.findAll();
        model.addAttribute("userList",userList);
        return "user/userList";
    }

    @RequestMapping("/addMsg")
    public String addMsg(Msg msg){
        System.out.println("Leaving message..." + msg.getUserName());
        msg.setCurrent(new Date());
        msgRepository.save(msg);
        return "redirect:/msgList";
    }

    @RequestMapping("/login2")
    public String login(User user,HttpServletRequest req){
        System.out.println("login..." + user.getUserName());
        User dbuser = userRepository.findByUserName(user.getUserName());
        if (dbuser != null){
            if (dbuser.getPassWord().equals(user.getPassWord())){
                req.getSession().setAttribute("user", dbuser);
                return "redirect:/msgList";
            }
        }
        return "index";
    }

    @RequestMapping("/")
    public String toIndex(){
        System.out.println("request..." + new Date());
        return "index";
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest req){
        System.out.println("logout..." + new Date());
        req.getSession().removeAttribute("user");
        return "redirect:/";
    }

    @RequestMapping("/uploadFile")
    private String uploadFile(MultipartFile file,User user,HttpServletRequest req) {
        try {
            // 文件保存路径
            //本地打印：G:\1706\Hello-World\src\main\webapp\img/*.jpg
            //线上打印：/data/dd/helloworld/webapps/ROOT/img/*.jpg
            String filepath = req.getSession().getServletContext().getRealPath("")+"img/";
            String url = req.getScheme()+"://"+req.getServerName()+":"+req.getServerPort()+req.getContextPath()+"/img/";//本地可以访问
            String filename = file.getOriginalFilename();//获取file图片名称
            saveFile(file.getBytes(), filepath, filename);
            //user.setUrlpath(url+filename);
            user.setUrlpath("/img/"+filename);
            userRepository.saveAndFlush(user);
            System.out.println("upload success..." + filename);
        } catch (Exception e) {
            System.out.println("upload fail..." + e);
        }
        return "redirect:/";
    }

    @RequestMapping("/QRcode")
    @ResponseBody
    private String QRcode(HttpServletRequest req) {
        try {
            String contents = "http://u2055599.viewer.maka.im/k/8BG9VM5F?DSCKID=dec66a35-25ce-487b-84c8-4450701480a7&DSTIMESTAMP=1479433564411";
            String filepath = req.getSession().getServletContext().getRealPath("")+"img/QRcode.PNG";
            ZxingHandler.encode2(contents, 200, 200, filepath);
            System.out.println("QRcode Success..."+new Date());
        } catch (Exception e) {
            System.out.println("QRcode Fail..." + e);
        }
        return "/img/QRcode.PNG";
    }

    public static void saveFile(byte[] file, String filePath, String fileName) throws Exception {
        File targetFile = new File(filePath);
        if(!targetFile.exists()){
            targetFile.mkdirs();
        }
        FileOutputStream out = new FileOutputStream(filePath+fileName);
        out.write(file);
        out.flush();
        out.close();
    }
}
