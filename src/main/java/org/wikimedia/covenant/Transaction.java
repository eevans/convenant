package org.wikimedia.covenant;

public class Transaction {
	public void start() {

	}

	public Record<?> read(Datasource ds, String key) {
		return null;
	}

	public void write(Datasource ds, String key, Record<?> record) {

	}

	public void delete(Datasource ds, String key) {

	}

	public void commit() {

	}

	public void abort() {

	}

	public void recover(String txID) {

	}
}
