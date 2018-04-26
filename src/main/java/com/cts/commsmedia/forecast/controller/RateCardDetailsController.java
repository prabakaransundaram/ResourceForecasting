package com.cts.commsmedia.forecast.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cts.commsmedia.forecast.dto.LeaveDetailsDTO;
import com.cts.commsmedia.forecast.dto.UserDetailsDto;
import com.cts.commsmedia.forecast.model.DepartmentMasterVO;
import com.cts.commsmedia.forecast.model.RateCardDetailsVO;
import com.cts.commsmedia.forecast.model.SkillMasterVO;
import com.cts.commsmedia.forecast.model.UserDetailsScreenVO;
import com.cts.commsmedia.forecast.model.UserDetailsVO;
import com.cts.commsmedia.forecast.service.RateCardService;
import com.cts.commsmedia.forecast.service.UserService;
import com.cts.commsmedia.forecast.utils.CommonUtils;
import com.cts.commsmedia.forecast.utils.RFConstants;

@Controller
public class RateCardDetailsController extends BaseController{
	
	@Autowired
	UserService service;
	
	@Autowired
	RateCardService rateCardService;

	@RequestMapping(value = "/rateCardMaster", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView rateCardMaster(HttpServletRequest request,
			@ModelAttribute("rateCardDetailsVO") RateCardDetailsVO rateCardDetailsVO, Model model) {
			UserDetailsScreenVO userDetailsScreenVO = null;
			userDetailsScreenVO = service.getLocationDetails();
			rateCardDetailsVO=rateCardService.getSkillDetails();
			rateCardDetailsVO=rateCardService.getDeptDetails();
			rateCardDetailsVO.setLocationList(userDetailsScreenVO.getLocation_list());
			
			model.addAttribute("rateCardDetailsVO", rateCardDetailsVO);
		
		return new ModelAndView("rateCardDetails");
	}
	
	private void getMonths(UserDetailsScreenVO userDetailsScreenVO) {
		ArrayList<UserDetailsDto> months = new ArrayList<UserDetailsDto>();

		UserDetailsDto currentMonthDetails = new UserDetailsDto();
		currentMonthDetails.setMonth_id(CommonUtils.getMonth(RFConstants.CURRENT_MONTH, RFConstants.MONTHS.ID));
		currentMonthDetails.setMonth_name(CommonUtils.getMonth(RFConstants.CURRENT_MONTH, RFConstants.MONTHS.NAME));
		months.add(currentMonthDetails);
		UserDetailsDto nextMonthDetails = new UserDetailsDto();
		nextMonthDetails.setMonth_id(CommonUtils.getMonth(RFConstants.NEXT_MONTH, RFConstants.MONTHS.ID));
		nextMonthDetails.setMonth_name(CommonUtils.getMonth(RFConstants.NEXT_MONTH, RFConstants.MONTHS.NAME));

		months.add(nextMonthDetails);
		userDetailsScreenVO.setMonth_list(months);
	}
	
	
}
