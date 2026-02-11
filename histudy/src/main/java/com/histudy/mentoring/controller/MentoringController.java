package com.histudy.mentoring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import javax.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.histudy.mentoring.model.*;
import com.histudy.mentoring.service.*;

@Controller
public class MentoringController {

    @Autowired
    private MentoringService mentoringService;

    @GetMapping("/mentorList.do")
    public String mentorList(HttpServletRequest request) {

        List<MentorListDTO> mentorList = mentoringService.mentorList();
        
        request.setAttribute("mentorList", mentorList);
        request.setAttribute("activeCategory", 0);
        
        HttpSession session = request.getSession();
        Integer user_idx = (Integer) session.getAttribute("user_idx");
        
        boolean isMentor = false;
        if (user_idx != null) {
            isMentor = mentoringService.mentorProfileCount(user_idx) > 0;
        }
        request.setAttribute("isMentor", isMentor);

        return "/mentoring/mentorList";
    }

    @GetMapping("/mentorListCategory.do")
    public String mentorListCategory(
            @RequestParam("sc_idx") int sc_idx,
            HttpServletRequest request) {

        List<MentorListDTO> mentorList =
                mentoringService.mentorListCategory(sc_idx);

        request.setAttribute("mentorList", mentorList);
        request.setAttribute("activeCategory", sc_idx);

        HttpSession session = request.getSession();
        Integer user_idx = (Integer) session.getAttribute("user_idx");

        boolean isMentor = false;
        if (user_idx != null) {
            isMentor = mentoringService.mentorProfileCount(user_idx) > 0;
        }
        request.setAttribute("isMentor", isMentor);
        
        return "/mentoring/mentorList";
    }
    
    @GetMapping("/mentorProfileForm.do")
    public String mentorProfileForm() {
        return "/mentoring/mentorProfileForm";
        
    }

    @PostMapping("/mentorProfileCreate.do")
    public String mentorProfileCreate(MentoProfileDTO dto, HttpServletRequest request, RedirectAttributes ra) {

        HttpSession session = request.getSession();
        Integer user_idx = (Integer) session.getAttribute("user_idx");
        if(user_idx == null) {
           ra.addFlashAttribute("msg","로그인이 필요합니다.");
           return "redirect:/mentorList.do";
        }
        dto.setUser_idx(user_idx);
        
        if(mentoringService.mentorProfileCount(user_idx)<=0) {
           int result = mentoringService.mentorProfileCreate(dto);
           ra.addFlashAttribute("msg","멘토 등록 완료!");
        }
        else {
           ra.addFlashAttribute("msg","멘토 등록이 이미 되어있음!");
           
        }
        return "redirect:/mentorList.do";

    }
    
    @GetMapping("/mentoringCreate.do")
    public String mentoringCreateForm(HttpServletRequest request, RedirectAttributes ra) {
        HttpSession session = request.getSession();
        Integer user_idx = (Integer) session.getAttribute("user_idx");

        if (user_idx == null) {
            ra.addFlashAttribute("msg", "로그인이 필요합니다.");
            return "redirect:/mentorList.do";
        }

        if (mentoringService.mentorProfileCount(user_idx) <= 0) {
            ra.addFlashAttribute("msg", "멘토 등록이 필요합니다.");
            return "redirect:/mentorList.do";
        }

        return "/mentoring/mentoringCreate";
    }

    @PostMapping("/mentoringCreate.do")
    public String mentoringCreateSubmit(MentoringDTO dto,
                                       @RequestParam("schedule_json") String scheduleJson,
                                       @RequestParam(value="skill_tags", required=false) String skillTags,
                                       HttpServletRequest request,
                                       RedirectAttributes ra) {

        HttpSession session = request.getSession();
        Integer user_idx = (Integer) session.getAttribute("user_idx");

        if (user_idx == null) {
            ra.addFlashAttribute("msg", "로그인이 필요합니다.");
            return "redirect:/mentorList.do";
        }

        int mentor_idx = mentoringService.findMentorIdxAndUserIdx(user_idx);
        if (mentor_idx <= 0) {
            ra.addFlashAttribute("msg", "멘토 등록이 필요합니다.");
            return "redirect:/mentorList.do";
        }

        dto.setMentor_idx(mentor_idx);

        try {
            mentoringService.createMentoring(dto, scheduleJson, skillTags);
            ra.addFlashAttribute("msg", "멘토링 개설 완료!");
            return "redirect:/mentorList.do";
        } catch (IllegalArgumentException e) {
            ra.addFlashAttribute("msg", e.getMessage());
            return "redirect:/mentoringCreate.do";
        } catch (Exception e) {
            ra.addFlashAttribute("msg", "멘토링 개설 중 오류가 발생했습니다.");
            return "redirect:/mentoringCreate.do";
        }
    }
    
    //신청현황 보기
    @GetMapping("/mentoringApplication.do")
    public String mentorApplications(HttpServletRequest request, RedirectAttributes ra) {
      HttpSession session = request.getSession();
      Integer user_idx = (Integer) session.getAttribute("user_idx");
      if (user_idx == null) {
        ra.addFlashAttribute("msg", "로그인이 필요합니다.");
        return "redirect:/mentorList.do";
      }

      Integer mentor_idx = mentoringService.findMentorIdxAndUserIdx(user_idx);
      if (mentor_idx == null || mentor_idx <= 0) {
        ra.addFlashAttribute("msg", "멘토만 접근 가능합니다.");
        return "redirect:/mentorList.do";
      }

      List<MentorApplicationDTO> list = mentoringService.selectMentorApplications(mentor_idx);
      request.setAttribute("applications", list);
      request.setAttribute("mentorSummary", mentoringService.selectMentorSummary(mentor_idx));
      return "/mentoring/mentoringApplication";
    }
    
 // 신청 승인
    @PostMapping("/mentoringApprove.do")
    public String mentoringApprove(@RequestParam("ma_id") int ma_id,
                                   HttpServletRequest request,
                                   RedirectAttributes ra) {

        HttpSession session = request.getSession();
        Integer user_idx = (Integer) session.getAttribute("user_idx");
        if (user_idx == null) {
            ra.addFlashAttribute("msg", "로그인이 필요합니다.");
            return "redirect:/mentorList.do";
        }

        Integer mentor_idx = mentoringService.findMentorIdxAndUserIdx(user_idx);
        if (mentor_idx == null || mentor_idx <= 0) {
            ra.addFlashAttribute("msg", "멘토만 접근 가능합니다.");
            return "redirect:/mentorList.do";
        }

        int result = mentoringService.approveAndMatch(ma_id);

        if (result > 0) {
            ra.addFlashAttribute("msg", "승인 처리되었습니다.");
        } else {
            ra.addFlashAttribute("msg", "승인할 수 없습니다. (이미 처리됨/승인대기중 아님)");
        }

        return "redirect:/mentoringApplication.do";
    }

    //신청 삭제
    @PostMapping("/mentoringDelete.do")
    public String mentoringDelete(@RequestParam("ma_id") int ma_id,
                                  HttpServletRequest request,
                                  RedirectAttributes ra) {

        HttpSession session = request.getSession();
        Integer user_idx = (Integer) session.getAttribute("user_idx");
        if (user_idx == null) {
            ra.addFlashAttribute("msg", "로그인이 필요합니다.");
            return "redirect:/mentorList.do";
        }

        Integer mentor_idx = mentoringService.findMentorIdxAndUserIdx(user_idx);
        if (mentor_idx == null || mentor_idx <= 0) {
            ra.addFlashAttribute("msg", "멘토만 접근 가능합니다.");
            return "redirect:/mentorList.do";
        }

        int result = mentoringService.deleteMentorApplication(ma_id);

        if (result > 0) {
            ra.addFlashAttribute("msg", "신청을 삭제했습니다.");
        } else {
            ra.addFlashAttribute("msg", "삭제할 수 없습니다. (이미 처리됨/승인대기 아님)");
        }

        return "redirect:/mentoringApplication.do";
    }

    //멘토링 신청 폼
    @GetMapping("/mentoringApply.do")
    public String mentoringApply(@RequestParam("mentor_idx") int mentor_idx,
                                 RedirectAttributes ra) {

        int mentoring_idx = mentoringService.selectLatestMentoringIdxByMentor(mentor_idx);

        if (mentoring_idx <= 0) {
            ra.addFlashAttribute("msg", "아직 개설된 멘토링이 없습니다.");
            return "redirect:/mentorList.do";
        }

        return "redirect:/mentoringApplyForm.do?mentoring_idx=" + mentoring_idx;
    }


    @GetMapping("/mentoringApplyForm.do")
    public String mentoringApplyForm(@RequestParam("mentoring_idx") int mentoring_idx,
                                     HttpServletRequest request,
                                     RedirectAttributes ra) {
        MentoringDTO mentoring = mentoringService.selectMentoringDetailForApply(mentoring_idx);
        if (mentoring == null) {
            ra.addFlashAttribute("msg", "존재하지 않는 멘토링입니다.");
            return "redirect:/mentorList.do";
        }

        request.setAttribute("mentoring", mentoring);
        request.setAttribute("mentorSummary", mentoringService.selectMentorInfoByMentoringIdx(mentoring_idx));
        return "/mentoring/mentoringApply"; 
    }

    @PostMapping("/mentoringApplySubmit.do")
    public String mentoringApplySubmit(@RequestParam("mentoring_idx") int mentoring_idx,
                                       @RequestParam("apply_content") String apply_content,
                                       HttpServletRequest request,
                                       RedirectAttributes ra) {

        HttpSession session = request.getSession();
        Integer mentee_user_idx = (Integer) session.getAttribute("user_idx");
        if (mentee_user_idx == null) {
            ra.addFlashAttribute("msg", "로그인이 필요합니다.");
            return "redirect:/mentorList.do";
        }

        int result = mentoringService.applyMentoring(mentoring_idx, mentee_user_idx, apply_content);

        if (result > 0) {
            ra.addFlashAttribute("msg", "멘토링 신청이 완료되었습니다.");
        } else {
            ra.addFlashAttribute("msg", "신청에 실패했습니다.");
        }

        return "redirect:/mentorList.do";
    }
    
    @GetMapping("/mentorProfile.do")
    public String mentorProfile(@RequestParam("mentor_idx") int mentor_idx,
                                HttpServletRequest request,
                                RedirectAttributes ra) {
      HttpSession session = request.getSession();
      Integer user_idx = (Integer) session.getAttribute("user_idx");

      MentoringDetailDTO detail = mentoringService.selectMentoringDetailByMentor(mentor_idx);
      if (detail == null) {
        ra.addFlashAttribute("msg", "아직 개설된 멘토링이 없습니다.");
        return "redirect:/mentorList.do";
      }
      
      int mentoring_idx= detail.getMentoring_idx();

      request.setAttribute("detail", detail);
      request.setAttribute("reviews", mentoringService.selectMentoringReviews(mentoring_idx));

      Integer writableMatchId = null;
      if (user_idx != null) {
        writableMatchId = mentoringService.getWritableMatchId(mentor_idx, user_idx);
      }
      request.setAttribute("writableMatchId", writableMatchId);

      return "/mentoring/mentorProfile";
    }
    
    @PostMapping("/mentoringReviewWrite.do")
    public String mentoringReviewWrite(@RequestParam("mentor_idx") int mentor_idx,
                                       @RequestParam("rating") double rating,
                                       @RequestParam("review_content") String review_content,
                                       HttpServletRequest request,
                                       RedirectAttributes ra) {
      HttpSession session = request.getSession();
      Integer user_idx = (Integer) session.getAttribute("user_idx");
      if (user_idx == null) {
        ra.addFlashAttribute("msg", "로그인이 필요합니다.");
        return "redirect:/mentorProfile.do?mentor_idx=" + mentor_idx;
      }

      Integer matchId = mentoringService.getWritableMatchId(mentor_idx, user_idx);
      if (matchId == null) {
        ra.addFlashAttribute("msg", "리뷰는 매칭 완료 후 1회만 작성할 수 있습니다.");
        return "redirect:/mentorProfile.do?mentor_idx=" + mentor_idx;
      }
      
      MentoringDetailDTO detail = mentoringService.selectMentoringDetailByMentor(mentor_idx);
      if (detail == null) {
          ra.addFlashAttribute("msg", "멘토링 정보를 찾을 수 없습니다.");
          return "redirect:/mentorProfile.do?mentor_idx=" + mentor_idx;
      }
      int mentoring_idx = detail.getMentoring_idx();

      MentoringReviewDTO dto = new MentoringReviewDTO();
      dto.setMatch_id(matchId);
      dto.setMentoring_idx(mentoring_idx);
      dto.setMentee_user_idx(user_idx);
      dto.setRating(rating);
      dto.setReview_content(review_content);

      mentoringService.writeReview(dto);
      ra.addFlashAttribute("msg", "리뷰가 등록되었습니다.");
      return "redirect:/mentorProfile.do?mentor_idx=" + mentor_idx;
    }



}












