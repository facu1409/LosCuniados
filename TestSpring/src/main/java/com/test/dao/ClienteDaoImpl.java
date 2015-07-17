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
		Cliente clienteToUpdate = getClienteById(Cliente.getId());
		clienteToUpdate.setNombre(Cliente.getNombre());
		clienteToUpdate.setApellido(Cliente.getApellido());
		clienteToUpdate.setTelMovil(Cliente.getTelMovil());
		clienteToUpdate.setEmail(Cliente.getEmail());
		clienteToUpdate.setDireccion(Cliente.getDireccion());		
		getCurrentSession().update(clienteToUpdate);		
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