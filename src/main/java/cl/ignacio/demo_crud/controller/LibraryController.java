package cl.ignacio.demo_crud.controller;

import cl.ignacio.demo_crud.model.Library;
import cl.ignacio.demo_crud.repository.LibraryRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
@Slf4j
@RequestMapping("library")
public class LibraryController {
    private final LibraryRepository repository;

    @GetMapping()
    public ResponseEntity<List<Library>> getLibraries() {
        return new ResponseEntity<List<Library>>(repository.getLibraries(), HttpStatus.OK);
    }

}
