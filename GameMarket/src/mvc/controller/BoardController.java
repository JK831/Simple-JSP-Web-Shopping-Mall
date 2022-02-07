package mvc.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.model.BoardDAO;
import mvc.model.BoardDTO;
import mvc.model.RecruitingBoardDAO;

public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final int LISTCOUNT = 5;
	
	public void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	public void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		if(command.contentEquals("/requestBoardListAction.do")) { //등록된 글 목록 페이지 출력하기
			requestRequestBoardList(request);
			RequestDispatcher rd = request.getRequestDispatcher("./board/list.jsp");
			rd.forward(request, response);
		}
		else if (command.contentEquals("/recruitingBoardListAction.do")) {
			requestRecruitingBoardList(request);
			RequestDispatcher rd = request.getRequestDispatcher("./board/list.jsp");
			rd.forward(request, response);
		}
		else if (command.equals("/requestBoardWriteForm.do")) { // 글 등록 페이지 출력하기
			requestRequestLoginName(request);
			RequestDispatcher rd = request.getRequestDispatcher("./board/writeForm.jsp");
			rd.forward(request, response);				
		}
		else if (command.equals("/recruitingBoardWriteForm.do")) { // 글 등록 페이지 출력하기
			requestRecruitingLoginName(request);
			RequestDispatcher rd = request.getRequestDispatcher("./board/writeForm.jsp");
			rd.forward(request, response);				
		}
		
		else if (command.equals("/requestBoardWriteAction.do")) {// 새로운 글 등록하기
			requestRequestBoardWrite(request);
			RequestDispatcher rd = request.getRequestDispatcher("/requestBoardListAction.do");
			rd.forward(request, response);						
		}
		else if (command.equals("/recruitingBoardWriteAction.do")) {// 새로운 글 등록하기
			requestRecruitingBoardWrite(request);
			RequestDispatcher rd = request.getRequestDispatcher("/recruitingBoardListAction.do");
			rd.forward(request, response);						
		}
		else if (command.equals("/requestBoardViewAction.do")) {//선택된 글 상세 페이지 가져오기
			requestRequestBoardView(request);
			RequestDispatcher rd = request.getRequestDispatcher("/requestBoardView.do");
			rd.forward(request, response);						
		}
		else if (command.equals("/recruitingBoardViewAction.do")) {//선택된 글 상세 페이지 가져오기
			requestRecruitingBoardView(request);
			RequestDispatcher rd = request.getRequestDispatcher("/recruitingBoardView.do");
			rd.forward(request, response);						
		}
		else if (command.equals("/requestBoardView.do")) { //글 상세 페이지 출력하기
			RequestDispatcher rd = request.getRequestDispatcher("./board/view.jsp");
			rd.forward(request, response);	
		}
		else if (command.equals("/recruitingBoardView.do")) { //글 상세 페이지 출력하기
			RequestDispatcher rd = request.getRequestDispatcher("./board/view.jsp");
			rd.forward(request, response);	
		}
		else if (command.equals("/requestBoardUpdateAction.do")) { //선택된 글의 조회수 증가하기
			requestRecruitingBoardUpdate(request);
			RequestDispatcher rd = request.getRequestDispatcher("/requestBoardListAction.do");
			rd.forward(request, response);
		}
		else if (command.equals("/recruitingBoardUpdateAction.do")) { //선택된 글의 조회수 증가하기
			requestRecruitingBoardUpdate(request);
			RequestDispatcher rd = request.getRequestDispatcher("/recruitingBoardListAction.do");
			rd.forward(request, response);
		}
		else if (command.equals("/requestBoardDeleteAction.do")) { //선택된 글 삭제하기
			requestRequestBoardDelete(request);
			RequestDispatcher rd = request.getRequestDispatcher("/requestBoardListAction.do");
			rd.forward(request, response);				
		}
		else if (command.equals("/recruitingBoardDeleteAction.do")) { //선택된 글 삭제하기
			requestRecruitingBoardDelete(request);
			RequestDispatcher rd = request.getRequestDispatcher("/recruitingBoardListAction.do");
			rd.forward(request, response);				
		}
		
	}
	
	public void requestRequestBoardList (HttpServletRequest request) {
		BoardDAO requestDao = BoardDAO.getInstance();
		List<BoardDTO> boardlist = new ArrayList<BoardDTO>();
		
	  	int pageNum=1;
		int limit=LISTCOUNT;
		
		if(request.getParameter("pageNum")!=null)
			pageNum=Integer.parseInt(request.getParameter("pageNum"));
				
		String items = request.getParameter("items");
		String text = request.getParameter("text");
		String boardCategory = "request";
		
		int total_record= requestDao.getListCount(items, text);
		boardlist = requestDao.getBoardList(pageNum,limit, items, text); 
		
		int total_page;
		
		if (total_record % limit == 0){     
	     	total_page =total_record/limit;
	     	Math.floor(total_page);  
		}
		else{
		   total_page =total_record/limit;
		   Math.floor(total_page); 
		   total_page =  total_page + 1; 
		}		
   
   		request.setAttribute("pageNum", pageNum);		  
   		request.setAttribute("total_page", total_page);   
		request.setAttribute("total_record",total_record); 
		request.setAttribute("boardlist", boardlist);
		request.setAttribute("boardCategory", boardCategory);
	}
	
	public void requestRecruitingBoardList (HttpServletRequest request) {
		RecruitingBoardDAO recruitingDao = RecruitingBoardDAO.getInstance();
		List<BoardDTO> boardlist = new ArrayList<BoardDTO>();
		
	  	int pageNum=1;
		int limit=LISTCOUNT;
		
		if(request.getParameter("pageNum")!=null)
			pageNum=Integer.parseInt(request.getParameter("pageNum"));
				
		String items = request.getParameter("items");
		String text = request.getParameter("text");
		String boardCategory = "recruiting";
		
		int total_record= recruitingDao.getListCount(items, text);
		boardlist = recruitingDao.getBoardList(pageNum,limit, items, text); 
		
		int total_page;
		
		if (total_record % limit == 0){     
	     	total_page =total_record/limit;
	     	Math.floor(total_page);  
		}
		else{
		   total_page =total_record/limit;
		   Math.floor(total_page); 
		   total_page =  total_page + 1; 
		}		
   
   		request.setAttribute("pageNum", pageNum);		  
   		request.setAttribute("total_page", total_page);   
		request.setAttribute("total_record",total_record); 
		request.setAttribute("boardlist", boardlist);
		request.setAttribute("boardCategory", boardCategory);
	}
	
	//인증된 사용자명 가져오기
		public void requestRequestLoginName(HttpServletRequest request){
						
			String id = request.getParameter("id");
			
			BoardDAO  dao = BoardDAO.getInstance();
			
			String name = dao.getLoginNameById(id);		
			
			request.setAttribute("name", name);
			request.setAttribute("boardCategory", "request");
		}

		public void requestRecruitingLoginName(HttpServletRequest request){
						
			String id = request.getParameter("id");
			
			RecruitingBoardDAO  dao = RecruitingBoardDAO.getInstance();
			
			String name = dao.getLoginNameById(id);		
			
			request.setAttribute("name", name);				
			request.setAttribute("boardCategory", "recruiting");
		}
		// 새로운 글 등록하기
		public void requestRequestBoardWrite(HttpServletRequest request){
						
			BoardDAO dao = BoardDAO.getInstance();		
			
			BoardDTO board = new BoardDTO();
			board.setId(request.getParameter("id"));
			board.setName(request.getParameter("name"));
			board.setSubject(request.getParameter("subject"));
			board.setContent(request.getParameter("content"));	
			
			System.out.println(request.getParameter("name"));
			System.out.println(request.getParameter("subject"));
			System.out.println(request.getParameter("content"));
			java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
			String regist_day = formatter.format(new java.util.Date()); 
			
			board.setHit(0);
			board.setRegist_day(regist_day);
			board.setIp(request.getRemoteAddr());			
			
			dao.insertBoard(board);								
		}
		public void requestRecruitingBoardWrite(HttpServletRequest request){
			
			RecruitingBoardDAO dao = RecruitingBoardDAO.getInstance();		
			
			BoardDTO board = new BoardDTO();
			board.setId(request.getParameter("id"));
			board.setName(request.getParameter("name"));
			board.setSubject(request.getParameter("subject"));
			board.setContent(request.getParameter("content"));	
			
			System.out.println(request.getParameter("name"));
			System.out.println(request.getParameter("subject"));
			System.out.println(request.getParameter("content"));
			java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
			String regist_day = formatter.format(new java.util.Date()); 
			
			board.setHit(0);
			board.setRegist_day(regist_day);
			board.setIp(request.getRemoteAddr());			
			
			dao.insertBoard(board);								
		}
		//선택된 글 상세 페이지 가져오기
		public void requestRequestBoardView(HttpServletRequest request){
						
			BoardDAO dao = BoardDAO.getInstance();
			int num = Integer.parseInt(request.getParameter("num"));
			int pageNum = Integer.parseInt(request.getParameter("pageNum"));
			String boardCategory = "request";
			
			BoardDTO board = new BoardDTO();
			board = dao.getBoardByNum(num, pageNum);		
			
			request.setAttribute("num", num);		 
	   		request.setAttribute("page", pageNum); 
	   		request.setAttribute("board", board);
	   		request.setAttribute("boardCategory", boardCategory);
		}
		public void requestRecruitingBoardView(HttpServletRequest request){
			
			RecruitingBoardDAO dao = RecruitingBoardDAO.getInstance();
			int num = Integer.parseInt(request.getParameter("num"));
			int pageNum = Integer.parseInt(request.getParameter("pageNum"));	
			String boardCategory = "recruiting";
			
			BoardDTO board = new BoardDTO();
			board = dao.getBoardByNum(num, pageNum);		
			
			request.setAttribute("num", num);		 
	   		request.setAttribute("page", pageNum); 
	   		request.setAttribute("board", board);   
	   		request.setAttribute("boardCategory", boardCategory);
		}
		
		//선택된 글 내용 수정하기
		public void requestRequestBoardUpdate(HttpServletRequest request){
						
			int num = Integer.parseInt(request.getParameter("num"));
			int pageNum = Integer.parseInt(request.getParameter("pageNum"));	
			
			BoardDAO dao = BoardDAO.getInstance();		
			
			BoardDTO board = new BoardDTO();		
			board.setNum(num);
			board.setName(request.getParameter("name"));
			board.setSubject(request.getParameter("subject"));
			board.setContent(request.getParameter("content"));		
			
			 java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
			 String regist_day = formatter.format(new java.util.Date()); 
			 
			 board.setHit(0);
			 board.setRegist_day(regist_day);
			 board.setIp(request.getRemoteAddr());			
			
			 dao.updateBoard(board);								
		}
		public void requestRecruitingBoardUpdate(HttpServletRequest request){
			
			int num = Integer.parseInt(request.getParameter("num"));
			int pageNum = Integer.parseInt(request.getParameter("pageNum"));	
			
			RecruitingBoardDAO dao = RecruitingBoardDAO.getInstance();		
			
			BoardDTO board = new BoardDTO();		
			board.setNum(num);
			board.setName(request.getParameter("name"));
			board.setSubject(request.getParameter("subject"));
			board.setContent(request.getParameter("content"));		
			
			 java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
			 String regist_day = formatter.format(new java.util.Date()); 
			 
			 board.setHit(0);
			 board.setRegist_day(regist_day);
			 board.setIp(request.getRemoteAddr());			
			
			 dao.updateBoard(board);								
		}
		
		//선택된 글 삭제하기
		public void requestRequestBoardDelete(HttpServletRequest request){
						
			int num = Integer.parseInt(request.getParameter("num"));
			int pageNum = Integer.parseInt(request.getParameter("pageNum"));	
			
			BoardDAO dao = BoardDAO.getInstance();
			dao.deleteBoard(num);							
		}
		public void requestRecruitingBoardDelete(HttpServletRequest request){
			
			int num = Integer.parseInt(request.getParameter("num"));
			int pageNum = Integer.parseInt(request.getParameter("pageNum"));	
			
			RecruitingBoardDAO dao = RecruitingBoardDAO.getInstance();
			dao.deleteBoard(num);							
		}
	
}
