package com.javastack.project.repositories;

import java.util.List;
import java.util.Optional;

import com.javastack.project.models.Comment;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CommentRepository extends CrudRepository<Comment, Long> {
    List<Comment> findAll();

    Optional<Comment> findById(Long id);
}