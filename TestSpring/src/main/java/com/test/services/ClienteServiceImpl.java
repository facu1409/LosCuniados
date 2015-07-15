package com.test.services;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.test.dao.ClienteDao;
import com.test.domain.Cliente;;

@Service
@Transactional
public class ClienteServiceImpl implements ClienteService {
	
	@Autowired
	private ClienteDao clienteDao;

	
	public void insertCliente(Cliente cliente) {
		clienteDao.insertCliente(cliente);
	}
	
	public List<Cliente> getList() {
		return clienteDao.getList();
	}
	
	public Cliente getClienteById(int id) {
		return clienteDao.getClienteById(id);
	}
	
	public void updateCliente(Cliente cliente) {
		clienteDao.updateCliente(cliente);
	}
	
	public void deleteCliente(int id) {
		clienteDao.deleteCliente(id);
	}

}

