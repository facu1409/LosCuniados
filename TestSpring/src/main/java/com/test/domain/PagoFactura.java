package com.test.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="pagofactura")
public class PagoFactura {
	@Id
	@GeneratedValue
	private Integer id;
	private int idPago;
	private int idFactura;

	public PagoFactura() {
	}

	public PagoFactura(int idPago, int idFactura) {
		this.idPago = idPago;
		this.idFactura = idFactura;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public int getIdPago() {
		return this.idPago;
	}

	public void setIdPago(int idPago) {
		this.idPago = idPago;
	}

	public int getIdFactura() {
		return this.idFactura;
	}

	public void setIdFactura(int idFactura) {
		this.idFactura = idFactura;
	}

}
