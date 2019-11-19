package cn.jared.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.jared.mapper.AdminMapper;
import cn.jared.pojo.Admin;
import cn.jared.service.AdminService;
@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminMapper adminmapper;
	@Override
	public Admin login(String a_name) {
		return adminmapper.login(a_name);
	}

	@Override
	public void insert(Admin admin) {
		adminmapper.insert(admin);
	}

	@Override
	public Admin findByName(String a_name) {
		
		
		return adminmapper.findByName(a_name);
	}

}
