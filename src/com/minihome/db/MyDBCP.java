package com.minihome.db;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MyDBCP {
	private static DataSource ds = null;
	static {//static����� �ʱ�ȭ�Ҷ��� �����ڰ� �ƴ� static����� ����Ѵ�.
		try {
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/myoracle");//���ؽ�Ʈ�� ��ϵ� �̸�(����) �ٲ�� ����.
		}catch(NamingException ne) {
			ne.printStackTrace();
		}
		
	}
	public static Connection getConnection() throws SQLException {
		Connection con = ds.getConnection();
		return con;
	}
}
