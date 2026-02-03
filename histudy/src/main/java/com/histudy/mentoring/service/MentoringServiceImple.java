package com.histudy.mentoring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.histudy.mentoring.model.*;

@Service
public class MentoringServiceImple implements MentoringService {

    private MentoringDAO mentoringDAO;

    @Autowired
    public MentoringServiceImple(MentoringDAO mentoringDAO) {
        this.mentoringDAO = mentoringDAO;
    }

    @Override
    public List<MentorListDTO> mentorList() {
        return mentoringDAO.mentorList();
    }

    @Override
    public List<MentorListDTO> mentorListCategory(int sc_idx) {
        return mentoringDAO.mentorListCategory(sc_idx);
    }
    
    @Override
    public int mentorProfileCreate(MentoProfileDTO dto) {
        return mentoringDAO.mentorProfileCreate(dto);
    }
}
