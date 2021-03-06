package com.goodee.gdlibrary.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface BookService {
		
	public void getBooksInfo(HttpServletRequest request);
	
	public Map<String, Object> bookList(int page);
	
	public Map<String, Object> searchBook(HttpServletRequest request);
	
	public void detailBook(HttpServletRequest request, Model model);
	
	public Map<String, Object> recomBook(Model model);
	
}
