package com.kristel.TVseries;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import java.util.List;

@Entity
@Table(name = "usuarios")
public class Usuario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank(message = "Por favor proporciona tu nombre")
    @Size(min = 3, message = "El nombre debe tener al menos 3 caracteres")
    @Column(nullable = false, length = 100)
    private String nombre;

    @NotBlank(message = "Por favor proporciona tu apellido")
    @Size(min = 3, message = "El apellido debe tener al menos 3 caracteres")
    @Column(nullable = false, length = 100)
    private String apellido;

    @NotBlank(message = "Por favor ingresa un correo válido")
    @Email(message = "Por favor ingresa un correo válido")
    @Column(name = "email", nullable = false, unique = true, length = 150)
    private String email;

    @NotBlank(message = "La contraseña debe tener al menos 8 caracteres")
    @Size(min = 8, message = "La contraseña debe tener al menos 8 caracteres")
    @Column(nullable = false, length = 255)
    private String password;

    @Transient
    private String confirmarPassword;

    @OneToMany(mappedBy = "usuario", fetch = FetchType.LAZY)
    private List<Serie> seriesCreadas;

    @OneToMany(mappedBy = "usuario", fetch = FetchType.LAZY)
    private List<Compra> compras;

    public Usuario() {}

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }
    public String getApellido() { return apellido; }
    public void setApellido(String apellido) { this.apellido = apellido; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    public String getConfirmarPassword() { return confirmarPassword; }
    public void setConfirmarPassword(String confirmarPassword) { this.confirmarPassword = confirmarPassword; }
    public List<Serie> getSeriesCreadas() { return seriesCreadas; }
    public void setSeriesCreadas(List<Serie> seriesCreadas) { this.seriesCreadas = seriesCreadas; }
    public List<Compra> getCompras() { return compras; }
    public void setCompras(List<Compra> compras) { this.compras = compras; }

    public String getNombreCompleto() {
        return nombre + " " + apellido;
    }
}