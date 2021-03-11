package com.javastack.project.services;

import java.util.List;
import java.util.Optional;

import com.javastack.project.models.Comment;
import com.javastack.project.models.Post;
import com.javastack.project.models.User;
import com.javastack.project.repositories.CommentRepository;

import org.springframework.stereotype.Service;

@Service
public class CommentService {

    private CommentRepository commentRepo;

    public CommentService(CommentRepository commentRepo) {
        this.commentRepo = commentRepo;

    }

    public List<Comment> getComments() {
        return commentRepo.findAll();
    }

    public Optional<Comment> getComment(Long id) {
	return commentRepo.findById(id);
}
public void createComment(Comment Comment) {
	commentRepo.save(Comment);
}
public void createComment(String comment, User user, Post post) {
    Comment co = new Comment (comment, user, post);
	commentRepo.save(co);
}
public void deleteComment(Long id) {
    commentRepo.deleteById(id);
}
}