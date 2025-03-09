package com.kitec.quizlec.dto;

import com.kitec.quizlec.entity.Lecture;
import lombok.Data;

import java.time.Instant;
import java.util.List;
import java.util.stream.Collectors;

@Data
public class LectureResponseDto {
    private Long id;
    private String title;
    private String description;
    private String createdBy;
    private Instant createdAt;
    private Instant updatedAt;
    private List<LectureMediaResponseDto> lectureMediaList;

    public LectureResponseDto(Lecture lecture) {
        this.id = lecture.getId();
        this.title = lecture.getTitle();
        this.description = lecture.getDescription();
        this.createdBy = lecture.getCreatedBy().getUsername();
        this.createdAt = lecture.getCreatedAt();
        this.updatedAt = lecture.getUpdatedAt();

        if (lecture.getLectureMediaList() != null) {
            this.lectureMediaList = lecture.getLectureMediaList().stream()
                    .map(LectureMediaResponseDto::new)
                    .collect(Collectors.toList());
        }
    }
}
