package PerformanceSeat;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class PerformanceSeatDAO {

		//DBOpen dbopen=new DBOpen()와 동일한 형태
		//@Autowired 스프링컨테이너가 생성해 준 객체를 연결
		@Autowired
		private JdbcTemplate jt;
		
		StringBuilder sql=null;
		
		public PerformanceSeatDAO() {
			System.out.println("-----PerformanceDAO() 객체 생성됨 ");
		} //end
		

		}

		
		
		

