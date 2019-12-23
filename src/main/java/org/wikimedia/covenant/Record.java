package org.wikimedia.covenant;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

public class Record<T> {
	// TABLE I: Record structure
	Date startTime;
	Date endTime;
	Date leaseTime;
	UUID txID;
	byte state;
	Date updateTime;
	int version;
	int previousVersion;

	private Map<String, T> record = new HashMap<String, T>();

	public T get(String column) {
		return this.record.get(column);
	}

	public void set(String column, T value) {
		this.record.put(column, value);
	}
}
