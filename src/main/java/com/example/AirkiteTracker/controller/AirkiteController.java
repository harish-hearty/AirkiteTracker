package com.example.AirkiteTracker.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.AirkiteTracker.repository.AirkiteRepository;
import com.example.AirkiteTracker.service.AirkiteService;

@Controller
public class AirkiteController {
	
	@Autowired
	AirkiteRepository repo;
	@Autowired
	AirkiteService service;
	
	@RequestMapping("/")
	public ModelAndView home() {
		ModelAndView mv = new ModelAndView("home");
		return mv;
	}
	
	@RequestMapping("/flightSchedules")
	public ModelAndView flightSchedule(String origin,String destination) {

		ModelAndView mv = new ModelAndView("flightSchedules");
		if(origin == null && destination == null)
			return mv;
		else {
			mv.addObject("flights",service.returnFlightObjects(origin, destination,"flights"));
			return mv;
		}
	}
	
	@RequestMapping("/airportSchedules")
	public ModelAndView airportSchedule(String airport) {
		
		ModelAndView mv = new ModelAndView("airportSchedules");
		if(airport == null)
			return mv;
		else {
			mv.addObject("depFlights",service.returnFlightObjects(airport,"dep"));
			mv.addObject("arrFlights",service.returnFlightObjects(airport,"arr"));
		return mv;
		}
	}
	
	@RequestMapping("/map")
	public ModelAndView homeMap() {
		
		ModelAndView mv = new ModelAndView("homeMap");
		mv.addObject("flights",service.returnMapModel());

		return mv;
	}
	
	@RequestMapping("/about")
	public ModelAndView about() {
		
		ModelAndView mv = new ModelAndView("about");
		
		return mv;
	}
}
