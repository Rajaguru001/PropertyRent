package com.chainsys.propertyrentlease.model;

public class PropertyImage {
	 private int imageId;
	    private byte[] image;
	    private int propertyId;
		public int getImageId() {
			return imageId;
		}
		public void setImageId(int imageId) {
			this.imageId = imageId;
		}
		public byte[] getImage() {
			return image;
		}
		public PropertyImage() {
			super();
			this.imageId = imageId;
			this.image = image;
			this.propertyId = propertyId;
		}
		public void setImage(byte[] image) {
			this.image = image;
		}
		public int getPropertyId() {
			return propertyId;
		}
		public void setPropertyId(int propertyId) {
			this.propertyId = propertyId;
		}

}
