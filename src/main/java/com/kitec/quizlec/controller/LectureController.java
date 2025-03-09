package com.kitec.quizlec.controller;

import com.kitec.quizlec.dto.LectureDto;
import com.kitec.quizlec.dto.LectureResponseDto;
import com.kitec.quizlec.entity.Lecture;
import com.kitec.quizlec.service.LectureService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/lectures")
@Tag(name = "Lecture Controller", description = "Operations related to Lectures")
public class LectureController {

    private final LectureService lectureService;

    public LectureController(LectureService lectureService) {
        this.lectureService = lectureService;
    }

    @GetMapping
    @Operation(summary = "Get all Lectures", description = "Fetch all lectures from DB")
    public ResponseEntity<List<LectureResponseDto>> getAllLectures() {
        List<LectureResponseDto> lectures = lectureService.getAllLectures();
        return ResponseEntity.ok().body(lectures);
    }

    @GetMapping("/{id}")
    @Operation(summary = "Get Lecture by ID", description = "Fetch a lecture by ID")
    public ResponseEntity<LectureResponseDto> getLectureById(@PathVariable Long id) {
        return lectureService.getLectureById(id)
                .map(ResponseEntity::ok)
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    @GetMapping("/search/{title}")
    @Operation(summary = "Get Lecture by Title", description = "Fetch a lecture by Title")
    public ResponseEntity<LectureResponseDto> getLectureByTitle(@PathVariable  String title) {
        return lectureService.getLectureByTitle(title)
                .map(lecture -> ResponseEntity.ok(new LectureResponseDto(lecture)))
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    @PostMapping
    @Operation(summary = "Create User", description = "Add a new Lecture to DB")
    public ResponseEntity<Lecture> createLecture(@RequestBody LectureDto lectureDto) {
        return ResponseEntity.ok(lectureService.createLecture(lectureDto));
    }

    @PutMapping("/{id}")
    @Operation(summary = "Update Lecture by ID", description = "Update lecture information by ID")
    public ResponseEntity<LectureResponseDto> updateLecture(@PathVariable Long id, @RequestBody LectureDto lecture) {
        return ResponseEntity.ok(lectureService.updateLecture(id, lecture));
    }

    @DeleteMapping("/{id}")
    @Operation(summary = "Delete Lecture", description = "Remove a lecture by ID")
    public ResponseEntity<Void> deleteLecture(@PathVariable Long id) {
        lectureService.deleteLecture(id);
        return ResponseEntity.noContent().build();
    }
}

