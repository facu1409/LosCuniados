package com.test.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.domain.Producto;

@Repository
public class ProductoDaoImpl implements ProductoDao {

	@Autowired
	SessionFactory sessionFactory;

	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

	public Producto getProductoById(int id) {
		Producto producto = (Producto) getCurrentSession().get(Producto.class,
				id);
		return producto;
	}

	public void insertProducto(Producto producto) {
		producto.setActivo(true);
		getCurrentSession().save(producto);
	}

	public void updateProducto(Producto producto) {
		Producto ProductoToUpdate = getProductoById(producto.getId());
		ProductoToUpdate.setNombre(producto.getNombre());
		ProductoToUpdate.setDetalle(producto.getDetalle());
		ProductoToUpdate.setStock(producto.getStock());
		getCurrentSession().update(ProductoToUpdate);
	}

	public void deleteProducto(int id) {
		Producto producto = getProductoById(id);
		if (producto != null) {
			producto.setActivo(false);
			getCurrentSession().update(producto);
		}
	}

	@SuppressWarnings("unchecked")
	public List<Producto> getList() {
		return getCurrentSession()
				.createQuery("from Producto where activo = 1").list();
	}

	@SuppressWarnings("unchecked")
	public List<Producto> getListStock() {
		return getCurrentSession()
				.createQuery("from Producto where activo = 1 and stock > 0").list();
	}


	public void updateStockProducto(int idProducto, float cantidad) {
		// TODO Auto-generated method stub
		Producto ProductoToUpdate = getProductoById(idProducto);
		float stock = ProductoToUpdate.getStock() + cantidad;
		ProductoToUpdate.setStock((int)stock);
		getCurrentSession().update(ProductoToUpdate);
	}

}