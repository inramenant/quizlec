package com.kitec.quizlec.dto;

import lombok.Data;

import java.util.List;

@Data
public class LectureDto {
    private Long id;
    private String title;
    private String description;
    private Long createdBy;
    private List<LectureMediaDto> lectureMediaList;
}
