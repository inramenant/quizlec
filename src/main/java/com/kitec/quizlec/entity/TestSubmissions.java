package com.kitec.quizlec.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.Instant;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "test_submissions", schema = "public", catalog = "kiteclearn")
public class TestSubmissions {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private int id;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @ManyToOne
    @JoinColumn(name = "test_id", nullable = false)
    private Test test;

    @Column(name = "submitted_at")
    private Instant submittedAt;

    @Column(name = "score")
    private Integer score;

    @PrePersist
    protected void onCreate() {
        submittedAt = Instant.now();
    }
}
