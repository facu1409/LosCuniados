package com.test.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.domain.Proveedor;

@Repository
public abstract class ProveedorDaoImpl implements ProveedorDao {

	@Autowired
	SessionFactory sessionFactory;

	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}
	
	public Proveedor getProveedorById(int id) {
		Proveedor proveedor = (Proveedor) getCurrentSession().get(Proveedor.class, id);
		return proveedor;
	}
	
	public void insertProveedor(Proveedor proveedor) {
		//proveedor.setActivo(true);
		getCurrentSession().save(proveedor);
	}

	public void updateProveedor(Proveedor proveedor) {
		Proveedor proveedorToUpdate = getProveedorById(proveedor.getId());
		proveedorToUpdate.setCuit(proveedor.getCuit());
		proveedorToUpdate.setNombre(proveedor.getNombre());
		proveedorToUpdate.setApellido(proveedor.getApellido());
		proveedorToUpdate.setTelefono(proveedor.getTelefono());
		proveedorToUpdate.setMail(proveedor.getMail());;
		
		getCurrentSession().update(proveedorToUpdate);		
	}
	
	public void deleteProveedor(int id) {
		Proveedor proveedor = getProveedorById(id);
		if (proveedor != null)
			getCurrentSession().delete(proveedor);
	}


	@SuppressWarnings("unchecked")
	public List<Proveedor> getList() {
		return getCurrentSession().createQuery("from Proveedor").list();
	}		

}