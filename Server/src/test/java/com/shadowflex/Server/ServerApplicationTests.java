package com.shadowflex.Server;

import com.shadowflex.Server.repository.AdeptRepository;
import com.shadowflex.Server.repository.MatrixRepository;
import com.shadowflex.Server.repository.SpellRepository;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;

@SpringBootTest
class ServerApplicationTests {
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
