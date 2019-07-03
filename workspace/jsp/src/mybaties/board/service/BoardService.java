package mybaties.board.service;

import java.util.*;
import mybaties.board.model.BoardRec;
import mybaties.board.session.BoardRepository;
import mybaties.guest.model.Comment;

public class BoardService {
	
	// 싱글톤패턴
	private static BoardService service;
	
	private BoardService() {}
	
	public static BoardService getInstance() {
		if(service == null) service = new BoardService();
		System.out.println("생성자 생성");
		return service;
	}
	BoardRepository repo =  new BoardRepository();

	
	
}
