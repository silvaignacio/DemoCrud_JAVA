package cl.ignacio.demo_crud.repository.city.impl;

import cl.ignacio.demo_crud.repository.city.CityRepository;
import cl.ignacio.demo_crud.repository.library.LibraryRepository;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.*;

/**
 * @author Ignacio Silva
 * @since 1.0
 */
@ExtendWith(SpringExtension.class)
@SpringBootTest
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
class CityRepositoryImplTest {

    @Autowired
    private CityRepository repository;

    @Test
    void getCities() {
        var cities = repository.getCities();
        assertThat(cities.size()).isPositive();
    }
}