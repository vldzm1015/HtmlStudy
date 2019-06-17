package info.beans;

public class InfoBean {
	private String id;
	private String name;
	

	public InfoBean() {
		
	}
	
	public InfoBean(String id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		String sex ="";
		char sexNum= id.charAt(7);
		if(sexNum==1) return "남자";
		else return "여자";
	}
}
