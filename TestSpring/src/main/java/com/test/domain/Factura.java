package com.test.domain;

// default package
// Generated 30-jul-2015 14:50:51 by Hibernate Tools 3.4.0.CR1

import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;
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
	private String fecha;
	private float monto;
	private String clienteNombre;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "factura", cascade = CascadeType.ALL)
	private List<LineaFactura> lineasFactura = new ArrayList<LineaFactura>();
	
	public Factura() {
	}

	public Factura(String id_tipoFactura, int id_Cliente, boolean activo,String fecha, float monto, String clienteNombre) {
		this.id_tipoFactura = id_tipoFactura;
		this.id_Cliente = id_Cliente;
		this.clienteNombre = clienteNombre;
		this.activo = activo;
		this.fecha = fecha;
		this.monto = monto;
	}

	public int getId() {
		return this.id;
	}

	public List<LineaFactura> getLineasFactura() {
		return lineasFactura;
	}

	public void setLineasFactura(List<LineaFactura> lineasFactura) {
		this.lineasFactura = lineasFactura;
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

	public String getClienteNombre() {
		return clienteNombre;
	}

	public void setClienteNombre(String clienteNombre) {
		this.clienteNombre = clienteNombre;
	}

}
