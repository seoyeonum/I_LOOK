/*
 * package com.team1.controller;
 * 
 * import javax.servlet.http.HttpSession;
 * 
 * import com.team1.dto.ParDTO; import com.team1.mybatis.IParDAO;
 * 
 * import org.apache.ibatis.session.SqlSession; import
 * org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.stereotype.Controller; import
 * org.springframework.ui.Model; import
 * org.springframework.web.bind.annotation.RequestMapping;
 * 
 * 
 * @Controller public class ParentInfoController {
 * 
 * @Autowired private SqlSession sqlSession;
 * 
 * @RequestMapping(value = "/parentinfoview.action")parentinfo public String
 * parentInfoView(HttpSession session, Model model) { // 로그인한 부모의 백업 ID 가져오기
 * String par_backup_id = (String) session.getAttribute("par_backup_id");
 * 
 * if (par_backup_id == null || par_backup_id.trim().equals("")) { // 세션에 값이 없다면
 * 로그인 페이지 등으로 리다이렉트 return "redirect:/login.action"; }
 * 
 * // DAO로부터 부모 정보 조회 IParDAO dao = sqlSession.getMapper(IParDAO.class); ParDTO
 * parent = dao.search(par_backup_id);
 * 
 * // 모델에 담아서 JSP로 전달 model.addAttribute("parent", parent);
 * 
 * return "/WEB-INF/view/ParentInfo.jsp"; } }
 */