package board.service;

import java.text.DecimalFormat;

import board.model.*;

public class WriteArticleService {
	
	private static WriteArticleService instance;
	public static WriteArticleService getInstance()  throws BoardException{
		if( instance == null )
		{
			instance = new WriteArticleService();
		}
		return instance;
	}
	private  WriteArticleService() {
		
	}
	
	public BoardRec write( BoardRec rec ) throws BoardException{
		
		BoardDao dao = BoardDao.getInstance();

		// 그룹번호(group_id) 지정
		int groupId = dao.getGroupId();
		rec.setGroupId(groupId);
		
		// 순서번호(sequence_no) 지정
		DecimalFormat dformat = new DecimalFormat("0000000000");
		rec.setSequenceNo( dformat.format(groupId) + "999999");
		// groupId=1 이라면 0000000001999999
		// groupId=1234 이라면 0000001234999999
		
		
		
		// DB에 insert
		rec.setArticleId(dao.insert(rec));
			
		return rec; // BoardRec을 리턴할 필요는 없음
					// article_id만 리턴해도 됨
		
		
	}
}
