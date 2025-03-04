package com.kitec.quizlec.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "lecture_media", schema = "public", catalog = "kiteclearn")
public class LectureMedia {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "lecture_id", nullable = false)
    private Lecture lectureId;

    @Column(name = "media_type", nullable = false)
    private String mediaType;

    @Lob
    @Column(columnDefinition = "TEXT", name = "content", nullable = false)
    private String content;

    @Column(name = "order_index")
    private Integer orderIndex;
}
