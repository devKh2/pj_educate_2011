package model;

public class PostRequest {

	private String searchDong;

	public String getSearchDong() {
		return searchDong;
	}

	public void setSearchDong(String searchDong) {
		this.searchDong = searchDong;
	}

	@Override
	public String toString() {
		return "PostRequest [searchDong=" + searchDong + "]";
	}
	
}
