package mybaties.board.model;


import java.sql.*;
import java.util.*;

import mybaties.board.model.BoardDao;
import mybaties.board.model.BoardException;
import mybaties.board.model.BoardRec;



public class BoardDao

{

	

	// Single Pattern 

	private static BoardDao instance;

	

	// DB 연결시  관한 변수 

	private static final String 	dbDriver	=	"oracle.jdbc.driver.OracleDriver";

	private static final String		dbUrl		=	"jdbc:oracle:thin:@192.168.0.51:1521:orcl";

	private static final String		dbUser		=	"mine";

	private static final String		dbPass		=	"1234";

	

	

	private Connection	 		con;	

	

	//--------------------------------------------

	//#####	 객체 생성하는 메소드 

	public static BoardDao	getInstance() throws BoardException

	{

		if( instance == null )

		{

			instance = new BoardDao();

		}

		return instance;

	}

	

	private BoardDao() throws BoardException

	{

	

		try{

			

			/********************************************

				1. 오라클 드라이버를 로딩

					( DBCP 연결하면 삭제할 부분 )

			*/

			Class.forName( dbDriver );	

		}catch( Exception ex ){

			throw new BoardException("DB 연결시 오류  : " + ex.toString() );	

		}

		

	}

	

	

	//--------------------------------------------

	//#####	 게시글 입력전에 그 글의 그룹번호를 얻어온다

	public int getGroupId() throws BoardException

	{

		PreparedStatement ps = null;

		ResultSet rs = null;

		int groupId=1;

		try{

			//1.연결객체 얻어오기

			con=DriverManager.getConnection(dbUrl, dbUser ,dbPass);

			//2.sql문장만들기 

				String sql = "select seq_group_id_article.nextval as group_id from dual";

			//3.전송객체 얻어오기

				ps = con.prepareStatement(sql);

			//4.전송

				rs = ps.executeQuery();

			//5.결과집합 받아 결과를 groupId변수 저장.	

				while(rs.next()) {

					groupId = rs.getInt("group_id");

				}

			return groupId;

		}catch( Exception ex ){

			throw new BoardException("게시판 ) 게시글 입력 전에 그룹번호 얻어올 때  : " + ex.toString() );	

		} finally{

			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }

			if( con  != null ) { try{ con.close(); } catch(SQLException ex){} }

		}		

	}



	//--------------------------------------------

	//#####	 게시판에 글을 입력시 DB에 저장하는 메소드 

	public int insert( BoardRec rec ) throws BoardException

	{

		

		/************************************************

		*/

		ResultSet rs = null;

		Statement stmt	= null;

		PreparedStatement ps = null;

		try{

			//연결객체얻어오기

			con = DriverManager.getConnection(dbUrl, dbUser ,dbPass);

			//sql문장

			String sql = "insert INTO article (article_id, group_id, sequence_no, posting_date,"

					+ "  read_count,writer_name,password,title,content) "

					+ "  values (seq_article_id_article.nextval,?,?,sysdate,0,?,?,?,?)";

			//전송객체 얻어오기

			ps = con.prepareStatement(sql);		

			ps.setInt(1,rec.getGroupId());

			ps.setString(2,rec.getSequenceNo());

			ps.setString(3,rec.getWriterName());

			ps.setString(4,rec.getPassword());

			ps.setString(5,rec.getTitle());

			ps.setString(6,rec.getContent());

			//전송

			int result = ps.executeUpdate();

			if(result>0) {

				stmt=con.createStatement();

				rs = stmt.executeQuery("select seq_article_id_article.currval from dual");

				if(rs.next()) {

					return rs.getInt(1); // 첫번째 컬럼을 가져와라.

				}

			}

			return -1;

		

		}catch( Exception ex ){

			throw new BoardException("게시판 ) DB에 입력시 오류  : " + ex.toString() );	

		} finally{

			if( rs   != null ) { try{ rs.close();  } catch(SQLException ex){} }

			if( stmt != null ) { try{ stmt.close(); } catch(SQLException ex){} }

			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }

			if( con  != null ) { try{ con.close(); } catch(SQLException ex){} }

		}

		

	}



	//--------------------------------------------

	//#####	 전체 레코드를 검색하는 함수

	// 리스트에 보여줄거나 필요한 컬럼 : 게시글번호, 그룹번호, 순서번호, 게시글등록일시, 조회수, 작성자이름,  제목

	//							( 내용, 비밀번호  제외 )

	// 순서번호(sequence_no)로 역순정렬

	public List<BoardRec> selectList() throws BoardException

	{

		PreparedStatement ps = null;

		ResultSet rs = null;

		List<BoardRec> mList = new ArrayList<BoardRec>();

		boolean isEmpty = true;

		

		try{

			con=DriverManager.getConnection(dbUrl, dbUser, dbPass);

			



			String sql = "select article_id,group_id, sequence_no, posting_date,"

					+ "  read_count,writer_name,title from article order by sequence_no desc";

			ps = con.prepareStatement(sql);

			rs=ps.executeQuery();

			while(rs.next()) {

				

				BoardRec rec = new BoardRec();

				rec.setArticleId(rs.getInt("article_id"));

				rec.setGroupId(rs.getInt("group_id"));

				rec.setSequenceNo(rs.getString("sequence_no"));

				rec.setTitle(rs.getString("title"));

				rec.setWriterName(rs.getString("writer_name"));

				rec.setPostingDate(rs.getString("posting_date"));

				rec.setReadCount(rs.getInt("read_count"));

				

				mList.add(rec);

				isEmpty = false;

			}

			

			if( isEmpty ) return Collections.emptyList();

			

			return mList;

		}catch( Exception ex ){

			throw new BoardException("게시판 ) DB에 목록 검색시 오류  : " + ex.toString() );	

		} finally{

			if( rs   != null ) { try{ rs.close();  } catch(SQLException ex){} }

			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }

			if( con  != null ) { try{ con.close(); } catch(SQLException ex){} }

		}		

	}

	

	public List<BoardRec> selectList(int startRow, int endRow) throws BoardException

	{

		PreparedStatement ps = null;

		ResultSet rs = null;

		List<BoardRec> mList = new ArrayList<BoardRec>();

		boolean isEmpty = true;

		

		try{

			con=DriverManager.getConnection(dbUrl, dbUser, dbPass);

			



			String sql = "select A.article_id,A.group_id, A.sequence_no, A.posting_date,"

					+ "  A.read_count,A.writer_name,A.title from "

					+ " (SELECT ROW_NUMBER() OVER(ORDER BY article_id DESC) AS RNUM, article_id,group_id, sequence_no, "

					+ "  posting_date,read_count,writer_name,title FROM article c_article) A where A.rnum BETWEEN ? AND ?";

			System.out.println(sql);

			ps = con.prepareStatement(sql);

			

			ps.setInt(1, startRow);

			ps.setInt(2, endRow);

			rs=ps.executeQuery();

			

			while(rs.next()) {

				

				BoardRec rec = new BoardRec();

				rec.setArticleId(rs.getInt("article_id"));

				rec.setGroupId(rs.getInt("group_id"));

				rec.setSequenceNo(rs.getString("sequence_no"));

				rec.setTitle(rs.getString("title"));

				rec.setWriterName(rs.getString("writer_name"));

				rec.setPostingDate(rs.getString("posting_date"));

				rec.setReadCount(rs.getInt("read_count"));

				

				mList.add(rec);

				isEmpty = false;

			}

			

			if( isEmpty ) return Collections.emptyList();

			

			return mList;

		}catch( Exception ex ){

			throw new BoardException("게시판 ) DB에 목록 검색시 오류  : " + ex.toString() );	

		} finally{

			if( rs   != null ) { try{ rs.close();  } catch(SQLException ex){} }

			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }

			if( con  != null ) { try{ con.close(); } catch(SQLException ex){} }

		}		

	}

	

	//--------------------------------------------

	//#####	 게시글번호에 의한 레코드 검색하는 함수

	public BoardRec selectById(int id) throws BoardException

	{

		PreparedStatement ps = null;

		ResultSet rs = null;

		

		BoardRec rec = new BoardRec();

		

		try{

			//1.연결객체 얻어오기

			con=DriverManager.getConnection(dbUrl, dbUser ,dbPass);

			//2.sql

			String sql = "Select * from article where article_id=?";

			//3.전송객체 얻어오기

			ps = con.prepareStatement(sql);

			ps.setInt(1, id);

			//4.전송

			rs = ps.executeQuery();

			//5.결과

			if(rs.next()) {

				rec.setArticleId(rs.getInt("article_id"));

				rec.setGroupId(rs.getInt("group_id"));

				rec.setSequenceNo(rs.getString("sequence_no"));

				rec.setPostingDate(rs.getString("posting_date"));

				rec.setReadCount(rs.getInt("read_count"));

				rec.setWriterName(rs.getString("writer_name"));

				rec.setPassword(rs.getString("password"));

				rec.setTitle(rs.getString("title"));

				rec.setContent(rs.getString("content"));

			

			}

			return rec;

		}catch( Exception ex ){

			throw new BoardException("게시판 ) DB에 글번호에 의한 레코드 검색시 오류  : " + ex.toString() );	

		} finally{

			if( rs   != null ) { try{ rs.close();  } catch(SQLException ex){} }

			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }

			if( con  != null ) { try{ con.close(); } catch(SQLException ex){} }

		}		

	}



	//--------------------------------------------

	//#####	 게시글 보여줄 때 조회수 1 증가

	public void increaseReadCount( int article_id ) throws BoardException

	{



		PreparedStatement ps = null;

		try{

			con=DriverManager.getConnection(dbUrl, dbUser ,dbPass);

			String sql = "update article set read_count = read_count+1 where article_id=?";

			ps = con.prepareStatement(sql);

			ps.setInt(1, article_id);

			

			ps.executeUpdate();

		

		}catch( Exception ex ){

			throw new BoardException("게시판 ) 게시글 볼 때 조회수 증가시 오류  : " + ex.toString() );	

		} finally{

			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }

			if( con  != null ) { try{ con.close(); } catch(SQLException ex){} }

		}

		

	}

	//--------------------------------------------

	//#####	 게시글 수정할 때

	//		( 게시글번호와 패스워드에 의해 수정 )

	public int update( BoardRec rec ) throws BoardException

	{



		PreparedStatement ps = null;

		try{

			con=DriverManager.getConnection(dbUrl, dbUser ,dbPass);

			String sql = "Update article set title =?,content = ?,posting_date=sysdate where article_id = ? and password = ?";

			ps=con.prepareStatement(sql);

			ps.setString(1,rec.getTitle());

			

			ps.setString(2,rec.getContent());

			ps.setInt(3,rec.getArticleId());

			System.out.println(rec.getArticleId());

			ps.setString(4,rec.getPassword());

			System.out.println(rec.getPassword());

			int result = ps.executeUpdate();

			System.out.println("수정dao성공");

			System.out.println(result);

			return result; // 나중에 수정된 수를 리턴하시오.

		

		}catch( Exception ex ){

			throw new BoardException("게시판 ) 게시글 수정시 오류  : " + ex.toString() );	

		} finally{

			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }

			if( con  != null ) { try{ con.close(); } catch(SQLException ex){} }

		}

		

	}

	

	

	//--------------------------------------------

	//#####	 게시글 삭제할 때

	//		( 게시글번호와 패스워드에 의해 삭제 )

	public int delete( int article_id, String password ) throws BoardException

	{



		PreparedStatement ps = null;

		try{

			con=DriverManager.getConnection(dbUrl, dbUser ,dbPass);

			String sql = "delete from article where article_id=? and password =?";

			ps=con.prepareStatement(sql);

			ps.setInt(1, article_id);

			ps.setString(2, password);

			

			int result = ps.executeUpdate();

			return result; // 나중에 수정된 수를 리턴하시오.

		

		}catch( Exception ex ){

			throw new BoardException("게시판 ) 게시글 수정시 오류  : " + ex.toString() );	

		} finally{

			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }

			if( con  != null ) { try{ con.close(); } catch(SQLException ex){} }

		}

		

	}

	

	

	//----------------------------------------------------

	//#####  부모레코드의 자식레코드 중 마지막 레코드의 순서번호를 검색

	//       ( 제일 작은 번호값이 마지막값임)

	public String selectLastSequenceNumber( String maxSeqNum, String minSeqNum ) throws BoardException

	{

		PreparedStatement ps = null;

		ResultSet rs = null;



		try{

			con	= DriverManager.getConnection( dbUrl, dbUser, dbPass );

			String sql		= "SELECT min(sequence_no) as minseq FROM article WHERE sequence_no < ? AND sequence_no >= ?";  

			ps		= con.prepareStatement( sql );

			ps.setString(1, maxSeqNum);

			ps.setString(2, minSeqNum);

			rs = ps.executeQuery();

			if( !rs.next())

			{				

				return null;

			}

			

			return rs.getString("minseq");

		}catch( Exception ex ){

			throw new BoardException("게시판 ) 부모와 연관된 자식 레코드 중 마지막 순서번호 얻어오기  : " + ex.toString() );	

		} finally{

			if( rs   != null ) { try{ rs.close();  } catch(SQLException ex){} }

			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }

			if( con  != null ) { try{ con.close(); } catch(SQLException ex){} }

		}			

	}

	

	public int getTotalPage() throws BoardException{

		Connection	 		con = null;

		PreparedStatement ps = null;

		ResultSet rs = null;

		int count = 0;



		try{

			//1.연결객체 얻어오기

			con = DriverManager.getConnection(dbUrl, dbUser ,dbPass);

			

			//2.SQL  문장 만들기

			String sql = "select count(*) cnt from article";

			//3.전송객체 얻어오기

			 ps = con.prepareStatement(sql); 

			

			//4.전송하기

			rs = ps.executeQuery(); 

			//5.결과받기

			while(rs.next()) {

				count = rs.getInt("cnt");

			}

			return  count;

			

		}catch( Exception ex ){

			throw new BoardException("게시 ) DB에 목록 검색시 오류  : " + ex.toString() );	

		} finally{

			if( rs   != null ) { try{ rs.close();  } catch(SQLException ex){} }

			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }

			if( con  != null ) { try{ con.close(); } catch(SQLException ex){} }

		}			

		

	}
}

