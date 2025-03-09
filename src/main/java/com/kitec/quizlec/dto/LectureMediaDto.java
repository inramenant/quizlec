package com.kitec.quizlec.dto;

import lombok.Data;

@Data
public class LectureMediaDto {
    private Long id;
    private Long lectureId;
    private String mediaType;
    private String content;
    private Integer orderIndex;
}
