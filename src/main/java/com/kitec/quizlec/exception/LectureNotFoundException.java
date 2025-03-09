package com.kitec.quizlec.exception;

public class LectureNotFoundException extends RuntimeException {
    public LectureNotFoundException(Long id) {
        super("Lecture with id: " + id + " not found");
    }
    public LectureNotFoundException(String title) {
        super("Lecture with title: " + title + " not found");
    }
}
