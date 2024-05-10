package com.spring.data;

public class Photo {

	private String sangname;
	private String photo;

	// »ý¼ºÀÚ
	public Photo(String sname, String photo) {
		this.sangname = sname;
		this.photo = photo;
	}

	public String getSangname() {
		return sangname;
	}

	public void setSangname(String sangname) {
		this.sangname = sangname;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

}
