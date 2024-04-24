package com.xadmin.usermanagement.bean;

public class User {
	
		protected int id;
		protected String name;
		protected String email;
		
		
		
		public User(String name, String email) {
			super();
			this.name = name;
			this.email = email;
			
		}

		public User(int id, String name, String email) {
			super();
			this.id = id;
			this.name = name;
			this.email = email;
			
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
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		
		
	}




