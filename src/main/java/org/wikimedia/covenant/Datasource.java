package org.wikimedia.covenant;

public interface Datasource {
	public void start();
	public Record<?> read(String key);
	public void write(String key, Record<?> record);
	public void prev(String key, Record<?> record);
	public void delete(String key);
	public void prepare(String key, Record<?> record);
	public void commit(String key, Record<?> record);
	public void abort(String key, Record<?> record);
	public void recover(String key);
}
