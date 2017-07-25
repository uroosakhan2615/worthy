package com.worthy.dao;

import java.util.List;

import com.worthy.entity.Hall;

public interface HallDao {
	List<Hall> getActiveHalls();
	Hall getActiveHall(int hallId);
}
