package org.wikimedia.covenant;

import java.util.HashMap;
import java.util.Map;

public class Record<T> {
	private Map<String, T> record = new HashMap<String, T>();

	public T get(String column) {
		return this.record.get(column);
	}

	public void set(String column, T value) {
		this.record.put(column, value);
	}
}
