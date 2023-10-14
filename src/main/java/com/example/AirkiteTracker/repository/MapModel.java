package com.example.AirkiteTracker.repository;

import org.springframework.stereotype.Component;

@Component
public class MapModel {
	
	private String flight_iata = null;
	private Double lat = null; 
	private Double lng = null;
	private Object dir = null;
	
	public String getFlight_iata() {
		return flight_iata;
	}
	public void setFlight_iata(String flight_iata) {
		this.flight_iata = flight_iata;
	}
	public Double getLat() {
		return lat;
	}
	public void setLat(Double lat) {
		this.lat = lat;
	}
	public Double getLng() {
		return lng;
	}
	public void setLng(Double lng) {
		this.lng = lng;
	}
	public Object getDir() {
		return dir;
	}
	public void setDir(Object dir) {
		this.dir = dir;
	}
	
	@Override
	public String toString() {
		return "MapModel [flight_iata=" + flight_iata + ", lat=" + lat + ", lng=" + lng + ", dir=" + dir + "]";
	}
	
		
}
