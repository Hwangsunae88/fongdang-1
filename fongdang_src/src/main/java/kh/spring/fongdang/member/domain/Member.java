package kh.spring.fongdang.member.domain;

import org.springframework.stereotype.Component;

@Component
public class Member {
	private String email;
	private String password;
	private String name;
	
	@Override
	public String toString() {
		return "Member [email=" + email + ", password=" + password + ", name=" + name + "]";
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
}
