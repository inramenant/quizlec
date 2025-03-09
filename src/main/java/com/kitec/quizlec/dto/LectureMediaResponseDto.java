package com.kitec.quizlec.dto;

import com.kitec.quizlec.entity.LectureMedia;
import lombok.Data;

@Data
public class LectureMediaResponseDto {
    private Long id;
    private Long lectureId;
    private String mediaType;
    private String content;
    private Integer orderIndex;

    public LectureMediaResponseDto(LectureMedia lectureMedia) {
        this.id = lectureMedia.getId();
        this.lectureId = (lectureMedia.getLecture() != null) ? lectureMedia.getLecture().getId() : null;
        this.mediaType = lectureMedia.getMediaType();
        this.content = lectureMedia.getContent();
        this.orderIndex = lectureMedia.getOrderIndex();
    }
}
