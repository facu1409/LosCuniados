package com.test.domain;

// default package
// Generated 30-jul-2015 14:50:51 by Hibernate Tools 3.4.0.CR1

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.CascadeType;


@Entity
@Table(name="factura")
public class Factura{
	@Id
	@GeneratedValue
	private int id;
	private String id_tipoFactura;
	private int id_Cliente;
	private boolean activo;
	private Date fecha;
	private float monto;	
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "factura", cascade = CascadeType.ALL)
	private Set<LineaFactura> lineasFactura = new HashSet<LineaFactura>(0);
	
	public Factura() {
	}

	public Factura(String id_tipoFactura, int id_Cliente, boolean activo,Date fecha, float monto) {
		this.id_tipoFactura = id_tipoFactura;
		this.id_Cliente = id_Cliente;
		this.activo = activo;
		this.fecha = fecha;
		this.monto = monto;
	}

	public Set<LineaFactura> getLineasFactura() {
		return lineasFactura;
	}

	public void setLineasFactura(Set<LineaFactura> lineasFactura) {
		this.lineasFactura = lineasFactura;
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getId_tipoFactura() {
		return this.id_tipoFactura;
	}

	public void setId_tipoFactura(String id_tipoFactura) {
		this.id_tipoFactura = id_tipoFactura;
	}

	public int getId_Cliente() {
		return this.id_Cliente;
	}

	public void setId_Cliente(int id_Cliente) {
		this.id_Cliente = id_Cliente;
	}

	public boolean isActivo() {
		return this.activo;
	}

	public void setActivo(boolean activo) {
		this.activo = activo;
	}

	public Date getFecha() {
		return this.fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	public float getMonto() {
		return this.monto;
	}

	public void setMonto(float monto) {
		this.monto = monto;
	}

}
