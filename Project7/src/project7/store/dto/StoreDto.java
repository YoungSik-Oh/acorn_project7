package project7.store.dto;

public class StoreDto {
	private int snum; // sequence
	private String sname;
	private String saddr;
	private String sphone;
	private String stmenu;
	private String sprice;
	private String stime;
	private String sbtime;
	private String slorder;
	private String srday;
	private String smenu;
	private String udate;

	public StoreDto() {}

	public StoreDto(int snum, String sname, String saddr, String sphone, String stmenu, String sprice, String stime,
			String sbtime, String slorder, String srday, String smenu, String udate) {
		super();
		this.snum = snum;
		this.sname = sname;
		this.saddr = saddr;
		this.sphone = sphone;
		this.stmenu = stmenu;
		this.sprice = sprice;
		this.stime = stime;
		this.sbtime = sbtime;
		this.slorder = slorder;
		this.srday = srday;
		this.smenu = smenu;
		this.udate = udate;
	}

	public int getSnum() {
		return snum;
	}

	public void setSnum(int snum) {
		this.snum = snum;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getSaddr() {
		return saddr;
	}

	public void setSaddr(String saddr) {
		this.saddr = saddr;
	}

	public String getSphone() {
		return sphone;
	}

	public void setSphone(String sphone) {
		this.sphone = sphone;
	}

	public String getStmenu() {
		return stmenu;
	}

	public void setStmenu(String stmenu) {
		this.stmenu = stmenu;
	}

	public String getSprice() {
		return sprice;
	}

	public void setSprice(String sprice) {
		this.sprice = sprice;
	}

	public String getStime() {
		return stime;
	}

	public void setStime(String stime) {
		this.stime = stime;
	}

	public String getSbtime() {
		return sbtime;
	}

	public void setSbtime(String sbtime) {
		this.sbtime = sbtime;
	}

	public String getSlorder() {
		return slorder;
	}

	public void setSlorder(String slorder) {
		this.slorder = slorder;
	}

	public String getSrday() {
		return srday;
	}

	public void setSrday(String srday) {
		this.srday = srday;
	}

	public String getSmenu() {
		return smenu;
	}

	public void setSmenu(String smenu) {
		this.smenu = smenu;
	}

	public String getUdate() {
		return udate;
	}

	public void setUdate(String udate) {
		this.udate = udate;
	}

	
	
}
