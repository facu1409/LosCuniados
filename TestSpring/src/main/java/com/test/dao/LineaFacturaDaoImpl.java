package com.test.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.domain.LineaFactura;

@Repository
public class LineaFacturaDaoImpl implements LineaFacturaDao {

	@Autowired
	SessionFactory sessionFactory;

	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

	public LineaFactura getLineaFacturaById(int id) {
		LineaFactura lineaFactura = (LineaFactura) getCurrentSession().get(LineaFactura.class, id);
		return lineaFactura;
	}

	public void insertLineaFactura(LineaFactura lineaFactura) {		
		getCurrentSession().save(lineaFactura);
	}

	public void updateLineaFactura(LineaFactura lineaFactura) {
		LineaFactura lineaFacturaToUpdate = getLineaFacturaById(lineaFactura.getId());
		lineaFacturaToUpdate.setCantidad(lineaFactura.getCantidad());
		lineaFacturaToUpdate.setIdProducto(lineaFactura.getIdProducto());
		lineaFacturaToUpdate.setPrecioUnitario(lineaFactura.getPrecioUnitario());		
		getCurrentSession().update(lineaFacturaToUpdate);
	}

	public void deleteLineaFactura(int id) {
		LineaFactura lineaFactura = getLineaFacturaById(id);
		if (lineaFactura != null) {			
			getCurrentSession().update(lineaFactura);
		}
	}

	@SuppressWarnings("unchecked")
	public List<LineaFactura> getList() {
		return getCurrentSession().createQuery("from LineaFactura")
				.list();
	}

}