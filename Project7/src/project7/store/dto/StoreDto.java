package project7.store.dto;

public class StoreDto {
	private	String name;
	private String addr;
	private String phone;
	private String smenu;
	private String sprice;
	private String time;
	private String rtime;
	private String lorder;
	private String rday;
	private String udate;
	private String mmenu;
	private String mprice;
	
	public StoreDto() {}

	public StoreDto(String name, String addr, String phone, String smenu, String sprice, String time, String rtime,
			String lorder, String rday, String udate) {
		super();
		this.name = name;
		this.addr = addr;
		this.phone = phone;
		this.smenu = smenu;
		this.sprice = sprice;
		this.time = time;
		this.rtime = rtime;
		this.lorder = lorder;
		this.rday = rday;
		this.udate = udate;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getSmenu() {
		return smenu;
	}

	public void setSmenu(String smenu) {
		this.smenu = smenu;
	}

	public String getSprice() {
		return sprice;
	}

	public void setSprice(String sprice) {
		this.sprice = sprice;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getRtime() {
		return rtime;
	}

	public void setRtime(String rtime) {
		this.rtime = rtime;
	}

	public String getLorder() {
		return lorder;
	}

	public void setLorder(String lorder) {
		this.lorder = lorder;
	}

	public String getRday() {
		return rday;
	}

	public void setRday(String rday) {
		this.rday = rday;
	}

	public String getUdate() {
		return udate;
	}

	public void setUdate(String udate) {
		this.udate = udate;
	}
}
