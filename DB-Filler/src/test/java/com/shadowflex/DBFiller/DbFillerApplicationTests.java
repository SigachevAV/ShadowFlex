package com.shadowflex.DBFiller;

import com.shadowflex.DBFiller.repository.AdeptRepository;
import com.shadowflex.DBFiller.repository.MatrixRepository;
import com.shadowflex.DBFiller.repository.SpellRepository;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;

@SpringBootTest
class DbFillerApplicationTests {
	@MockBean
	private AdeptRepository adeptRepository;
	@MockBean
	private MatrixRepository matrixRepository;
	@MockBean
	private SpellRepository spellRepository;

	@Test
	void contextLoads() {
	}

}
