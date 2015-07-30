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

	public void insertCliente(Cliente cliente) {
		cliente.setActivo(true);
		getCurrentSession().save(cliente);
	}

	public void updateCliente(Cliente cliente) {
		Cliente clienteToUpdate = getClienteById(cliente.getId());
		clienteToUpdate.setDniCuit(cliente.getDniCuit());
		clienteToUpdate.setNombre(cliente.getNombre());
		clienteToUpdate.setApellido(cliente.getApellido());
		clienteToUpdate.setTelefono(cliente.getTelefono());
		clienteToUpdate.setEmail(cliente.getEmail());
		clienteToUpdate.setDomicilio(cliente.getDomicilio());
		clienteToUpdate.setFechaNacimiento(cliente.getFechaNacimiento());

		getCurrentSession().update(clienteToUpdate);
	}

	public void deleteCliente(int id) {
		Cliente cliente = getClienteById(id);
		if (cliente != null) {
			cliente.setActivo(false);
			getCurrentSession().update(cliente);
		}
	}

	@SuppressWarnings("unchecked")
	public List<Cliente> getList() {
		return getCurrentSession().createQuery("from Cliente where activo = 1")
				.list();
	}

}