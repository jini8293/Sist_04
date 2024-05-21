package com.boot.thjpa;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

import jakarta.persistence.Entity;

@SpringBootApplication
@ComponentScan({"mycar.*"})
@EntityScan({"mycar.data"})
@EnableJpaRepositories("mycar.repository")
public class BootThymeleafJpaApplication {

	public static void main(String[] args) {
		SpringApplication.run(BootThymeleafJpaApplication.class, args);
	}

}
