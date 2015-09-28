package com.test.domain;

import javax.persistence.Embeddable;
import javax.persistence.ManyToOne;

@Embeddable
public class ProductoProveedorId implements java.io.Serializable {
	
	private Producto producto;
	private Proveedor proveedor;

	@ManyToOne
	public Producto getProducto() {
		return producto;
	}

	public void setProducto(Producto producto) {
		this.producto = producto;
	}

	@ManyToOne
	public Proveedor getProveedor() {
		return proveedor;
	}

	public void setProveedor(Proveedor proveedor) {
		this.proveedor = proveedor;
	}

	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;

		ProductoProveedorId that = (ProductoProveedorId) o;

		if (producto != null ? !producto.equals(that.producto)
				: that.producto != null)
			return false;
		if (proveedor != null ? !proveedor.equals(that.proveedor)
				: that.proveedor != null)
			return false;

		return true;
	}

	public int hashCode() {
		int result;
		result = (producto != null ? producto.hashCode() : 0);
		result = 31 * result + (proveedor != null ? proveedor.hashCode() : 0);
		return result;
	}

}
