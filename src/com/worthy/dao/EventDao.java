package com.worthy.dao;

import java.util.List;

import com.worthy.entity.Booking;
import com.worthy.entity.Event;

public interface EventDao {
	public List<Event> getActiveEvents();
}
