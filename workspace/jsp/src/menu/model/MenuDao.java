package menu.model;

import java.sql.*;
import java.util.*;

import board.model.BoardDao;
import board.model.BoardException;
import guest.model.Message;
import guest.model.MessageException;

public class MenuDao {

	// Single Pattern 
	private static MenuDao instance;

	// DB 연결시  관한 변수 
	private static final String 	dbDriver	=	"oracle.jdbc.driver.OracleDriver";
	private static final String		dbUrl		=	"jdbc:oracle:thin:@192.168.0.51:1521:orcl";
	private static final String		dbUser		=	"mine";
	private static final String		dbPass		=	"1234";

	// GOF 패턴
	private Connection	 		con;	


	//--------------------------------------------
	//#####	 객체 생성하는 메소드 
	public static MenuDao getInstance() throws MenuException
	{
		if( instance == null )
		{
			instance = new MenuDao();
		}
		return instance;
	}

	private MenuDao() throws MenuException
	{

		try{

			/********************************************
				1. 오라클 드라이버를 로딩
					( DBCP 연결하면 삭제할 부분 )
			 */
			Class.forName(dbDriver);
		}catch( Exception ex ){
			throw new MenuException("Menu DB 연결시 오류  : " + ex.toString() );	
		}
	}

	/*
	 * 메세지를 입력하는 함수
	 */
	public void insert(MenuRec rec) throws MenuException
	{
		Connection	      con = null;
		PreparedStatement ps = null;
		try{

			// 1. 연결객체(Connection) 얻어오기
			con = DriverManager.getConnection(dbUrl, dbUser ,dbPass);

			// 2. sql 문장 만들기
			String sql = "insert INTO sales (pnum, snum, scount, sdate) values (?, ?, seq_snum_sales.nextval, sysdate)";

			// 3. 전송객체 얻어오기
			ps = con.prepareStatement(sql); // 완성되지않은 SQL문
			ps.setString(1, rec.getPnum());
			ps.setString(2, rec.getSnum());
			


			// 4. sql 전송
			ps.executeUpdate(); 


		}catch( Exception ex ){
			throw new MenuException("DB에 입력시 오류  : " + ex.toString() );	
		} finally{
			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
			if( con  != null ) { try{ con.close(); } catch(SQLException ex){} }
		}

	}






}
