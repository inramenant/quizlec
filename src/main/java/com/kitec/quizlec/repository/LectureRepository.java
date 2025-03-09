package com.kitec.quizlec.repository;

import com.kitec.quizlec.entity.Lecture;
import com.kitec.quizlec.entity.LectureMedia;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface LectureRepository extends JpaRepository<Lecture, Long> {
    Optional<Lecture> findByTitle(String title);
    @Query("SELECT lm FROM LectureMedia lm WHERE lm.lecture =:id")
    List<LectureMedia> getLectureMediaById(Long id);
}
