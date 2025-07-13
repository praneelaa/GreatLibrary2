package com.example.bookstore.Controller;

import com.example.bookstore.Model.BookModel;
import com.example.bookstore.Model.Cart;
import com.example.bookstore.Model.CartDetail;
import com.example.bookstore.Model.Rating;
import com.example.bookstore.Model.User;
import com.example.bookstore.Repository.BookRepo;
import com.example.bookstore.Repository.CartRepository;
import com.example.bookstore.Repository.RatingRepository;
import com.example.bookstore.Repository.UserRepository;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@Controller
public class MainController {

    @Autowired
    private BookRepo bookRepo;

    @Autowired
    private CartRepository cartRepo;

    @Autowired
    private UserRepository userRepo;

    // ---------- LOGIN ----------
    @GetMapping("/login")
    public String showLoginForm() {
        return "login";
    }

    @PostMapping("/login")
    public String processLogin(@RequestParam String username,
                               @RequestParam String password,
                               @RequestParam String role,
                               HttpSession session,
                               Model model) {

        User user = userRepo.findByUsernameAndPasswordAndRole(username, password, role);

        if (user != null) {
            session.setAttribute("user", user);
            return role.equals("admin") ? "redirect:/home" : "redirect:/home";
        } else {
            model.addAttribute("error", "Invalid credentials for " + role + ".");
            return "login";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "logout";  // This returns logout.jsp
    }

    // ---------- REGISTRATION ----------
    @GetMapping("/register")
    public String showRegistrationForm(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }

    @PostMapping("/register")
    public String processRegistration(@ModelAttribute User user, Model model) {
        User existingUser = userRepo.findByUsername(user.getUsername());
        if (existingUser != null) {
            model.addAttribute("error", "Username already exists!");
            return "register";
        }

        user.setRole("user");
        userRepo.save(user);

        model.addAttribute("success", "Registration successful. Please login.");
        return "login";
    }

    // ---------- HOME ----------
    @GetMapping("/home")
    public String showHomePage(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";
        }

        model.addAttribute("user", user); // Used in home.jsp as ${user.username}, ${user.role}
        return "home";
    }

    // ---------- BOOK MANAGEMENT ----------
    @GetMapping("/books")
    public String viewBooks(Model model) {
        List<BookModel> allBooks = bookRepo.findAll();
        model.addAttribute("bookList", allBooks);
        if (!allBooks.isEmpty()) {
            BookModel randomBook = allBooks.get(new Random().nextInt(allBooks.size()));
            model.addAttribute("featured", randomBook);
        }
        return "books";
    }

    @GetMapping("/add")
    public String showForm(Model model) {
        model.addAttribute("book", new BookModel());
        return "add";
    }

    @PostMapping("/save")
    public String saveBook(@ModelAttribute("book") BookModel book) {
        bookRepo.save(book);
        return "redirect:/books";
    }

    @GetMapping("/edit/{id}")
    public String editBook(@PathVariable int id, Model model) {
        model.addAttribute("book", bookRepo.findById(id).orElse(null));
        return "edit";
    }

    @PostMapping("/update")
    public String updateBook(@ModelAttribute BookModel book) {
        bookRepo.save(book);
        return "redirect:/books";
    }

    @GetMapping("/delete/{id}")
    public String deleteBook(@PathVariable int id) {
        bookRepo.deleteById(id);
        return "redirect:/books";
    }

    @GetMapping("/search")
    public String search(@RequestParam String keyword, Model model) {
        List<BookModel> result = bookRepo.findByTitleContainingIgnoreCase(keyword);
        model.addAttribute("bookList", result);
        model.addAttribute("keyword", keyword);
        model.addAttribute("notFound", result.isEmpty()); 
        return "books";
    }

    // ---------- CATALOG FOR USERS ----------
    @GetMapping("/catalog")
    public String showCatalog(Model model) {
        List<BookModel> books = bookRepo.findAll();
        model.addAttribute("bookList", books);
        return "catalog";
    }

    @GetMapping("/catalog/search")
    public String searchCatalog(@RequestParam("keyword") String keyword, Model model) {
        List<BookModel> matchedBooks = bookRepo.findByTitleContainingIgnoreCase(keyword);
        model.addAttribute("bookList", matchedBooks);
        model.addAttribute("keyword", keyword);
        return "catalog";
    }

    // ---------- CART ----------
    @PostMapping("/cart/add")
    public String addToCart(@RequestParam int bookId,
                            @RequestParam int quantity,
                            HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null || !"user".equals(user.getRole())) {
            return "redirect:/login";
        }

        Cart cartItem = new Cart();
        cartItem.setBookId(bookId);
        cartItem.setUserId(user.getId());
        cartItem.setQuantity(quantity);

        cartRepo.save(cartItem);
        return "success";
    }

    @GetMapping("/cart/view")
    public String viewCart(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null || !"user".equals(user.getRole())) {
            return "redirect:/login";
        }

        List<Cart> cartItems = cartRepo.findByUserId(user.getId());
        List<CartDetail> cartDetails = new ArrayList<>();

        for (Cart cart : cartItems) {
            bookRepo.findById(cart.getBookId()).ifPresent(book -> {
                CartDetail detail = new CartDetail();
                detail.setCartId(cart.getId());
                detail.setBook(book);
                detail.setQuantity(cart.getQuantity());
                cartDetails.add(detail);
            });
        }

        model.addAttribute("cartDetails", cartDetails);
        return "cart";
    }

    @GetMapping("/cart/remove/{id}")
    public String removeFromCart(@PathVariable("id") int id, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) return "redirect:/login";

        cartRepo.deleteById(id);
        return "redirect:/cart/view";
    }

    @GetMapping("/cart/checkout")
    public String checkout(HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user != null) {
            cartRepo.deleteByUserId(user.getId());
        }
        return "redirect:/cart/thankyou";
    }

    @GetMapping("/cart/thankyou")
    public String thankYouPage() {
        return "thankyou";
    }
    
    @GetMapping("/music")
    public String playMusic() {
        return "music";
    }
    
    @Autowired
    private RatingRepository ratingRepo;

    // --- Submit Rating ---
    @PostMapping("/rate")
    public String rateBook(@RequestParam int bookId,
                           @RequestParam int stars,
                           @RequestParam String comment,
                           HttpSession session,
                           Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) return "redirect:/login";

        Rating existing = ratingRepo.findByBookIdAndUserId(bookId, user.getId());
        if (existing != null) {
            existing.setStars(stars);
            existing.setComment(comment);
            ratingRepo.save(existing);
        } else {
            Rating rating = new Rating();
            rating.setBookId(bookId);
            rating.setUserId(user.getId());
            rating.setStars(stars);
            rating.setComment(comment);
            ratingRepo.save(rating);
        }

        model.addAttribute("bookId", bookId);
        return "ratingSuccess"; 
    }



    @GetMapping("/catalog/details/{id}")
    public String viewBookDetails(@PathVariable int id, Model model) {
        BookModel book = bookRepo.findById(id).orElse(null);
        if (book == null) return "redirect:/catalog";

        List<Rating> ratings = ratingRepo.findByBookId(id);
        double avgRating = ratings.stream().mapToInt(Rating::getStars).average().orElse(0.0);

        model.addAttribute("book", book);
        model.addAttribute("ratings", ratings);
        model.addAttribute("avgRating", Math.round(avgRating * 10.0) / 10.0);
        return "bookDetails";
    }



}
