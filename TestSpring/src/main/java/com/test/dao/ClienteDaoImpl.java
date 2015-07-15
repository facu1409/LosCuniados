package com.test.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.domain.Cliente;

@Repository
public class ClienteDaoImpl implements ClienteDao {

	@Autowired
	SessionFactory sessionFactory;

	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}
	
	public Cliente getClienteById(int id) {
		Cliente cliente = (Cliente) getCurrentSession().get(Cliente.class, id);
		return cliente;
	}
	
	public void insertCliente(Cliente Cliente) {
		getCurrentSession().save(Cliente);
	}

	public void updateCliente(Cliente Cliente) {
		Cliente profToUpdate = getClienteById(Cliente.getClienteID());
		profToUpdate.setNombre(Cliente.getNombre());
		profToUpdate.setApellido(Cliente.getApellido());
		profToUpdate.setTelMovil(Cliente.getTelMovil());
		profToUpdate.setEmail(Cliente.getEmail());
		profToUpdate.setDireccionCalle(Cliente.getDireccionCalle());
		profToUpdate.setDireccionDpto(Cliente.getDireccionDpto());
		profToUpdate.setDireccionNro(Cliente.getDireccionNro());
		profToUpdate.setDireccionPiso(Cliente.getDireccionPiso());
		getCurrentSession().update(profToUpdate);		
	}
	
	public void deleteCliente(int id) {
		Cliente cliente = getClienteById(id);
		if (cliente != null)
			getCurrentSession().delete(cliente);
	}


	@SuppressWarnings("unchecked")
	public List<Cliente> getList() {
		return getCurrentSession().createQuery("from Cliente").list();
	}		

}