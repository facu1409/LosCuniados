package com.test.domain;

// default package
// Generated 30-jul-2015 14:50:51 by Hibernate Tools 3.4.0.CR1

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="factura")
public class Factura{
	@Id
	@GeneratedValue
	private Integer id;
	private int idTipoFactura;
	private int idCliente;
	private boolean activo;
	private Date fecha;
	private float monto;

	public Factura() {
	}

	public Factura(int idTipoFactura, int idCliente, boolean activo,
			Date fecha, float monto) {
		this.idTipoFactura = idTipoFactura;
		this.idCliente = idCliente;
		this.activo = activo;
		this.fecha = fecha;
		this.monto = monto;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public int getIdTipoFactura() {
		return this.idTipoFactura;
	}

	public void setIdTipoFactura(int idTipoFactura) {
		this.idTipoFactura = idTipoFactura;
	}

	public int getIdCliente() {
		return this.idCliente;
	}

	public void setIdCliente(int idCliente) {
		this.idCliente = idCliente;
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