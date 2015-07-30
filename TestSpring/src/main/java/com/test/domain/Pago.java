package com.test.domain;

// default package
// Generated 30-jul-2015 14:50:51 by Hibernate Tools 3.4.0.CR1

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="pago")
public class Pago  {
	@Id
	@GeneratedValue
	private Integer id;
	private int idCliente;
	private int idTipoDePago;
	private Date fecha;
	private float monto;

	public Pago() {
	}

	public Pago(int idCliente, int idTipoDePago, Date fecha, float monto) {
		this.idCliente = idCliente;
		this.idTipoDePago = idTipoDePago;
		this.fecha = fecha;
		this.monto = monto;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public int getIdCliente() {
		return this.idCliente;
	}

	public void setIdCliente(int idCliente) {
		this.idCliente = idCliente;
	}

	public int getIdTipoDePago() {
		return this.idTipoDePago;
	}

	public void setIdTipoDePago(int idTipoDePago) {
		this.idTipoDePago = idTipoDePago;
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
