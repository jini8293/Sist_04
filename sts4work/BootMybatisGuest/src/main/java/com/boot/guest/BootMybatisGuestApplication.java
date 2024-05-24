package com.boot.guest;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({"com.guest.*"})
@MapperScan({"com.guest.mapper"})
public class BootMybatisGuestApplication {

	public static void main(String[] args) {
		SpringApplication.run(BootMybatisGuestApplication.class, args);
	}

}
