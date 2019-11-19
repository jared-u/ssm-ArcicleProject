package cn.jared.mapper;

import cn.jared.pojo.Admin;

public interface AdminMapper {
	Admin login(String name);
	void insert(Admin admin);
	Admin findByName(String a_name);
}
