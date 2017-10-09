package com.situ.mall.service;

import java.util.List;

import com.situ.mall.pojo.Campaign;
import com.situ.mall.vo.PageBean;
import com.situ.mall.vo.SearchCondition;

public interface ICampaignService {

	PageBean<Campaign> getPageBean(SearchCondition<Campaign> searchCondition);

	boolean addCampaign(Campaign campaign);


	boolean deleteCampaign(Integer id);

	boolean updateStatus(Integer id, Integer status);

	List<Campaign> findAll();

	Campaign findById(Integer id);

	boolean updateCampaign(Campaign campaign);

}
