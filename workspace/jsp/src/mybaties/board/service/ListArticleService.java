package mybaties.board.service;

import java.util.*;

import mybaties.board.service.ListArticleService;
import mybaties.board.model.BoardDao;
import mybaties.board.model.BoardException;
import mybaties.board.model.BoardRec;

public class ListArticleService {

	private int totalRecCount;		// 전체 레코드 수	

	private int pageTotalCount;		// 전체 페이지 수

	private int countPerPage = 3;

	

	private static ListArticleService instance;

	public static ListArticleService getInstance()  throws BoardException{

		if( instance == null )

		{

			instance = new ListArticleService();

		}

		return instance;

	}

	

	public List <BoardRec> getArticleList() throws BoardException

	{

		// 

		 List <BoardRec> mList = BoardDao.getInstance().selectList();			

		return mList;

	}

	public List <BoardRec> getArticleList(String pNum) throws BoardException

	{

		// 페이지 번호에 따른 레코드 번호 추출

				// 페이지 번호에 따른 시작레코트 번호(startRow)와 보여줄 마지막 레코드 번호 (endRow)추출

				/* 전체레코드 수가 10

				 1 페이지 : 1~3 

				 2 페이지 : 4~6

				 3 페이지 : 7~9

				 4 페이지 : 10

				 	

				*/

		

		int pageNo = 1;

		if(pNum != null) {

			pageNo =Integer.parseInt(pNum);

		}

		

		int endRow = countPerPage *pageNo;

		int startRow = endRow - (countPerPage-1);

		// 

		 List <BoardRec> mList = BoardDao.getInstance().selectList(startRow,endRow);			

		return mList;

	}

	public int getTotalPage() throws BoardException

	{

		// 

		 BoardDao dao = BoardDao.getInstance();

		 totalRecCount = dao.getTotalPage();

			if(totalRecCount%countPerPage==0) {

				pageTotalCount = totalRecCount/countPerPage;

			}else {

				pageTotalCount = totalRecCount/countPerPage +1;

			}

		 

		return pageTotalCount;

	}

		

}