package model;

import java.util.ArrayList;

public class FavoriteSiteModel {
	private ArrayList<StoreModel> storemodel;

	public FavoriteSiteModel(ArrayList<StoreModel> storemodel) {
		this.storemodel = storemodel;
	}

	public FavoriteSiteModel() {
	}

	public ArrayList<StoreModel> getStoremodel() {
		return storemodel;
	}

	public void setStoremodel(ArrayList<StoreModel> storemodel) {
		this.storemodel = storemodel;
	}
	
}
