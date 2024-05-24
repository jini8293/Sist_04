package com.boot.quiz;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({"product.*"})
@MapperScan({"product.mapper"})
public class MybatisThymeleafQuizApplication {

	public static void main(String[] args) {
		SpringApplication.run(MybatisThymeleafQuizApplication.class, args);
	}

}
