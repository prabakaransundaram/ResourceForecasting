package com.cts.commsmedia.forecast.service;

import com.cts.commsmedia.forecast.dto.RateCardDetailsDTO;
import com.cts.commsmedia.forecast.model.RateCardDetailsVO;

public interface RateCardService {

	public RateCardDetailsVO getSkillDetails();

	public RateCardDetailsVO getDeptDetails(RateCardDetailsVO rateCardDetailsVO);

	public int saveRateCardDetails(RateCardDetailsDTO rateCardDetailsDTO);
}
