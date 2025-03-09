package com.kitec.quizlec.service;

import com.kitec.quizlec.dto.LectureDto;
import com.kitec.quizlec.dto.LectureResponseDto;
import com.kitec.quizlec.entity.Lecture;
import com.kitec.quizlec.entity.LectureMedia;
import com.kitec.quizlec.entity.User;
import com.kitec.quizlec.exception.LectureNotFoundException;
import com.kitec.quizlec.exception.UserNotFoundException;
import com.kitec.quizlec.repository.LectureRepository;
import com.kitec.quizlec.repository.UserRepository;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@Transactional
public class LectureService {
    private final LectureRepository lectureRepository;
    private final UserRepository userRepository;

    public LectureService(LectureRepository lectureRepository, UserRepository userRepository) {
        this.lectureRepository = lectureRepository;
        this.userRepository = userRepository;
    }

    public List<LectureResponseDto> getAllLectures() {
        return lectureRepository.findAll()
                .stream()
                .map(LectureResponseDto::new)
                .collect(Collectors.toList());
    }

    public Optional<LectureResponseDto> getLectureById(Long id) {
        return lectureRepository.findById(id)
                .map(LectureResponseDto::new);
    }

    public Lecture createLecture(LectureDto lectureDto) {
        User creator = userRepository.findById(lectureDto.getCreatedBy())
                .orElseThrow(() -> new UserNotFoundException(lectureDto.getCreatedBy()));
        Lecture lecture = new Lecture();
        lecture.setCreatedBy(creator);
        lecture.setTitle(lectureDto.getTitle());
        lecture.setDescription(lectureDto.getDescription());

        return lectureRepository.save(lecture);
    }

    public LectureResponseDto updateLecture(Long id, LectureDto updatedLecture) {
        Lecture lecture = lectureRepository.findById(id)
                .orElseThrow(() -> new LectureNotFoundException(id));
        lecture.setTitle(updatedLecture.getTitle());
        lecture.setDescription(updatedLecture.getDescription());

        if(updatedLecture.getLectureMediaList() != null){
            List<LectureMedia> updatedMedia = updatedLecture.getLectureMediaList().stream()
                    .map(dto ->{
                        LectureMedia media = new LectureMedia();
                        media.setId(dto.getId());
                        media.setLecture(lecture);
                        media.setMediaType(dto.getMediaType());
                        media.setContent(dto.getContent());
                        media.setOrderIndex(dto.getOrderIndex());
                        return media;
                    })
                    .collect(Collectors.toList());

            lecture.getLectureMediaList().clear();
            lecture.setLectureMediaList(updatedMedia);
        }

        Lecture savedLecture = lectureRepository.save(lecture);
        return new LectureResponseDto(savedLecture);
    }

    public void deleteLecture(Long id){
        lectureRepository.deleteById(id);
    }

    public Optional<Lecture> getLectureByTitle(String title) {
        return lectureRepository.findByTitle(title);
    }

    public List<LectureMedia> getLectureMediaById(Long id) {
        return lectureRepository.getLectureMediaById(id);
    }
}
