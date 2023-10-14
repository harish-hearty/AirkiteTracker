package com.example.AirkiteTracker.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.jetbrains.annotations.TestOnly;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.AirkiteTracker.repository.AirkiteRepository;
import com.example.AirkiteTracker.repository.FlightModel;
import com.example.AirkiteTracker.repository.MapModel;

@Service
public class AirkiteService {
	
	@Autowired
	AirkiteRepository repo;
	@Autowired
	FlightModel[] flights;
	@Autowired
	MapModel[] mapModel;
	
	private JSONObject js;
	private JSONArray response;
	
	
	private String getTime(String timeFormat) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        LocalDateTime dateTime = LocalDateTime.parse(timeFormat, formatter);
        
        String day = dateTime.getDayOfWeek().toString().substring(0, 3);
        String hours = String.valueOf(dateTime.getHour());
        String minutes = String.valueOf(dateTime.getMinute());
        return day+" "+hours+":"+minutes;
	}
	
	public FlightModel[] returnFlightObjects(String... args)  { 
		
		if(args.length == 3)
			js = repo.getFlightSchedules(args[0], args[1]);
		else
			js = repo.getAirportSchedules(args[0], args[1]);
		
		response = js.getJSONArray("response");
		flights = new FlightModel[response.length()];
		
		for (int i=0; i < response.length(); i++) {
		   
			JSONObject flight = response.getJSONObject(i);
			flights[i] = new FlightModel();
			try {
				flights[i].setAirline(flight.getString("airline_iata").toString());
				flights[i].setFlightID(flight.getString("flight_iata"));
				flights[i].setDep(flight.getString("dep_iata"));
				flights[i].setDepTime(getTime(flight.getString("dep_time")));
				flights[i].setArr(flight.getString("arr_iata"));
				flights[i].setArrTime(getTime(flight.getString("arr_time")));
				flights[i].setStatus(flight.getString("status"));
				flights[i].setTerminal(flight.get("dep_terminal").toString());
				flights[i].setDuration(flight.getInt("duration"));
			}
			
			catch(JSONException e) {
				e.printStackTrace();
			}
		}

		return flights;
	}
	
	
	public MapModel[] returnMapModel() {
		
		response = repo.getLiveFlights();
		mapModel = new MapModel[response.length()];
		
		for(int i=0; i<response.length(); i++) {
			
			JSONArray flight = response.getJSONArray(i);
			mapModel[i] = new MapModel();
			
			if(flight.isNull(0)!= true)
				mapModel[i].setFlight_iata(flight.getString(0));
			mapModel[i].setLat(flight.getDouble(1));
			mapModel[i].setLng(flight.getDouble(2));
			mapModel[i].setDir(flight.get(3));
		}
		return mapModel;
	}
	
}
