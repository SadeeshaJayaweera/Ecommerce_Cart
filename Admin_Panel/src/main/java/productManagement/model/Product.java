package productManagement.model;

/**
 * Product.java This is a model class represents a Product entity
 */
public class Product {
	protected int id;
	protected String name;
	protected String image_link;
	protected int price;
	protected String category;

	public Product() {
	}

	public Product(String name, String image_link, int price, String category) {
		this.name = name;
		this.image_link = image_link;
		this.price = price;
		this.category = category;
	}

	public Product(int id, String name, String image_link, int price, String category) {
		this.id = id;
		this.name = name;
		this.image_link = image_link;
		this.price = price;
		this.category = category;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImageLink() {
		return image_link;
	}

	public void setImageLink(String image_link) {
		this.image_link = image_link;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
}
