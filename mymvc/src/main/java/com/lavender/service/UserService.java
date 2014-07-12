package com.lavender.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.lavender.model.User;
import com.lavender.dao.UserDAO;
import org.springframework.cache.annotation.CacheEvict; 
import org.springframework.cache.annotation.Cacheable; 

@Component
@Transactional
public class UserService{

	@Autowired
	private UserDAO dao;

	@Cacheable(value="user")
	public User findById(Long id){
		System.out.println("-------------------");
		return dao.findById(id);
	}
}

