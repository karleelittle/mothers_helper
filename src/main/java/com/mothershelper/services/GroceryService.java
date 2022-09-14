package com.mothershelper.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mothershelper.models.Grocery;
import com.mothershelper.repositories.GroceryRepository;

@Service
public class GroceryService {
	@Autowired
	private GroceryRepository repo;
	
	public Grocery findById(Long id) {
		
		Optional<Grocery> result = repo.findById(id);
		if(result.isPresent()) {
			return result.get();
		}
		return null;
	}
	
	public List<Grocery> all() {
		return repo.findAll();
	}
	public Grocery update(Grocery grocery) {
		return repo.save(grocery);
	}
	public Grocery create(Grocery grocery) {
		return repo.save(grocery);
	}
	public void delete(Long id) {
		repo.deleteById(id);
	}
}
