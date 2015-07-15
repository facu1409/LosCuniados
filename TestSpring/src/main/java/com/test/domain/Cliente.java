package com.test.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="cliente")//Este nombre debe ser igual a la base de datos
public class Cliente {

	@Id
	@GeneratedValue
	@Column(name="ClienteID")
	private int clienteID;
	
	@Column(name="Nombre")
	private String nombre;
	
	@Column(name="Apellido")
	private String apellido;
	
	@Column(name="TelMovil")
	private String telMovil;	

	@Column(name="email")
	private String email;	
	
	@Column(name="DireccionCalle")
	private String direccionCalle;	
	
	@Column(name="DireccionNro")
	private String direccionNro;	
	
	@Column(name="DireccionDpto")
	private String direccionDpto;	
	
	@Column(name="DireccionPiso")
	private String direccionPiso;

	public int getClienteID() {
		return clienteID;
	}

	public void setClienteID(int clienteID) {
		this.clienteID = clienteID;
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

	public String getDireccionCalle() {
		return direccionCalle;
	}

	public void setDireccionCalle(String direccionCalle) {
		this.direccionCalle = direccionCalle;
	}

	public String getDireccionNro() {
		return direccionNro;
	}

	public void setDireccionNro(String direccionNro) {
		this.direccionNro = direccionNro;
	}

	public String getDireccionDpto() {
		return direccionDpto;
	}

	public void setDireccionDpto(String direccionDpto) {
		this.direccionDpto = direccionDpto;
	}

	public String getDireccionPiso() {
		return direccionPiso;
	}

	public void setDireccionPiso(String direccionPiso) {
		this.direccionPiso = direccionPiso;
	}	
	
}
