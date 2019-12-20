package org.wikimedia.covenant;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.is;

import org.junit.Test;

public class RecordTest {

	@Test
	public void test() {
		var record = new Record<Integer>();

		record.set("one", 1);
		record.set("two", 2);
		record.set("three", 3);

		assertThat(record.get("one"), is(1));
		assertThat(record.get("two"), is(2));
		assertThat(record.get("three"), is(3));
	}

}
