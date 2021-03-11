package com.javastack.project.controllers;

import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import com.javastack.project.models.Post;
import com.javastack.project.models.User;
import com.javastack.project.models.Comment;
import com.javastack.project.services.CommentService;
import com.javastack.project.services.PostService;
import com.javastack.project.services.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@CrossOrigin(origins = "http://localhost:3000")
@Controller
public class HomeApi {
    private final UserService userService;
    private final PostService postService;
    private final CommentService commentService;

    public HomeApi(UserService userService, PostService postService, CommentService commentService) {
        this.userService = userService;
        this.postService = postService;
        this.commentService = commentService;
    }

    // @RequestMapping("/api")
    // public String index(Model model) {
    // String result = "hello";
    // return result;
    // }

    @RequestMapping("/")
    public String hello() {
        return "register.jsp";
    }

    @RequestMapping("/login")
    public String helloo() {
        return "login.jsp";
    }

    @GetMapping("/")
    public String Index(@ModelAttribute("registration") User user, Model model) {
        return "register.jsp";
    }

    @PostMapping("/registration")
    public String Register(@Valid @ModelAttribute("registration") User user, BindingResult result,
            HttpSession session) {
        // validator.validate(user, result);
        if (result.hasErrors())
            return "register.jsp";
        userService.registerUser(user);
        session.setAttribute("user_id", user.getId());
        return "redirect:/posts";
    }
    // @RequestMapping(value = "/registration", method = RequestMethod.POST)
    // public String registerUser(@ModelAttribute("user") User user, HttpSession
    // session) {
    // userService.registerUser(user);
    // session.setAttribute("user_id", user.getId());
    // return "redirect:/posts";
    // }

    @RequestMapping(value = "/loginuser", method = RequestMethod.POST)
    public String loginUser(@RequestParam("email") String email, @RequestParam("password") String password, Model model,
            HttpSession session) {
        boolean auth = userService.authenticateUser(email, password);
        if (auth) {
            User user = userService.findByEmail(email);
            session.setAttribute("user_id", user.getId());
            return "redirect:/posts";
        } else {
            model.addAttribute("error", "there is an error!");
            return "login.jsp";
        }
    }

    @RequestMapping("/posts")
    public String home(HttpSession session, Model model) {
        if (session.getAttribute("user_id") == null) {
            return "redirect:/login";
        } else {
            Long user_id = (Long) session.getAttribute("user_id");
            User user = userService.findUserById(user_id);
            List<Post> posts = postService.getPosts();
            model.addAttribute("posts", posts);
            model.addAttribute("user", user);
            return "dashboard.jsp";
        }
    }

    @RequestMapping("/profile/{id}")
    public String profile(@PathVariable("id") Long id, Model model, HttpSession session) {
        if (session.getAttribute("user_id") == null) {
            return "redirect:/login";
        } else {
            Long user_id = (Long) session.getAttribute("user_id");
            User loggedinUser = userService.findUserById(user_id);
            User user = userService.findUserById(id);
            model.addAttribute("user", user);
            model.addAttribute("loggedinUser", loggedinUser);
            return "profile.jsp";
        }
    }

    @RequestMapping("/posts/{id}")
    public String displayevent(@PathVariable("id") Long id, Model model, HttpSession session) {
        if (session.getAttribute("user_id") == null) {
            return "redirect:/login";
        } else {
            Long user_id = (Long) session.getAttribute("user_id");
            User user = userService.findUserById(user_id);
            Post post = postService.findPostById(id);
            // List<User> userlist = postService.getusers(post);
            // model.addAttribute("users", userlist);
            model.addAttribute("user", user);
            model.addAttribute("post", post);
            List<Comment> comments = postService.getPostComments(post);
            model.addAttribute("comments", comments);
            return "display.jsp";
        }
    }

    @RequestMapping("/join/{id}")
    public String join(@PathVariable("id") Long id, HttpSession session) {
        Long user_id = (Long) session.getAttribute("user_id");
        User user = userService.findUserById(user_id);
        Post post = postService.findPostById(id);
        postService.createPostusers(post, user);
        return "redirect:/posts";
    }

    @RequestMapping("/unjoin/{id}")
    public String unjoin(@PathVariable("id") Long id, HttpSession session) {
        Long user_id = (Long) session.getAttribute("user_id");
        User user = userService.findUserById(user_id);
        Post post = postService.findPostById(id);
        postService.removePostusers(post, user);
        return "redirect:/posts";
    }
    @RequestMapping("/joinlist/{id}")
    public String joinlist(@PathVariable("id") Long id, HttpSession session) {
        Long user_id = (Long) session.getAttribute("user_id");
        User user = userService.findUserById(user_id);
        Post post = postService.findPostById(id);
        postService.createPostusers(post, user);
        return "redirect:/list/"+id;
    }

    @RequestMapping("/unjoinlist/{id}")
    public String unjoinlist(@PathVariable("id") Long id, HttpSession session) {
        Long user_id = (Long) session.getAttribute("user_id");
        User user = userService.findUserById(user_id);
        Post post = postService.findPostById(id);
        postService.removePostusers(post, user);
        return "redirect:/list/"+id;
    }

    @RequestMapping("/follow/{id}")
    public String follow(@PathVariable("id") Long id, HttpSession session) {
        Long user_id = (Long) session.getAttribute("user_id");
        User user = userService.findUserById(user_id);
        User followedUser = userService.findUserById(id);
        userService.createfollow(user, followedUser);
        return "redirect:/profile/" + id;
    }

    @RequestMapping("/unfollow/{id}")
    public String unfollow(@PathVariable("id") Long id, HttpSession session) {
        Long user_id = (Long) session.getAttribute("user_id");
        User user = userService.findUserById(user_id);
        User followedUser = userService.findUserById(id);
        userService.removefollow(user, followedUser);
        return "redirect:/profile/" + id;
    }

    @RequestMapping("/list/{id}")
    public String list(@PathVariable("id") Long id, HttpSession session, Model model) {
        Long user_id = (Long) session.getAttribute("user_id");
        User user = userService.findUserById(user_id);
        model.addAttribute("user", user);
        return "list.jsp";
    }

    @RequestMapping("/create")
    public String c() {
        return "new.jsp";
    }

    @RequestMapping(value = "/createpost", method = RequestMethod.POST)
    public String createn(@RequestParam(value = "content") String content, HttpSession session) {
        Long user_id = (Long) session.getAttribute("user_id");
        User user = userService.findUserById(user_id);
        postService.createPost(content, user);
        return "redirect:/posts";
    }

    @RequestMapping(value = "/comment", method = RequestMethod.POST)
    public String message(@RequestParam(value = "comment") String comment, @RequestParam(value = "id") Long id,
            HttpSession session) {
        Long user_id = (Long) session.getAttribute("user_id");
        User user = userService.findUserById(user_id);
        Post post = postService.findPostById(id);
        commentService.createComment(comment, user, post);
        return "redirect:/posts/" + id;
    }

    @RequestMapping("/post/edit/{id}")
    public String edit(@PathVariable("id") Long id, Model model, HttpSession session) {
        if (session.getAttribute("user_id") == null) {
            return "redirect:/login";
        } else {
            Post post = postService.findPostById(id);
            model.addAttribute("post", post);
            return "edit.jsp";
        }
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.PUT)
    public String update(@PathVariable("id") Long id, @RequestParam(value = "img") String content,
            @RequestParam(value = "description") String description, HttpSession session) {
        Long user_id = (Long) session.getAttribute("user_id");
        User user = userService.findUserById(user_id);
        postService.updatePost(id, content, description, user);
        return "redirect:/posts";
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE)
    public String destroy(@PathVariable("id") Long id) {
        postService.deletePost(id);
        return "redirect:/posts";
    }
    @RequestMapping(value = "/deletecomment/{id}", method = RequestMethod.DELETE)
    public String destroycomment(@PathVariable("id") Long id, @RequestParam(value = "postid") Long postid) {
        commentService.deleteComment(id);
        return "redirect:/posts/"+postid;
    }
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        // invalidate session
        session.invalidate();
        // redirect to login page
        return "redirect:/login";
    }
}