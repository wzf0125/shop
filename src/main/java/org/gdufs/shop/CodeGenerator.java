package org.gdufs.shop;


import com.baomidou.mybatisplus.generator.FastAutoGenerator;
import com.baomidou.mybatisplus.generator.config.OutputFile;
import com.baomidou.mybatisplus.generator.engine.FreemarkerTemplateEngine;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class CodeGenerator {
    public static void main(String[] args) {
        /* ************ 配置部分 ************ */
        String url = "jdbc:mysql://127.0.0.1/shop?&useSSL=false&serverTimezone=Asia/Shanghai"; // 数据库url
        String username = "root"; // 数据库用户名
        String password = "root"; // 数据库密码
        List<String> tables = new ArrayList<>();
        // 添加要生成的表名
        tables.add("buyer");
        tables.add("buyer_notice");
        tables.add("goods");
        tables.add("order");
        tables.add("order_goods");
        tables.add("seller");
        tables.add("seller_notice");


        String parent = "org.gdufs"; // 项目包名
        String mode = "shop"; // 模块名
        String author = "wzf";
        /* ************ 配置部分 ************ */

        String projectPath = System.getProperty("user.dir");
        String outPutDir = projectPath + "/src/main/java";
        FastAutoGenerator.create(url, username, password)
                .globalConfig(builder -> {
                    builder.author(author) // 设置作者
//                            .fileOverride() // 覆盖已生成文件
                            .outputDir(outPutDir); // 指定输出目录
                })
                .packageConfig(builder -> {
                    builder.parent(parent)
                            .moduleName(mode)
                            .entity("entity")
                            .service("service")
                            .serviceImpl("service.serviceImpl")
                            .controller("controller")
                            .mapper("mapper")
                            .xml("mapper")
                            .pathInfo(Collections.singletonMap(OutputFile.mapperXml, System.getProperty("user.dir") + "\\src\\main\\resources\\mapper"));
                })
                .strategyConfig(builder -> {
                    builder.addInclude(tables)
                            .serviceBuilder()
                            .formatServiceFileName("%sService")
                            .formatServiceImplFileName("%sServiceImpl")
                            .entityBuilder()
                            .enableLombok()
                            .logicDeleteColumnName("deleted")
                            .enableTableFieldAnnotation()
                            .mapperBuilder()
                            .enableBaseResultMap()  //生成通用的resultMap
                            .formatMapperFileName("%sMapper")
                            .enableMapperAnnotation()
                            .formatXmlFileName("%sMapper");
                })
                .templateEngine(new FreemarkerTemplateEngine()) // 使用Freemarker引擎模板，默认的是Velocity引擎模板
                .execute();
    }
}