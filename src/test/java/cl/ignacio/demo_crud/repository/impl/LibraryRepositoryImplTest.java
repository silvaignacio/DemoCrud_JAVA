package cl.ignacio.demo_crud.repository.impl;

import cl.ignacio.demo_crud.repository.LibraryRepository;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import static org.assertj.core.api.Assertions.assertThat;

/**
 * @author Ignacio Silva
 * @since 1.0
 */
@ExtendWith(SpringExtension.class)
@SpringBootTest
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
class LibraryRepositoryImplTest {

    @Autowired
    private LibraryRepository repository;

    @Test
    void getLibraries() {
        var libraries = repository.getLibraries();
        assertThat(libraries.size()).isPositive();
    }
}