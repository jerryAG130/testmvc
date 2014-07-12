
package com.lavender.dao;

import com.lavender.model.User;
import org.springframework.stereotype.Component;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

@Component
public class UserDAO{
	
	@PersistenceContext
    EntityManager entityManager;
	
	public User findById(Long id){
		String hql = "from User where id =:id";
		System.out.println("777777777777777777777777777");
		User u = (User)entityManager.createQuery(hql).setParameter("id", id)
				.getSingleResult();
		return u;
	}
	
}
