package mybaties.board.service;

import java.util.*;

import mybaties.board.service.ViewArticleService;
import mybaties.board.model.BoardDao;
import mybaties.board.model.BoardException;
import mybaties.board.model.BoardRec;


public class ViewArticleService {

	private static ViewArticleService instance;

	public static ViewArticleService getInstance()  throws BoardException{

		if( instance == null )

		{

			instance = new ViewArticleService();

		}

		return instance;

	}

	

	public BoardRec getArticleById(String id) throws BoardException

	{

		int article_id = 0;

		if( id != null ) article_id = Integer.parseInt(id);

		BoardDao dao = BoardDao.getInstance();

		BoardRec rec = dao.selectById(article_id);		

		dao.increaseReadCount(article_id);

		return rec;

	}

		

}
