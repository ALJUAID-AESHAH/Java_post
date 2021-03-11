package com.javastack.project.services;

import java.util.List;
import java.util.Optional;

import com.javastack.project.models.Comment;
import com.javastack.project.models.Post;
import com.javastack.project.models.User;
import com.javastack.project.repositories.PostRepository;

import org.springframework.stereotype.Service;

@Service
public class PostService {

    private final PostRepository postRepo;

    public PostService(PostRepository postRepo) {
        this.postRepo = postRepo;
    }

    public List<Post> getPosts() {
        return postRepo.findAll();
    }

    public Optional<Post> getPost(Long id) {
        return postRepo.findById(id);
    }

    public Post findPostById(Long id) {
        Optional<Post> optionalPost = postRepo.findById(id);
        if (optionalPost.isPresent()) {
            return optionalPost.get();
        } else {
            return null;
        }
    }

    public List<User> getusers(Post post) {
        List<User> userlist = post.getUsers();
        return userlist;
    }

    public Post createPost(String content, User user) {
        Post post = new Post(content, user);
        return postRepo.save(post);
    }

    public Post createPostusers(Post post, User user) {
        List<User> list = post.getUsers();
        list.add(user);
        post.setUsers(list);
        return postRepo.save(post);
    }

    public Post removePostusers(Post post, User user) {
        List<User> list = post.getUsers();
        list.remove(user);
        post.setUsers(list);
        return postRepo.save(post);
    }

    public List<Comment> getPostComments(Post post) {
        List<Comment> list = post.getComments();
        return list;
    }

    public List<Comment> createPostComments(Post post, Comment comment) {
        List<Comment> list = post.getComments();
        list.add(comment);
        post.setComments(list);
        return list;
    }

    public Post updatePost(Long id, String content, String description, User user) {
        Optional<Post> optionalPost = postRepo.findById(id);
        if (optionalPost.isPresent()) {
            Post x = optionalPost.get();
            x.setContent(content);
            x.setDescription(description);
            x.setUser(user);
            return postRepo.save(x);
        } else {
            return null;
        }
    }

    public void deletePost(Long id) {
        postRepo.deleteById(id);
    }
}