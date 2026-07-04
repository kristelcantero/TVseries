package com.kristel.TVseries.Repositorios;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import com.kristel.TVseries.Compra;
import com.kristel.TVseries.Usuario;
import java.util.List;

@Repository
public interface CompraRepositorio extends CrudRepository<Compra, Long> {
    List<Compra> findByUsuario(Usuario usuario);
    boolean existsByUsuarioAndSerie(Usuario usuario, com.kristel.TVseries.Serie serie);
}