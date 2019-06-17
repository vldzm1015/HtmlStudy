package temp;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 없으면 수동으로 설정해야함
@WebServlet("/HelloServlet")
public class HelloServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
   
	// 생성자함수
    public HelloServlet() {
      // 없어도 자동으로 불러짐
    	//super();
       
    }

	// doGet : form태그에서 get 방식 실행시 발생하는 메소드
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		response.getWriter().append("Served at: ").append(request.getContextPath());

		//한글 깨질 때 필요함
//		response.setContentType("text/html;charset=utf-8");
		
		// 쓰기 통로 얻어오기
		//String 
		PrintWriter out = response.getWriter();
		out.println("<html><head><title>나의 첫 서버</title></head>");
		out.println("<body>");
		out.println("<h2> Happy Friday</h2>");
		out.println("<p> yeah </p>");
		out.println("</body></html>");
		
		// 닫기 필수
		out.close();
	}

	// doPost : form태그에서 post 방식 실행시 발생하는 메소드
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
