package com.gumi.enjoytrip.domain.hotplace.controller;

import com.gumi.enjoytrip.domain.hotplace.dto.HotPlaceCreateDto;
import com.gumi.enjoytrip.domain.hotplace.dto.HotPlaceDto;
import com.gumi.enjoytrip.domain.hotplace.dto.HotPlaceUpdateDto;
import com.gumi.enjoytrip.domain.hotplace.service.HotPlaceServiceImpl;
import com.gumi.enjoytrip.domain.user.dto.UserDto;
import com.gumi.enjoytrip.util.PageNavigation;
import com.gumi.enjoytrip.util.ParameterCheck;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;


@WebServlet("/hotplaces")
public class HotPlaceServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // ====== 페이징 수정부분 ======
    private int pgno;
    private String key;
	private String word;
	private String queryString;
	// ========================
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    		
    	pgno = ParameterCheck.notNumberToOne(request.getParameter("page-number"));
		key = ParameterCheck.nullToBlank(request.getParameter("key"));
		word = ParameterCheck.nullToBlank(request.getParameter("word"));
		queryString = "?pgno=" + pgno + "&key=" + key + "&word=" + URLEncoder.encode(word, "utf-8");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("pgno", pgno + "");
		map.put("key", key);
		map.put("word", word);
		
		request.setAttribute("key", key);
		request.setAttribute("word", word);
	
		PageNavigation pageNavigation = HotPlaceServiceImpl.getInstance().makePageNavigation(map);
		request.setAttribute("navigation", pageNavigation);
    	
    	// 핫플레이스 클릭 시 하나의 핫 플레이스 보여주기
        if (request.getParameter("id") != null) {
            long id = Integer.parseInt(request.getParameter("id"));
            
            HotPlaceDto hotPlaceDto = HotPlaceServiceImpl.getInstance().getHotPlace(id);
            request.setAttribute("hotplace", hotPlaceDto);
            
            System.out.println(map.get("pgno"));
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("trip/hotplace/hotplace.jsp" + queryString);
            dispatcher.forward(request, response);
        } 
        
        // 검색
        else if (request.getParameter("condition") != null && request.getParameter("keyword") != null) {
            int pageNumber = request.getParameter("page-number") == null ? 1 : Integer.parseInt(request.getParameter("page-number"));
            String condition = request.getParameter("condition");
            String keyword = request.getParameter("keyword");
            request.setAttribute("hotplaces", HotPlaceServiceImpl.getInstance().getHotPlaceListByKeyword(condition, keyword, pageNumber));
            RequestDispatcher dispatcher = request.getRequestDispatcher("trip/hotplace/hotplace-list.jsp");
            dispatcher.forward(request, response);
        } 
        
        // 전체 리스트 보여주기
        else {
        	int pageNumber = request.getParameter("page-number") == null ? 1 : Integer.parseInt(request.getParameter("page-number"));
            request.setAttribute("hotplaces", HotPlaceServiceImpl.getInstance().getHotplaceList(pageNumber));
			
            RequestDispatcher dispatcher = request.getRequestDispatcher("trip/hotplace/hotplace-list.jsp" + queryString);
            dispatcher.forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        
        // 글 쓰기
        if (request.getParameter("mode") != null && request.getParameter("mode").equals("create")) {
            try {
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            
            int placeType = Integer.parseInt(request.getParameter("place-type"));
            double latitude = Double.parseDouble(request.getParameter("latitude"));
            double longitude = Double.parseDouble(request.getParameter("longitude"));
            
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            Date date = format.parse(request.getParameter("date"));
            
            UserDto user = (UserDto) request.getSession().getAttribute("user");
            
            HotPlaceServiceImpl.getInstance().createHotPlace(new HotPlaceCreateDto(title, content, placeType, latitude, longitude, user.getId(), date));
            String root = request.getContextPath();
            
            response.sendRedirect(root + "/hotplaces");
            
            } catch (ParseException e) {
                e.printStackTrace();
            }
        } 
        
        // 수정 페이지로 이동
        else if (request.getParameter("mode") != null && request.getParameter("mode").equals("mvmodify")) {
        	int id = Integer.parseInt(request.getParameter("selectedHotPlace-id"));
        	
        	HotPlaceDto hotPlaceDto = HotPlaceServiceImpl.getInstance().getHotPlace(id);
			request.setAttribute("modifyHotPlace", hotPlaceDto);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("trip/hotplace/hotplace-modify.jsp");
			dispatcher.forward(request, response);
        }
        
        // 수정하기 
        else if (request.getParameter("mode") != null && request.getParameter("mode").equals("update")) {
            long id = Long.parseLong(request.getParameter("modifyHotPlace-id"));
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            int placeType = Integer.parseInt(request.getParameter("type"));
            
            UserDto user = (UserDto) request.getSession().getAttribute("user");
            HotPlaceServiceImpl.getInstance().updateHotPlace(id, new HotPlaceUpdateDto(id, title, content, placeType, user.getId()));
            
            String root = request.getContextPath();
            response.sendRedirect(root + "/hotplaces");
        }
        
        // 삭제
        else if (request.getParameter("mode") != null && request.getParameter("mode").equals("delete")) {
        	doDelete(request, response);
        }
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        long id = Long.parseLong(req.getParameter("selectedHotPlace-id"));
        HotPlaceServiceImpl.getInstance().deleteHotPlace(id);
        
        String root = req.getContextPath();
        resp.sendRedirect(root + "/hotplaces");
    }
}
