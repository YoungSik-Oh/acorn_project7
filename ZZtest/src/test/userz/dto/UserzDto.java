package test.userz.dto;

public class UserzDto {
	private String name;
	private String id;
	private String pwd;
	private String sex;
	private String phone;
	private String email;
	private String regdate;
	
	//디폴트 생성자
	public UserzDto() {}

	public UserzDto(String name, String id, String pwd, String sex, String phone, String email, String regdate) {
		super();
		this.name = name;
		this.id = id;
		this.pwd = pwd;
		this.sex = sex;
		this.phone = phone;
		this.email = email;
		this.regdate = regdate;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
}
