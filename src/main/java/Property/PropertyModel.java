package Property;

import java.time.LocalDate;

public class PropertyModel {
	
	private int id;
	private String pName;
	private String location;
	private double price;
	private String description;
	private LocalDate postDate;
	private String ownerName;
	
	public PropertyModel(int id, String pName, String location, double price, String description, LocalDate postDate,
			String ownerName) {
		super();
		this.id = id;
		this.pName = pName;
		this.location = location;
		this.price = price;
		this.description = description;
		this.postDate = postDate;
		this.ownerName = ownerName;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public LocalDate getPostDate() {
		return postDate;
	}

	public void setPostDate(LocalDate postDate) {
		this.postDate = postDate;
	}

	public String getOwnerName() {
		return ownerName;
	}

	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}
}
