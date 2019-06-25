package mvc.simple;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class SimpleControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	String jspDir = "/05_mvc_class/1_mvcSimple/";
	
    public SimpleControl() {
        super();
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	
	}
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 이전화면에서 넘겨받는 값을 얻어올때 : request.getParameter()
		//request에 데이타 저장 :requset.setAttribute("name",value) //value에 Object 넣기 가능
		// request에서 데이타를 얻어올 때 : request.getAttribute("name")
		
		String type = request.getParameter("type");
		String value = "오늘도 화이팅";
		if(type != null) value="우리조단합";
		
		
		
		// 사용자한테 보내줄 데이터를 request에 저장.
		request.setAttribute("param", value);
		
		
		//forwarding !!! <jsp:forward page="파일경로"> 
		RequestDispatcher dispatcher = 
				request.getRequestDispatcher(jspDir+"simpleView.jsp");
		dispatcher.forward(request, response);
		
	}

}
