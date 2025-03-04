package com.kitec.quizlec.repository;

import com.kitec.quizlec.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findByUsername(String username);
    Optional<User> findByEmail(String email);
    @Query("SELECT u.activated from UserActivation u WHERE u.user = :id")
    Optional<Boolean> isActivatedById(Long id);
}
