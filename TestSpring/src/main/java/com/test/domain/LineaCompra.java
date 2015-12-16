package com.test.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="lineacompra")
public class LineaCompra {
	@Id
	@GeneratedValue
	private Integer id;
	private int id_producto;
	private int cantidad;
	private float total;
	@ManyToOne
	@JoinColumn(name="id_compra")	
	private Compra compra;
	private double precio_unitario;

	public LineaCompra() {
	}

	public LineaCompra(int idProducto, int cantidad, float total, Compra compra) {
		this.id_producto = idProducto;
		this.cantidad = cantidad;
		this.total = total;
		this.compra = compra;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public int getIdProducto() {
		return this.id_producto;
	}

	public void setIdProducto(int idProducto) {
		this.id_producto = idProducto;
	}

	public int getCantidad() {
		return this.cantidad;
	}

	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}
	
	public Compra getCompra() {
		return compra;
	}

	public void setCompra(Compra compra) {
		this.compra = compra;
	}

	public float getTotal() {
		return this.total;
	}

	public void setTotal(float total) {
		this.total = total;
	}

	public void setPrecio_unitario(double precioUnitario) {
		this.precio_unitario = precioUnitario;
	}

	public double getPrecio_unitario() {
		return precio_unitario;
	}

}
