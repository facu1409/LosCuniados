package com.test.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.domain.LineaCompra;

@Repository
public class LineaCompraDaoImpl implements LineaCompraDao {

	@Autowired
	SessionFactory sessionFactory;

	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

	public LineaCompra getLineaCompraById(int id) {
		LineaCompra lineaCompra = (LineaCompra) getCurrentSession().get(LineaCompra.class, id);
		return lineaCompra;
	}

	public void insertLineaCompra(LineaCompra lineaCompra) {		
		getCurrentSession().save(lineaCompra);
	}

	public void updateLineaCompra(LineaCompra lineaCompra) {
		LineaCompra lineaCompraToUpdate = getLineaCompraById(lineaCompra.getId());
		lineaCompraToUpdate.setCantidad(lineaCompra.getCantidad());
		lineaCompraToUpdate.setIdProducto(lineaCompra.getIdProducto());	
		getCurrentSession().update(lineaCompraToUpdate);
	}

	public void deleteLineaCompra(int id) {
		LineaCompra lineaCompra = getLineaCompraById(id);
		if (lineaCompra != null) {			
			getCurrentSession().update(lineaCompra);
		}
	}

	@SuppressWarnings("unchecked")
	public List<LineaCompra> getList() {
		return getCurrentSession().createQuery("from LineaCompra")
				.list();
	}

}