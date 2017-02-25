package com.youarenotin.jkl.util;

import java.io.StringReader;
import java.io.StringWriter;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;

import com.thoughtworks.xstream.XStream;

public class XMLUtil {
	 /** 
     * JavaBean转换成xml 
     * 默认编码UTF-8 
     * @param obj 
     * @param writer 
     * @return  
     */  
    public static String convertToXml(Object obj, Class<?>... c) {  
        return convertToXml(obj, "UTF-8",c);  
    }  
  
    /** 
     * JavaBean转换成xml 
     * @param obj 
     * @param encoding  
     * @return  
     */  
    public static String convertToXml(Object obj, String encoding, Class<?>... c) {  
        String result = null;  
        if(c == null || c.length==0){
        	c = new Class<?>[]{obj.getClass()};
        }
        try {  
            JAXBContext context = JAXBContext.newInstance(c);  
            Marshaller marshaller = context.createMarshaller();  
            marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);  
            marshaller.setProperty(Marshaller.JAXB_ENCODING, encoding);  
  
            StringWriter writer = new StringWriter();  
            marshaller.marshal(obj, writer);  
            result = writer.toString();  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
  
        return result;  
    }  
  
    /** 
     * xml转换成JavaBean 
     * @param xml 
     * @param c 
     * @return 
     */  
    @SuppressWarnings("unchecked")  
    public static <T> T converyToJavaBean(String xml, Class<?>... c) {  
        T t = null;  
        try {  
            JAXBContext context = JAXBContext.newInstance(c);  
            Unmarshaller unmarshaller = context.createUnmarshaller();  
            t = (T) unmarshaller.unmarshal(new StringReader(xml));  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
  
        return t;  
    }  
    
    /**
     * 将Bean转换为XML
     *
     * @param clazzMap 别名-类名映射Map
     * @param bean     要转换为xml的bean对象
     * @return XML字符串
     */
    public static <T> String bean2xml(Map<String, Class<T>> clazzMap, Object bean) {
        XStream xstream = new XStream();
        for (Iterator<Entry<String, Class<T>>> it = clazzMap.entrySet().iterator(); it.hasNext();) {
            Entry<String, Class<T>> m = (Entry<String, Class<T>>) it.next();
            xstream.alias(m.getKey(), m.getValue());
        }
        String xml = xstream.toXML(bean);
        return xml;
    }

    /**
     * 将XML转换为Bean
     *
     * @param clazzMap 别名-类名映射Map
     * @param xml      要转换为bean对象的xml字符串
     * @return Java Bean对象
     */
    public static <T> Object xml2Bean(Map<String, Class<T>> clazzMap, String xml) {
        XStream xstream = new XStream();
        for (Iterator<Entry<String, Class<T>>> it = clazzMap.entrySet().iterator(); it.hasNext();) {
            Entry<String, Class<T>> m = (Entry<String, Class<T>>) it.next();
            xstream.alias(m.getKey(), m.getValue());
        }
        Object bean = xstream.fromXML(xml);
        return bean;
    }

    /**
     * 获取XStream对象
     *
     * @param clazzMap 别名-类名映射Map
     * @return XStream对象
     */
    public static <T> XStream getXStreamObject(Map<String, Class<T>> clazzMap) {
        XStream xstream = new XStream();
        for (Iterator<Entry<String, Class<T>>> it = clazzMap.entrySet().iterator(); it.hasNext();) {
            Entry<String, Class<T>> m = (Entry<String, Class<T>>) it.next();
            xstream.alias(m.getKey(), m.getValue());
        }
        return xstream;
    } 
}
