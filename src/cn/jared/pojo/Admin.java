package cn.jared.pojo;

import java.io.Serializable;

public class Admin implements Serializable{
	private int id;
	private String a_name;
	private String a_password;
	private String a_telephone;
	private String a_date;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getA_name() {
		return a_name;
	}
	public void setA_name(String a_name) {
		this.a_name = a_name;
	}
	public String getA_password() {
		return a_password;
	}
	public void setA_password(String a_password) {
		this.a_password = a_password;
	}
	public String getA_telephone() {
		return a_telephone;
	}
	public void setA_telephone(String a_telephone) {
		this.a_telephone = a_telephone;
	}
	public String getA_date() {
		return a_date;
	}
	public void setA_date(String a_date) {
		this.a_date = a_date;
	}
	
}
