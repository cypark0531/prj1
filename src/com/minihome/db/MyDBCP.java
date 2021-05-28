package com.minihome.db;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MyDBCP {
	private static DataSource ds = null;
	static {//static멤버를 초기화할때는 생성자가 아닌 static블록을 사용한다.
		try {
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/myoracle");//컨텍스트에 등록된 이름(변수) 바뀔수 있음.
		}catch(NamingException ne) {
			ne.printStackTrace();
		}
		
	}
	public static Connection getConnection() throws SQLException {
		Connection con = ds.getConnection();
		return con;
	}
}
