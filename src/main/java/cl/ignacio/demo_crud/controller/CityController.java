package cl.ignacio.demo_crud.controller;

import cl.ignacio.demo_crud.model.City;
import cl.ignacio.demo_crud.model.Library;
import cl.ignacio.demo_crud.repository.city.CityRepository;
import cl.ignacio.demo_crud.repository.library.LibraryRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
@Slf4j
@RequestMapping("city")
public class CityController {
    private final CityRepository repository;

    @GetMapping()
    public ResponseEntity<List<City>> getLibraries() {
        return new ResponseEntity<List<City>>(repository.getCities(), HttpStatus.OK);
    }
}
