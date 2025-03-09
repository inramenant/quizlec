package com.kitec.quizlec.repository;

import com.kitec.quizlec.entity.Lecture;
import com.kitec.quizlec.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findByUsername(String username);
    Optional<User> findByEmail(String email);
    @Query("SELECT ua.activated from UserActivation ua WHERE ua.user.id = :id")
    Optional<Boolean> isActivatedById(@Param("id")Long id);
    @Query("SELECT u.createdLectures FROM User u WHERE u.id = :id")
    Optional<List<Lecture>> CreatedLecturesById(Long id);
}
