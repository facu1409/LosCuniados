package com.test.domain;

import javax.persistence.AssociationOverride;
import javax.persistence.AssociationOverrides;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "productoproveedor")
@AssociationOverrides({
		@AssociationOverride(name = "pk.proveedor", 
			joinColumns = @JoinColumn(name = "id_proveedor")),
		@AssociationOverride(name = "pk.producto", 
			joinColumns = @JoinColumn(name = "id_producto")) })
public class ProductoProveedor implements java.io.Serializable {
 
	/**
	 * 
	 */
	//private static final long serialVersionUID = 1L;
	private ProductoProveedorId pk = new ProductoProveedorId();	
	private double precio;
	
	public ProductoProveedor() {
	}
 
	@EmbeddedId
	public ProductoProveedorId getPk() {
		return pk;
	}
 
	public void setPk(ProductoProveedorId pk) {
		this.pk = pk;
	}
 
	@Transient
	public Producto getProducto() {
		return getPk().getProducto();
	}
 
	public void setProducto(Producto producto) {
		getPk().setProducto(producto);
	}
 
	@Transient
	public Proveedor getProveedor() {
		return getPk().getProveedor();
	}
 
	public void setProveedor(Proveedor proveedor) {
		getPk().setProveedor(proveedor);
	}
 	
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;
 
		ProductoProveedor that = (ProductoProveedor) o;
 
		if (getPk() != null ? !getPk().equals(that.getPk())
				: that.getPk() != null)
			return false;
 
		return true;
	}
 
	public int hashCode() {
		return (getPk() != null ? getPk().hashCode() : 0);
	}

	public double getPrecio() {
		return precio;
	}

	public void setPrecio(double precio) {
		this.precio = precio;
	}
}
