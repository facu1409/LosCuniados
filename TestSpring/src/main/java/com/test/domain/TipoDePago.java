package com.test.domain;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;

public class TipoDePago {

	@Id
	@GeneratedValue
	private Integer id;
	private String nombre;

	public TipoDePago() {
	}

	public TipoDePago(String nombre) {
		this.nombre = nombre;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

}
