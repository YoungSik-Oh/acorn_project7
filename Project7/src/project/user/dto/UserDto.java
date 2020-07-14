package project.user.dto;

public class UserDto {
	private	String userName;
	private String userId;
	private String userPw;
	private String userGender;
	private String userPhone;
	private String userEmail;
	private String userRegdate;
	
	public UserDto() {}

	public UserDto(String userName, String userId, String userPw, String userGender, String userPhone, String userEmail,
			String userRegdate) {
		super();
		this.userName = userName;
		this.userId = userId;
		this.userPw = userPw;
		this.userGender = userGender;
		this.userPhone = userPhone;
		this.userEmail = userEmail;
		this.userRegdate = userRegdate;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getUserGender() {
		return userGender;
	}

	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserRegdate() {
		return userRegdate;
	}

	public void setUserRegdate(String userRegdate) {
		this.userRegdate = userRegdate;
	}
	
}
