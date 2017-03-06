package com.ali.httpclient.config;

/**
 * Created by dell on 3/1 0001.
 */
public interface AlipayConfig {
    //沙箱网关
    String URL = "https://openapi.alipaydev.com/gateway.do";
    //appid
    String APP_ID = "2016080400167316";
    //app私钥
    String APP_PRIVATE_KEY = "MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDCqGN2vIjsVAxf\n" +
            "psqiaJps4RIa347/3ORjgSnb3RC/uEba5WwjSc8yv+aFk6KKozENEyBKA2V99LVS\n" +
            "aWzBGDtEQ4lwlEymGJaIbgI0dWC9HxQVnvgK0wWGDhggQiuSuPnE82OcL/GxK4E2\n" +
            "5cR1IhbiWgMeoEuMUBQpQdw7B3n68vmmoIxupwy3aVTMNzFU8ANvmg3GGyZrYAcW\n" +
            "QOBSsNUoJYMQZ0yUYNBdcDI1aLW60kdp79khqP/1ptW9oXSBpkncDRIjg7GA2AjI\n" +
            "I4PjaSHh9etRfTi/VQ/ga+v8VgebReCWE5aLnwIm+tSKWMgo5pYY7vc8fLaH0gCe\n" +
            "jFOf3O5BAgMBAAECggEAd3ACt5QvH3LitL4Oj2BHgI8JINwTTgMnT7atDG60HC7h\n" +
            "quYiV/St4aHFvCg+D3raWf9mTIOQ/pvrtcliJYjMtLIL3rvf2/oyQzvctntfBCvR\n" +
            "kwKbh2i7dumm/AQd4EUHXEVK1UbFscPT4O9Sf9yO1gwM5fnM4Scxd68lhkKsIcFp\n" +
            "Q4n0VYY3HP03SnV108OM8dmQOzdMzY7p6jM+fSLT4GBCVZKiOAV0VaTYRAHjRqpW\n" +
            "IfBAenId1Dyp/AeC69RC2q9vkAxzlBxsIDtfkgJ4v9DQqtvxrD2Al4tEu71YPQjZ\n" +
            "pmnbmb1u+SOOfKoCxEBznphU54SSzQYKOYmCTFvjUQKBgQD0Z4lmgdR9nSUFJ0OP\n" +
            "hZe3eFJ6aLLbhtvCx8xiPAg7Pl+Wc2ucKnsWePGMLNCttrGDsVaJFoIYzp7l5JcN\n" +
            "1PNX/HvjTH8YFcoEGe8prveBKfY/DO53s/5Tvc5jjwQPjzpwS1Nj3HVVAVGz9Ot8\n" +
            "pD4P+2QVbvIvnyZW92J9kKHFhwKBgQDL5KTCkFe8sKlHN60rIpTSlzWikAJoJYFX\n" +
            "eXvL7sWf+prLcjIb9giV5AdiNvo6oxiPSW3HDMpphLn5axK1mE6E48EYBspP7CmY\n" +
            "bKki4tC/Y7mXDrh85hAxA1hePN9Z19WdKoPiSy40YCNCjXqKWfvfLDXvEjX+Z/cE\n" +
            "vn24E0Qf9wKBgDWpCdTUyoet2fPws/et+CqTI2C23hYu3M8+ONSUo6YGQsxwmP7X\n" +
            "oODFOxtwt3x8cSsd44cDxxqVOvP0pWmnCKqXx8eXAwyRtCIEY6s+PB9CzEr5lt33\n" +
            "Se6u7MKVIuobo1QGZc+2FpjMSlj9fDqIgQvXQRknm8ry4WMUu64f9DS/AoGAIR71\n" +
            "PL3h4r734J/Eu5sUfdkeV1f5bB2bkzAi0g/pfoFhH+dfCHfBEUhHgsbXgyr3VF9j\n" +
            "O9ByGQ38f+3KzkD9kEzHEzYXK0B7yUztdMNPkaeLgGRdx7w/qRaYBkbxKVEMXEmJ\n" +
            "vvrjeJKdZ7Q/0bWoWqp94GYe60LMN7MSDRLkICUCgYBhrtj0jNaSEjuvFUv8HQjt\n" +
            "JXyABLoOLONwfK2fZBLod3jTapCqSy/1qmaxO7k4L0YXdsKgKLxmmdJfw4Q4L0XE\n" +
            "SoGw+Ht2ipnS2OUPEyaQbxXdTbVGyA0P8835cfqMvrtAwNHSedrh8nY7svU3oRJY\n" +
            "8+LMfitAhaEeif8QbF45nw==";
    //参数返回格式，只支持json
    String FORMAT = "json";
    String CHARSET = "utf-8";
    String ALIPAY_PUBLIC_KEY = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAvRukE4D0vNnKmVtDF5dF+7z5u6E7UJZPdaLCFnA8ElMzdUhW/yG62QibJXKWiyw4YaHH3D+gT9hZ8ZwsYaWAE9vFZxhhA7nbNTphqvqSE24nYiVYj9EUxENlSK7V8cSJPGh8bY3PZI1GK10ABZ6CgL8FD5IHSDN2nSnCa18ubXtXP5oGwK5QIAYdrmBTzbS6SJ/BZMoj/QUJBPyEh4ABwc1ZRHkMadEMRFvIV5if3QdtVoetjjAA4rdUKncdZNaud3+BDejt1eE1J55+EEB4ScL121EEdcIUZeFi3SamlNCEYPqdt/hieoMfe5hEVhqP42KMiG9EUv5dxZP890HW/QIDAQAB";
    // 签名方式 不需修改
    public static String sign_type = "RSA2";
    public static String partner = "2088102169952256";
    // 调试用，创建TXT日志文件夹路径
    public static String log_path = "E:\\alilog.txt";
}
