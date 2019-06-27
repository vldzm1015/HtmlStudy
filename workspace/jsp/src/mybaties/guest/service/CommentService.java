package mybaties.guest.service;

import java.util.List;
import mybaties.guest.model.Comment;
import mybaties.guest.session.CommentRepository;

public class CommentService {
	// 싱글톤 패턴
	private static CommentService service;

	private CommentService() {}

	public static CommentService getInstance() {
		if(service == null) service = new CommentService();
		System.out.println("생성자 생성");
		return service;
	}
	CommentRepository repo =  new CommentRepository();

	// 전체검색
	public List<Comment> selectComment(){

		return repo.selectComment();
	}
	
	// 글번호로 검색
	public Comment selectCommentByPrimaryKey(long cId) {
		return repo.selectCommentByPK(cId);
	}
	
	//입력
	public void insertComment(Comment c) {
		repo.insertComment(c);
	}
	 
	//삭제
	public void delelteComment(long delete) {
		repo.delelteComment(delete); 
	}
	
	//수정
	public void modifyComment(Comment c) {
		repo.modifyComment(c);
	}

}
