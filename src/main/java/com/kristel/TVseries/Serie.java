package com.kristel.TVseries;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import java.util.List;

@Entity
@Table(name = "series")
public class Serie {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank(message = "Por favor proporciona el título")
    @Size(min = 5, message = "El título debe tener al menos 5 caracteres y debe ser único")
    @Column(nullable = false, unique = true, length = 150)
    private String titulo;

    @NotNull(message = "Por favor proporciona el año")
    @Positive(message = "El año debe ser un número positivo")
    @Column(nullable = false)
    private Integer anio;

    @NotBlank(message = "Por favor proporciona la descripción")
    @Size(min = 10, message = "La descripción debe tener al menos 10 caracteres")
    @Column(nullable = false, length = 1000)
    private String descripcion;

    @NotBlank(message = "Por favor proporciona una URL válida con la imagen")
    @Pattern(regexp = "(?i).*\\.(jpg|jpeg|png|gif|webp)$", message = "Por favor proporciona una URL válida con la imagen")
    @Column(name = "url_imagen", nullable = false, length = 500)
    private String urlImagen;

    @NotNull(message = "Por favor proporciona la cantidad de copias")
    @PositiveOrZero(message = "La cantidad debe ser cero o un número positivo")
    @Column(nullable = false)
    private Integer cantidad;

    @NotNull(message = "Por favor proporciona el precio")
    @Positive(message = "El precio debe ser un número positivo")
    @Column(nullable = false)
    private Double precio;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "usuario_id", nullable = false)
    private Usuario usuario;

    @OneToMany(mappedBy = "serie", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<Compra> compras;

    public Serie() {}

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getTitulo() { return titulo; }
    public void setTitulo(String titulo) { this.titulo = titulo; }
    public Integer getAnio() { return anio; }
    public void setAnio(Integer anio) { this.anio = anio; }
    public String getDescripcion() { return descripcion; }
    public void setDescripcion(String descripcion) { this.descripcion = descripcion; }
    public String getUrlImagen() { return urlImagen; }
    public void setUrlImagen(String urlImagen) { this.urlImagen = urlImagen; }
    public Integer getCantidad() { return cantidad; }
    public void setCantidad(Integer cantidad) { this.cantidad = cantidad; }
    public Double getPrecio() { return precio; }
    public void setPrecio(Double precio) { this.precio = precio; }
    public Usuario getUsuario() { return usuario; }
    public void setUsuario(Usuario usuario) { this.usuario = usuario; }
    public List<Compra> getCompras() { return compras; }
    public void setCompras(List<Compra> compras) { this.compras = compras; }
}