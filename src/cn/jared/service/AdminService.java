package cn.jared.service;

import cn.jared.pojo.Admin;

public interface AdminService {
	Admin login(String a_name);
    void insert(Admin admin);
    Admin findByName(String a_name);
}
