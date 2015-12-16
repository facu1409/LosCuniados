package com.test.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.domain.Factura;
import com.test.domain.LineaFactura;

@Repository
public class FacturaDaoImpl implements FacturaDao {

	@Autowired
	SessionFactory sessionFactory;
	
	@Autowired
	ProductoDao productoDao;

	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

	public Factura getFacturaById(int id) {
		Factura factura = (Factura) getCurrentSession().get(Factura.class, id);
		return factura;
	}

	public void insertFactura(Factura factura) {
		factura.setActivo(true);	
		List<LineaFactura> facturaList = factura.getLineasFactura();
		for (LineaFactura linea : facturaList) {
			linea.setFactura(factura);		
			float cantidad = -linea.getCantidad();
			productoDao.updateStockProducto(linea.getId_producto(),cantidad);
		}
		factura.setLineasFactura(facturaList);
		getCurrentSession().save(factura);
	}

	public void updateFactura(Factura factura) {
		Factura facturaToUpdate = getFacturaById(factura.getId());
		facturaToUpdate.setFecha(factura.getFecha());		
		facturaToUpdate.setMonto(factura.getMonto());
		facturaToUpdate.setId_tipoFactura(factura.getId_tipoFactura());
		facturaToUpdate.setId_Cliente(factura.getId_Cliente());
		facturaToUpdate.setLineasFactura(factura.getLineasFactura());
		getCurrentSession().update(facturaToUpdate);
	}

	public void deleteFactura(int id) {
		Factura factura = getFacturaById(id);
		if (factura != null) {
			factura.setActivo(false);
			getCurrentSession().update(factura);
		}
	}

	@SuppressWarnings("unchecked")
	public List<Factura> getList() {
		return getCurrentSession().createQuery("from Factura where activo = 1")
				.list();
	}

}