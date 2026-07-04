package com.kristel.TVseries;

import jakarta.persistence.*;

@Entity
@Table(name = "compras", uniqueConstraints = @UniqueConstraint(columnNames = {"usuario_id", "serie_id"}))
public class Compra {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "usuario_id", nullable = false)
    private Usuario usuario;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "serie_id", nullable = false)
    private Serie serie;

    public Compra() {}

    public Compra(Usuario usuario, Serie serie) {
        this.usuario = usuario;
        this.serie = serie;
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public Usuario getUsuario() { return usuario; }
    public void setUsuario(Usuario usuario) { this.usuario = usuario; }
    public Serie getSerie() { return serie; }
    public void setSerie(Serie serie) { this.serie = serie; }
}