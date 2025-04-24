package com.team1.controller;

import java.util.UUID;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;

import com.team1.dto.GenReviewDTO;
import com.team1.dto.ParDTO;
import com.team1.mybatis.IGenReviewDAO;

@Controller
public class ReviewController
{
    @Autowired
    private SqlSession sqlSession;

    // ⭐ 리뷰 작성 폼 이동
    @RequestMapping(value = "/reviewform.action", method = RequestMethod.GET)
    public String reviewForm(@RequestParam("gen_confirmed_id") String genConfirmedId,
                             Model model, HttpSession session)
    {
        ParDTO parent = (ParDTO) session.getAttribute("loginParent");
        if (parent == null)
            return "redirect:/loginform.action";

        IGenReviewDAO dao = sqlSession.getMapper(IGenReviewDAO.class);

        // 이미 리뷰가 작성된 경우
        if (dao.checkReviewExists(genConfirmedId) > 0)
        {
            model.addAttribute("message", "이미 작성된 리뷰입니다.");
            return "redirect:/sitterusehistory.action";
        }

        // 돌봄 완료 여부 확인 (일반 / 긴급)
        if (dao.isConfirmedFinished(genConfirmedId) == 0)
        {
            model.addAttribute("message", "아직 돌봄이 완료되지 않았습니다.");
            return "redirect:/sitterusehistory.action";
        }

        model.addAttribute("gen_confirmed_id", genConfirmedId);
        return "/WEB-INF/view/ReviewInsertForm.jsp";
    }

    // ⭐ 리뷰 등록 처리
    @RequestMapping(value = "/reviewinsert.action", method = RequestMethod.POST)
    public String reviewInsert(@RequestParam("gen_confirmed_id") String genConfirmedId,
                               @RequestParam("rating") int rating,
                               @RequestParam("selectedItems") String selectedItems,
                               HttpSession session)
    {
        ParDTO parent = (ParDTO) session.getAttribute("loginParent");
        if (parent == null)
            return "redirect:/loginform.action";

        IGenReviewDAO dao = sqlSession.getMapper(IGenReviewDAO.class);
        String reviewId = "RV" + UUID.randomUUID().toString().replace("-", "").substring(0, 16);

        // ✅ 포인트 계산 (신입 여부에 따라)
        int pointAmount = isNewSitter(genConfirmedId, dao) ? 400 : 200;

        // ✅ 사용 시간(work_hours) 가져오기
        int usedTime = dao.getWorkHoursByConfirmedId(genConfirmedId);

        // DTO 구성
        GenReviewDTO dto = new GenReviewDTO();
        dto.setGen_review_id(reviewId);
        dto.setGen_confirmed_id(genConfirmedId);
        dto.setRating(String.valueOf(rating));
        dto.setPoint_amount(pointAmount);
        dto.setPoint_subject("별점");
        dto.setUsed_time(usedTime);  // 돌봄 시간 반영

        // 리뷰 저장
        dao.addGenReviews(dto);

        // 객관식 항목 저장
        saveMultipleChoiceAnswers(dao, dto, selectedItems);

        return "redirect:/sitterusehistory.action";
    }

    // ⭐ 객관식 항목 저장 로직 (중복 제거)
    private void saveMultipleChoiceAnswers(IGenReviewDAO dao, GenReviewDTO dto, String selectedItems)
    {
        String[] items = selectedItems.split(",");
        for (String item : items)
        {
            String multiReviewId = "MR" + UUID.randomUUID().toString().replace("-", "").substring(0, 16);
            dto.setGen_multiple_review_id(multiReviewId);
            dto.setGen_multiple_type_id(item.trim());  // String 유지
            dao.insertMultiReviews(dto);
        }
    }

    // ⭐ 신입 여부 확인
    private boolean isNewSitter(String genConfirmedId, IGenReviewDAO dao)
    {
        return dao.isNewSitter(genConfirmedId) > 0;
    }
}
