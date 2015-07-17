package com.test.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Cliente")//Este nombre debe ser igual a la base de datos
public class Cliente {

	@Id
	@GeneratedValue
	@Column(name="ClienteID")
	private int id;
	
	@Column(name="Nombre")
	private String nombre;
	
	@Column(name="Apellido")
	private String apellido;
	
	@Column(name="TelMovil")
	private String telMovil;	

	@Column(name="Email")
	private String email;	
	
	@Column(name="Direccion")
	private String direccion;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public void setClienteID(int clienteID) {
		this.id = clienteID;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public String getTelMovil() {
		return telMovil;
	}

	public void setTelMovil(String telMovil) {
		this.telMovil = telMovil;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}
