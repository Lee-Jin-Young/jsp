<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONWriter"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	final int PAGE_ROW_COUNT = 5;
	final int PAGE_DISPLAY_COUNT=5;
	int pageNum = 1;

	String strPageNum = request.getParameter("pageNum");

	if(strPageNum != null) {
		pageNum = Integer.parseInt(strPageNum);
	}

	int startRowNum = 1 + (pageNum-1) * PAGE_ROW_COUNT;
	int endRowNum = pageNum * PAGE_ROW_COUNT;

	int startPageNum = 1 + ((pageNum-1) / PAGE_DISPLAY_COUNT) * PAGE_DISPLAY_COUNT;
	int endPageNum = startPageNum + PAGE_DISPLAY_COUNT - 1;

	int totalRow = CafeDao.getInstance().getCount();
	int totalPageCount = (int)Math.ceil(totalRow / (double)PAGE_ROW_COUNT);

	if(endPageNum > totalPageCount){
		endPageNum = totalPageCount;
	}

	CafeDto dto = new CafeDto();
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);

	CafeDao dao = CafeDao.getInstance();
	List<CafeDto> list = dao.getList(dto);
	String id = (String)session.getAttribute("id");
	
	
	JSONObject obj = new JSONObject();
	obj.put("list", list);
	obj.put("pageNum", pageNum);
	obj.put("startPageNum", startPageNum);
	obj.put("endPageNum", endPageNum);
	obj.put("totalPageCount", totalPageCount);
	
	String json = JSONWriter.valueToString(obj);
%>
<%=json%>