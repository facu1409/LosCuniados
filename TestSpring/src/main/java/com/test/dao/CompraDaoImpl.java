package com.test.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.domain.Compra;
import com.test.domain.LineaCompra;
import com.test.domain.Producto;

@Repository
public class CompraDaoImpl implements CompraDao {

	@Autowired
	SessionFactory sessionFactory;
	
	@Autowired
	ProductoDao productoDao;

	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

	public Compra getCompraById(int id) {
		Compra compra = (Compra) getCurrentSession().get(Compra.class, id);
		return compra;
	}

	public void insertCompra(Compra compra) {
		compra.setActivo(true);		
		List<LineaCompra> compraList = compra.getLineasCompra();
		for (LineaCompra linea : compraList) {
			linea.setCompra(compra);	
			float cantidad = linea.getCantidad();			
			productoDao.updateStockProducto(linea.getIdProducto(),cantidad);
		}
		compra.setLineasCompra(compraList);
		getCurrentSession().save(compra);
	}

	public void updateCompra(Compra compra) {
		Compra compraToUpdate = getCompraById(compra.getId());
		compraToUpdate.setFecha(compra.getFecha());		
		compraToUpdate.setMonto(compra.getMonto());
		compraToUpdate.setIdProveedor(compra.getIdProveedor());
		compraToUpdate.setLineasCompra(compra.getLineasCompra());
		getCurrentSession().update(compraToUpdate);
	}

	public void deleteCompra(int id) {
		Compra compra = getCompraById(id);
		if (compra != null) {
			compra.setActivo(false);
			getCurrentSession().update(compra);
		}
	}

	@SuppressWarnings("unchecked")
	public List<Compra> getList() {
		return getCurrentSession().createQuery("from Compra where activo = 1")
				.list();
	}

}