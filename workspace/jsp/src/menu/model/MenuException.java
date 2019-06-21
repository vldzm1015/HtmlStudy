package menu.model;

public class MenuException extends Exception {
	
	public MenuException(){
  		super();
  	}
  	
  public MenuException(String error){
  		super( error );
  	}
}
