package com.test.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="lineacompra")
public class LineaCompra {
	@Id
	@GeneratedValue
	private Integer id;
	private int idProducto;
	private int cantidad;
	private float total;

	public LineaCompra() {
	}

	public LineaCompra(int idProducto, int cantidad, float total) {
		this.idProducto = idProducto;
		this.cantidad = cantidad;
		this.total = total;
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

	public float getTotal() {
		return this.total;
	}

	public void setTotal(float total) {
		this.total = total;
	}

}
