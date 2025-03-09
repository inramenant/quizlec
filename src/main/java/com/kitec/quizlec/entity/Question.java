package com.kitec.quizlec.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Set;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "questions", schema = "public", catalog = "kiteclearn")
public class Question {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "test_id", nullable = false)
    private Test test;

    @Lob
    @Column(columnDefinition = "TEXT", name = "question_text", nullable = false)
    private String questionText;

    @Column(name = "question_type")
    private String questionType;

    @Column(name = "order_index")
    private int orderIndex;

    @OneToMany(mappedBy = "question", fetch = FetchType.EAGER)
    private Set<AnswerOptions> answerOptions;

    @OneToMany(mappedBy = "question", fetch = FetchType.LAZY)
    private Set<SubmissionAnswers> submissionAnswers;

}
