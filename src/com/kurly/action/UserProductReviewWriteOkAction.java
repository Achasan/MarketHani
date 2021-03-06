package com.kurly.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kurly.controller.Action;
import com.kurly.controller.ActionForward;
import com.kurly.model.ReviewDAO;
import com.kurly.model.ReviewDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class UserProductReviewWriteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//자료실 폼 페이지에서 넘어온 데이터들을 DB에 저장하는 비지니스 로직
		
		
		int p_num = Integer.parseInt(request.getParameter("p_num")); //추가
			
		ReviewDTO dto = new ReviewDTO();
		
		//첨부파일이 저장될 경로
		
		String saveFolder = "C:\\Users\\ahn28\\git\\MarketHani\\WebContent\\upload";
		
		/*
		 * String saveFolder =
		 * request.getSession().getServletContext().getContext("/upload").getRealPath(
		 * "") ; System.out.println("saveFolder >>>" + saveFolder);
		 */
		
		// 첨부파일 최대 크기 지정
		int fileSize = 10 * 1024 * 1024; //10MB
		
		// 파일 업로드를 진행시 이전 파일 업로드를 위한 객체 생성
		MultipartRequest multi = new MultipartRequest(
				request,                          
				saveFolder, 
				fileSize,
				"UTF-8",
				new DefaultFileRenamePolicy()
				);
		
		// 자료실 폼 페이지에서 넘어온 데이터들을 받아주어야 한다.
		String user_id = multi.getParameter("user_id").trim();
		
		String r_title = multi.getParameter("r_title").trim();
		
		String r_content = multi.getParameter("r_content").trim();
		
		
		// 자료실 폼 페이지에서 type="file"로 되어 있으면
		// getFile() 메서드로 받아 주어야 한다.
		File r_image = multi.getFile("r_image");
				
		
		if(r_image != null) {  //첨부 파일이 존재하는 경우
			
			String fileName = r_image.getName();
			
			Calendar cal = Calendar.getInstance();
			
			int year = cal.get(Calendar.YEAR);
			int month = cal.get(Calendar.MONTH) + 1;
			int day = cal.get(Calendar.DAY_OF_MONTH);
			
			// ...../upload/2021-11-28
			
			String homedir = saveFolder+"/"+year+"-"+month+"-"+day;
			
			// 날짜 폴더 만들기
			File path1 = new File(homedir);
			
			if(!path1.exists()) {  //폴더가 존재하지 않는 경우
				path1.mkdir();   //실제 폴더 만드는 메서드
				
			}
			
			/*
			 * System.out.println("homedir >> " + homedir); System.out.println("path1 >> " +
			 * path1); System.out.println("user_id >> " + user_id);
			 */
			
			String reFileName = user_id + "_"+ fileName;
			
			r_image.renameTo(new File(homedir+"/"+reFileName));
			
			String fileDBName = "/" +year +"-" +month+"-" +day+ "/"+reFileName;
			
			dto.setR_image(fileDBName);
		}
			dto.setUser_id(user_id);
			dto.setR_title(r_title);
			dto.setR_content(r_content);
			dto.setP_num(p_num);
			
			
			ReviewDAO dao = ReviewDAO.getInstance();
			
			int res = dao.insertReviewUpload(dto);
			
		
		
			ActionForward forward = new ActionForward(); 
			
			PrintWriter out = response.getWriter();
			
			if(res>0) {
				forward.setRedirect(true);
				forward.setPath("user_product_review_list.do?p_num=" + p_num);
			} else {
				out.println("<script>");
				out.println("alert('게시글 업로드 실패')");
				out.println("history.back()");
				out.println("</script>");
			}
			
			return forward;
		}
}
			
		