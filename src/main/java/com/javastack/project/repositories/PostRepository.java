package com.javastack.project.repositories;

import java.util.List;
import java.util.Optional;

import com.javastack.project.models.Post;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PostRepository extends CrudRepository<Post, Long> {
    List<Post> findAll();

    Optional<Post> findById(Long id);
}