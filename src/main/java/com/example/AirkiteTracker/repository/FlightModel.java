package com.example.AirkiteTracker.repository;

import org.springframework.stereotype.Component;

@Component
public class FlightModel {
	
	public String airline = null;
	public String flightID = null;
	public String dep = null;
	public String depTime = null;
	public String arr = null;
	public String arrTime = null;
	public String status = null;
	public String terminal = null;
	public Integer duration = null;
	
	public String getAirline() {
		return airline;
	}
	public void setAirline(String airline) {
		this.airline = airline;
	}
	public String getFlightID() {
		return flightID;
	}
	public void setFlightID(String flightID) {
		this.flightID = flightID;
	}
	public String getDep() {
		return dep;
	}
	public void setDep(String dep) {
		this.dep = dep;
	}
	public String getDepTime() {
		return depTime;
	}
	public void setDepTime(String depTime) {
		this.depTime = depTime;
	}
	public String getArr() {
		return arr;
	}
	public void setArr(String arr) {
		this.arr = arr;
	}
	public String getArrTime() {
		return arrTime;
	}
	public void setArrTime(String arrTime) {
		this.arrTime = arrTime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	public String getTerminal() {
		return terminal;
	}
	public void setTerminal(String terminal) {
		this.terminal = terminal;
	}
	public Integer getDuration() {
		return duration;
	}
	public void setDuration(Integer duration) {
		this.duration = duration;
	}
	@Override
	public String toString() {
		return "FlightModel [airline=" + airline + ", flightID=" + flightID + ", dep=" + dep + ", depTime=" + depTime
				+ ", arr=" + arr + ", arrTime=" + arrTime + ", status=" + status + ", terminal=" + terminal
				+ ", duration=" + duration + "]";
	}
}
