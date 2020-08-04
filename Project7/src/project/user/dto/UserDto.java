package project.user.dto;

public class UserDto {
	private	String userName;
	private String userId;
	private String userPw;
	private String userGender;
	private String userPhone;
	private String userEmail;
	private String userRegdate;
	private String userProfile;
	private int StartRowNum;
	private int EndRowNum;
	private int prevNum;
	private int nextNum;

	public UserDto() {}

	public UserDto(String userName, String userId, String userPw, String userGender, String userPhone, String userEmail,
			String userRegdate, String userProfile, int startRowNum, int endRowNum, int prevNum, int nextNum) {
		super();
		this.userName = userName;
		this.userId = userId;
		this.userPw = userPw;
		this.userGender = userGender;
		this.userPhone = userPhone;
		this.userEmail = userEmail;
		this.userRegdate = userRegdate;
		this.userProfile = userProfile;
		this.StartRowNum = startRowNum;
		this.EndRowNum = endRowNum;
		this.prevNum = prevNum;
		this.nextNum = nextNum;
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

	public String getUserProfile() {
		return userProfile;
	}

	public void setUserProfile(String userProfile) {
		this.userProfile = userProfile;
	}

	public int getStartRowNum() {
		return StartRowNum;
	}

	public void setStartRowNum(int startRowNum) {
		StartRowNum = startRowNum;
	}

	public int getEndRowNum() {
		return EndRowNum;
	}

	public void setEndRowNum(int endRowNum) {
		EndRowNum = endRowNum;
	}

	public int getPrevNum() {
		return prevNum;
	}

	public void setPrevNum(int prevNum) {
		this.prevNum = prevNum;
	}

	public int getNextNum() {
		return nextNum;
	}

	public void setNextNum(int nextNum) {
		this.nextNum = nextNum;
	}

	
}
