package com.jpa.ex3;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@ComponentScan({"myshop.data"})
@EntityScan("myshop.data") //dto를 인식 
@EnableJpaRepositories("myshop.data") //dao인식
public class SpringBootJpaEx3Application {

	public static void main(String[] args) {
		SpringApplication.run(SpringBootJpaEx3Application.class, args);
	}

}
