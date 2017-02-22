package com.youarenotin.jkl.controller;

import com.youarenotin.jkl.App.Utils;
import com.youarenotin.jkl.Entity.TextMessage;
import org.dom4j.DocumentException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.Map;

/**
 * Created by dell on 2/14 0014.
 */
@Controller
public class MsgRecieve {
    @RequestMapping(value = "/kj",method = RequestMethod.POST)
    @ResponseBody
    public String getTextMessage(@RequestBody String body){
        try {
            Map<String, String> messageMap = Utils.xmlToMap(body);
            String toUserName = messageMap.get("ToUserName");
            String fromUserName = messageMap.get("FromUserName");
            String msgType = messageMap.get("MsgType");
            if (msgType.equals("text")){
                return doText(messageMap, toUserName, fromUserName);
            }else if (msgType.equals("event")){
                return doEvent(messageMap,toUserName,fromUserName);
            }

        } catch (DocumentException e) {
            e.printStackTrace();
        }
        return "";
    }

    private String doEvent(Map<String, String> messageMap, String toUserName, String fromUserName) {
//        messageMap.get("")
        return null;
    }

    private String doText(Map<String, String> messageMap, String toUserName, String fromUserName) {
        String content = messageMap.get("Content");
        TextMessage textMessage = new TextMessage();
        textMessage.setContent("大腿说你发的内容是："+content+"     你的openID是："+fromUserName);
        textMessage.setFromUserName(toUserName);
        textMessage.setToUserName(fromUserName);
        textMessage.setCreateTime(String.valueOf(new Date().getTime()));
        textMessage.setMsgType("text");
        String messageXml = Utils.textMessageToXml(textMessage);
        return messageXml;
    }
}
