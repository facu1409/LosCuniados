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
	private int id_producto;
	private int cantidad;
	private double total;
	private double precio_unitario;
	@ManyToOne
	@JoinColumn(name="id_factura")	
	private Factura factura;

	public LineaFactura() {
	}

	public LineaFactura(int idProducto, int cantidad, double total,double precioUnitario, Factura factura) {
		this.id_producto = idProducto;
		this.cantidad = cantidad;
		this.total = total;
		this.precio_unitario = precioUnitario;
		this.setFactura(factura);
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
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

	public double getPrecio_unitario() {
		return precio_unitario;
	}

	public void setPrecio_unitario(double precioUnitario) {
		this.precio_unitario = precioUnitario;
	}

	public Factura getFactura() {
		return factura;
	}

	public void setFactura(Factura factura) {
		this.factura = factura;
	}

	public int getId_producto() {
		return id_producto;
	}

	public void setId_producto(int id_producto) {
		this.id_producto = id_producto;
	}

}
