package com.kitec.quizlec.service;

import com.kitec.quizlec.entity.Lecture;
import com.kitec.quizlec.entity.User;
import com.kitec.quizlec.entity.UserActivation;
import com.kitec.quizlec.exception.UserNotFoundException;
import com.kitec.quizlec.repository.UserRepository;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;

import java.time.Instant;
import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class UserService {
    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    public Optional<User> getUserById(Long id) {
        return userRepository.findById(id);
    }

    public User createUser(User user) {
        UserActivation activation = new UserActivation();
        activation.setUser(user);
        user.setActivation(activation);
        return userRepository.save(user);
    }

    public User updateUser(Long id, User updatedUser) {
        User user = userRepository.findById(id)
                .orElseThrow(() -> new UserNotFoundException(id));
        user.setUsername(updatedUser.getUsername());
        user.setPassword(updatedUser.getPassword());
        user.setEmail(updatedUser.getEmail());
        user.setUpdatedAt(Instant.now());

        return userRepository.save(user);
    }

    public void deleteUser(Long id) {
        userRepository.deleteById(id);
    }

    public Optional<User> getUserByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    public Optional<User> getUserByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    public Optional<Boolean> isUserActivated(Long id) {
        return userRepository.isActivatedById(id);
    }

    public Optional<List<Lecture>> getLectures(Long userId) {
        return userRepository.CreatedLecturesById(userId);
    }


}
