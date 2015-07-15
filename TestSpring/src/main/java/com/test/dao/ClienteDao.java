package com.test.dao;

import java.util.List;

import com.test.domain.Cliente;

public interface ClienteDao {
	
	public void insertCliente(Cliente cliente);
	
	public List<Cliente> getList();

	public Cliente getClienteById(int id);

	public void updateCliente(Cliente cliente);

	public void deleteCliente(int id);


}
