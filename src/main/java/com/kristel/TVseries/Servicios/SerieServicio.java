package com.kristel.TVseries.Servicios;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.kristel.TVseries.Serie;
import com.kristel.TVseries.Compra;
import com.kristel.TVseries.Usuario;
import com.kristel.TVseries.Repositorios.SerieRepositorio;
import com.kristel.TVseries.Repositorios.CompraRepositorio;
import java.util.List;

@Service
public class SerieServicio {

    @Autowired
    private SerieRepositorio repoSeries;

    @Autowired
    private CompraRepositorio repoCompras;

    public List<Serie> obtenerTodasOrdenadasPorAnioDesc() {
        return repoSeries.findAllByOrderByAnioDesc();
    }

    public Serie guardarSerie(Serie serie) {
        return repoSeries.save(serie);
    }

    public Serie buscarSerie(Long id) {
        return repoSeries.findById(id).orElse(null);
    }

    public void borrarSerie(Long id) {
        repoSeries.deleteById(id);
    }

    public void comprarSerie(Usuario usuario, Long serieId) {
        Serie serie = buscarSerie(serieId);
        if(serie != null && serie.getCantidad() > 0) {
            if(!repoCompras.existsByUsuarioAndSerie(usuario, serie)) {
                serie.setCantidad(serie.getCantidad() - 1);
                repoSeries.save(serie);
                Compra nuevaCompra = new Compra(usuario, serie);
                repoCompras.save(nuevaCompra);
            }
        }
    }

    public List<Compra> obtenerComprasDelUsuario(Usuario usuario) {
        return repoCompras.findByUsuario(usuario);
    }
}