package com.histudy.schedule.controller;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.histudy.schedule.model.ScheduleDTO;
import com.histudy.schedule.service.ScheduleService;

@Controller

public class ScheduleController {

    @Autowired
    private ScheduleService scheduleService;

    @RequestMapping("/mySchedule.do")
    public String showCalendar() {
        return "user/mySchedule"; // WEB-INF/views/user/mySchedule.jsp 호출
    }

   @RequestMapping("/getList.do")
    @ResponseBody 
    public List<ScheduleDTO> getList(HttpSession session) {
        Integer user_idx = (Integer) session.getAttribute("user_idx");
        
        if (user_idx != null) {
            return scheduleService.getScheduleList(user_idx);
        }
        return null;
    }
}