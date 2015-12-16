package com.test.domain;

import java.util.ArrayList;

// default package
// Generated 30-jul-2015 14:50:51 by Hibernate Tools 3.4.0.CR1

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="compra")
public class Compra {
	@Id
	@GeneratedValue
	private int id;
	private int id_proveedor;
	private String fecha;
	private float monto;
	private boolean activo;
	private String provNombre;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "compra", cascade = CascadeType.ALL)
	private List<LineaCompra> lineasCompra = new ArrayList<LineaCompra>();
	
	public Compra() {
	}

	public Compra(int idProveedor, String fecha, float monto, boolean activo) {
		this.id_proveedor = idProveedor;
		this.fecha = fecha;
		this.monto = monto;
		this.activo = activo;
	}
	
	public List<LineaCompra> getLineasCompra() {
		return lineasCompra;
	}

	public void setLineasCompra(List<LineaCompra> lineasCompra) {
		this.lineasCompra = lineasCompra;
	}
	
	public boolean isActivo() {
		return this.activo;
	}

	public void setActivo(boolean activo) {
		this.activo = activo;
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getIdProveedor() {
		return this.id_proveedor;
	}

	public void setIdProveedor(int idProveedor) {
		this.id_proveedor = idProveedor;
	}

	public String getFecha() {
		return this.fecha;
	}

	public void setFecha(String fecha) {
		this.fecha = fecha;
	}

	public float getMonto() {
		return this.monto;
	}

	public void setMonto(float monto) {
		this.monto = monto;
	}

	public String getProvNombre() {
		return provNombre;
	}

	public void setProvNombre(String provNombre) {
		this.provNombre = provNombre;
	}

}
