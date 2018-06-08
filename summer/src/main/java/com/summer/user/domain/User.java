package com.summer.user.domain;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import com.summer.comm.DTO;

public class User extends DTO {
	@Size(min = 6, max = 12, message = "아이디는 6글자 이상 12글자 이하입니다.")
	@NotEmpty(message = "아이디를 입력하세요.")
	private String id;
	@NotEmpty(message = "비밀번호를 입력하세요.")
	@Pattern(regexp = "((?=.*\\d)(?=.*[a-z])(?=.*[@#$%]).{8,})", message = "비밀 번호는 8자리 이상, 숫자와 특수 문자가 포함되게 입력해 주세요")
	private String pwd;
	@NotEmpty(message = "이름을 입력하세요.")
	private String name;
	@NotEmpty(message = "별명을 입력하세요.")
	private String nickname;
	@NotEmpty(message = "성별을 선택하세요.")
	private String gender;
	@NotEmpty(message = "생년월일을 입력하세요.")
	private int 	 birth;
	@NotEmpty(message = "이메일을 입력하세요.")
	private String email;
	@NotEmpty(message = "연락처를 입력하세요.")
	private String phone;
	private int 	 grade;
	private String regdt;
	
	
	public User() {
		
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getPwd() {
		return pwd;
	}


	public void setPwd(String pwd) {
		this.pwd = pwd;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public int getBirth() {
		return birth;
	}


	public void setBirth(int birth) {
		this.birth = birth;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public int getGrade() {
		return grade;
	}


	public void setGrade(int grade) {
		this.grade = grade;
	}


	public String getRegdt() {
		return regdt;
	}


	public void setRegdt(String regdt) {
		this.regdt = regdt;
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + birth;
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((gender == null) ? 0 : gender.hashCode());
		result = prime * result + grade;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((nickname == null) ? 0 : nickname.hashCode());
		result = prime * result + ((phone == null) ? 0 : phone.hashCode());
		result = prime * result + ((pwd == null) ? 0 : pwd.hashCode());
		result = prime * result + ((regdt == null) ? 0 : regdt.hashCode());
		return result;
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		User other = (User) obj;
		if (birth != other.birth)
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (gender == null) {
			if (other.gender != null)
				return false;
		} else if (!gender.equals(other.gender))
			return false;
		if (grade != other.grade)
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (nickname == null) {
			if (other.nickname != null)
				return false;
		} else if (!nickname.equals(other.nickname))
			return false;
		if (phone == null) {
			if (other.phone != null)
				return false;
		} else if (!phone.equals(other.phone))
			return false;
		if (pwd == null) {
			if (other.pwd != null)
				return false;
		} else if (!pwd.equals(other.pwd))
			return false;
		if (regdt == null) {
			if (other.regdt != null)
				return false;
		} else if (!regdt.equals(other.regdt))
			return false;
		return true;
	}


	public User(String id, String pwd, String name, String nickname, String gender, int birth, String email,
			String phone, int grade, String regdt) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.nickname = nickname;
		this.gender = gender;
		this.birth = birth;
		this.email = email;
		this.phone = phone;
		this.grade = grade;
		this.regdt = regdt;
	}


	@Override
	public String toString() {
		return "User [id=" + id + ", pwd=" + pwd + ", name=" + name + ", nickname=" + nickname + ", gender=" + gender
				+ ", birth=" + birth + ", email=" + email + ", phone=" + phone + ", grade=" + grade + ", regdt=" + regdt
				+ "]";
	}

	
	
}