package com.test.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="lineafactura")
public class LineaFactura {
	@Id
	@GeneratedValue
	private Integer id;
	private int idProducto;
	private int cantidad;
	private double total;
	private double precioUnitario;
	@ManyToOne
	@JoinColumn(name="id_factura")	
	private Factura factura;

	public LineaFactura() {
	}

	public LineaFactura(int idProducto, int cantidad, double total,double precioUnitario, Factura factura) {
		this.idProducto = idProducto;
		this.cantidad = cantidad;
		this.total = total;
		this.precioUnitario = precioUnitario;
		this.setFactura(factura);
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public int getIdProducto() {
		return this.idProducto;
	}

	public void setIdProducto(int idProducto) {
		this.idProducto = idProducto;
	}

	public int getCantidad() {
		return this.cantidad;
	}

	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}

	public double getTotal() {
		return this.total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public double getPrecioUnitario() {
		return precioUnitario;
	}

	public void setPrecioUnitario(double precioUnitario) {
		this.precioUnitario = precioUnitario;
	}

	public Factura getFactura() {
		return factura;
	}

	public void setFactura(Factura factura) {
		this.factura = factura;
	}

}
