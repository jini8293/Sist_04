package com.boot.thyme;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({"myshop.*"})
@MapperScan({"myshop.mapper"})
public class BootMybatisThymeleafApplication {

	public static void main(String[] args) {
		SpringApplication.run(BootMybatisThymeleafApplication.class, args);
	}

}
