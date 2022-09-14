package com.mothershelper.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.mothershelper.models.Grocery;

@Repository
public interface GroceryRepository extends CrudRepository<Grocery, Long> {
	List<Grocery> findAll();
}

