package com.test.domain;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "proveedor")
public class Proveedor {

	@Id
	@GeneratedValue
	@Column(name = "id")
	private int id;

	@Column(name = "cuit")
	private String cuit;

	@Column(name = "nombre")
	private String nombre;

	@Column(name = "domicilio")
	private String domicilio;

	@Column(name = "telefono")
	private String telefono;

	@Column(name = "mail")
	private String mail;

	@Column(name = "activo")
	private Boolean activo;

	@OneToMany(targetEntity = ProductoProveedor.class, mappedBy = "pk.proveedor", fetch = FetchType.EAGER)
	private Set<ProductoProveedor> productosProveedores = new HashSet<ProductoProveedor>(
			0);

	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}

	public String getDomicilio() {
		return domicilio;
	}

	public void setDomicilio(String domicilio) {
		this.domicilio = domicilio;
	}

	public String getCuit() {
		return cuit;
	}

	public void setCuit(String cuit) {
		this.cuit = cuit;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public Boolean getActivo() {
		return activo;
	}

	public void setActivo(Boolean activo) {
		this.activo = activo;
	}

	// @OneToMany(fetch = FetchType.LAZY, mappedBy = "pk.proveedor")
	// public Set<ProductoProveedor> getProductosProveedores() {
	// return productosProveedores;
	// }
	//
	// public void setProductosProveedores(Set<ProductoProveedor>
	// productosProveedores) {
	// this.productosProveedores = productosProveedores;
	// }

}
