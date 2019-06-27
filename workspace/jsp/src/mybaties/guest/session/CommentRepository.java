package mybaties.guest.session;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import mybaties.guest.model.Comment;

public class CommentRepository {
	// mapper를 찾아가는 이름 .namespace
	//String namespace = "mapper.CommentMapper";

	SqlSessionFactory getSqlSessionFactory() {
		InputStream inStream = null; // 자바의 지역 변수 초기화 
		try {
			inStream = Resources.getResourceAsStream("mybatis-config.xml");
			System.out.println("db연결완료");
			// 파일을 지정해줘야 자원관리 해줌
		} catch (Exception e) {
			System.out.println("config 파일 연결 실패:" + e.getMessage());
		}
		SqlSessionFactory sessFactory = 
				new SqlSessionFactoryBuilder().build(inStream);
		return sessFactory;
	}
	
	
	//Connection 개념 -> SqlSession
	//전체검색
	public List<Comment> selectComment(){
		SqlSession sess = getSqlSessionFactory().openSession();
		try {
			//         return sess.selectList(namespace+".selectComment");

			return sess.selectList("mapper.CommentMapper.selectComment");

		} finally {
			sess.close();
		}
	}

	// 조건검색 축소
	public Comment selectCommentByPK(long commentNo) {
		SqlSession sess = getSqlSessionFactory().openSession();

		try {
			Map map = new HashMap();
			map.put("commentNo", commentNo);
			Comment c = sess.selectOne("mapper.CommentMapper.selectComment", map);
			return c;
		} finally {
			sess.close();
		}
	}
//	public Comment selectCommentByPK(long commentNo) {
//		SqlSession sess = getSqlSessionFactory().openSession();
//
//		try {
//			Comment c = sess.selectOne("mapper.CommentMapper.selectCommentByPK", commentNo);
//			return c;
//		} finally {
//			sess.close();
//		}
//	}

	public void insertComment(Comment c) {
		SqlSession sess = getSqlSessionFactory().openSession();
		try {
			int result = sess.insert("mapper.CommentMapper.insertComment",c);
			if (result>0) {
				sess.commit();
			}else {
				sess.rollback();
			}
		} finally {
			sess.close();
		} 
	}
	
	public void delelteComment(long delete) {
		SqlSession sess = getSqlSessionFactory().openSession();
		try {
			int result = sess.delete("mapper.CommentMapper.deleteComment",delete);
			if (result>0) {
				sess.commit();
			}else {
				sess.rollback();
			}
		} finally {
			sess.close();
		} 
	}
	
	public void modifyComment(Comment c) {
		SqlSession sess = getSqlSessionFactory().openSession();
		try {
			int result = sess.update("mapper.CommentMapper.modifyComment",c);
			if (result>0) {
				sess.commit();
			}else {
				sess.rollback();
			}
		} finally {
			sess.close();
		} 
	}
	


}