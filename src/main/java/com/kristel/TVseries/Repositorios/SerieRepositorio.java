package com.kristel.TVseries.Repositorios;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import com.kristel.TVseries.Serie;
import java.util.List;

@Repository
public interface SerieRepositorio extends CrudRepository<Serie, Long> {
    // Requerimiento Oro: Ordenado por año de forma descendente
    List<Serie> findAllByOrderByAnioDesc();
}