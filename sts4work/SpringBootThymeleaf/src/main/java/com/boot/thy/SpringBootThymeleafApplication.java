package com.boot.thy;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({"data.*"})
public class SpringBootThymeleafApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringBootThymeleafApplication.class, args);
	}

}
