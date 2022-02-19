package com.project.finalProject;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import com.project.finalProject.dao.IChatDAO;
import com.project.finalProject.dao.IFavoritDAO;
import com.project.finalProject.dao.IMemberDAO;
import com.project.finalProject.dao.IPostDAO;


@ComponentScan(basePackages = "com.project.finalProject")
/*
 * @ComponentScan(basePackageClasses=MainController.class)
 * 
 * @ComponentScan(basePackageClasses=MemberController.class)
 * 
 * @ComponentScan(basePackageClasses=PostController.class)
 */
@MapperScan(basePackageClasses = IMemberDAO.class)
@MapperScan(basePackageClasses = IPostDAO.class)
@MapperScan(basePackageClasses = IChatDAO.class)
@MapperScan(basePackageClasses = IFavoritDAO.class)
@SpringBootApplication
public class FinalProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(FinalProjectApplication.class, args);
	}

}
