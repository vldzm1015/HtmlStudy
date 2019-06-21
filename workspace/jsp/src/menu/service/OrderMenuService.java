package menu.service;


import menu.model.MenuDao;
import menu.model.MenuRec;
import menu.model.MenuException;

public class OrderMenuService {
private static OrderMenuService instance;
	
	public static OrderMenuService	getInstance() throws MenuException
	{
		if( instance == null )
		{
			instance = new OrderMenuService();
		}
		return instance;
	}
	
	private OrderMenuService()
	{
		
	}
	
	public void write( MenuRec rec ) throws MenuException
	{
		MenuDao mDao = MenuDao.getInstance();
		mDao.insert(rec);
	
	}
}
