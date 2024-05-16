package com.boot.ex2;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({"com.boot.*"})
public class SpringBootEx2Application {
		
		public static void main(String[] args) {
			SpringApplication.run(SpringBootEx2Application.class, args);
		}

}
