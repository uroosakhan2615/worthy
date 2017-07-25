package com.worthy.dao;

import java.util.List;

import com.worthy.entity.Hall;
import com.worthy.entity.Marquee;

public interface MarqueeDao {

	List<Marquee> getActiveMarquees();
	List<Marquee> getMarqueesByCity(int cityId);
	List<Hall> getHallByMarquee(int marqueeId);
}
