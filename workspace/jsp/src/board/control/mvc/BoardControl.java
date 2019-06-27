package board.control.mvc;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.service.mvc.*;





public class BoardControl extends HttpServlet {
	
	private HashMap commandMap;
	private String	jspDir = "/04_board_class_mvc/mvcBoard/";
	private String  error = "error.jsp";
	

    public BoardControl() {
        super();       
		initCommand();
	}

	private void initCommand(){
		commandMap = new HashMap();

		commandMap.put("main-page",	new CommandNull("boardMvc.jsp") );
		commandMap.put("list-page",	 ("BoardList.jsp") );
		// 나머지도 추가하기	
//		commandMap.put("input-page", new CommandNull("insertMessage.jsp"));
//		commandMap.put("input-do", new CommandInput("listMessage.jsp"));
//		commandMap.put("delete-page", new CommandNull("deleteMessage.jsp"));
//		commandMap.put("delete-do", new CommandDelete("deleteConfirm.jsp"));
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}
	

	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String nextPage = "";
		String recKey	= request.getParameter("rec");
		if( recKey == null ){
			recKey = "main-page";
		}

		
		Command rec = null;

		try{
			
			if( commandMap.containsKey( recKey ) ){
				rec = (Command)commandMap.get( recKey);
			}else{
				throw new CommandException("지정할 명령어가 존재하지 않음");
			}

			nextPage = rec.execute( request, response  );

		}catch( CommandException e ){
			request.setAttribute("javax.servlet.jsp.jspException", e );
			nextPage = error;
			System.out.println("오류 : " + e.getMessage() );
		}

		//forwarding
		RequestDispatcher reqDp = getServletContext().getRequestDispatcher( jspDir + nextPage );
		reqDp.forward( request, response );
		
	}

}
