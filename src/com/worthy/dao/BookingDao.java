package com.worthy.dao;

import java.util.List;

import com.worthy.entity.Booking;
import com.worthy.entity.Event;

public interface BookingDao {
	public List<Booking> getBookingsByUserId(int userId);
	
}
