package com.situ.mall.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.mall.dao.CampaignDao;
import com.situ.mall.pojo.Campaign;
import com.situ.mall.service.ICampaignService;
import com.situ.mall.vo.PageBean;
import com.situ.mall.vo.SearchCondition;

@Service
public class CampaignServiceImpl implements ICampaignService {
	
	@Autowired
	private CampaignDao campaignDao;
	
	public PageBean<Campaign> getPageBean(SearchCondition<Campaign> searchCondition) {
		PageBean<Campaign> pageBean = new PageBean<Campaign>();
		Integer pageIndex = searchCondition.getPageIndex();
		Integer pageSize = searchCondition.getPageSize();
		pageBean.setPageIndex(pageIndex);
		pageBean.setPageSize(pageSize);
		int totalCount = campaignDao.getCount(searchCondition);
		pageBean.setTotalCount(totalCount);
		int totalPage = (int) Math.ceil(1.0 * totalCount / pageSize);
		pageBean.setTotalPage(totalPage);
		int index = (pageIndex - 1) * pageSize;
		searchCondition.setPageIndex(index);
		List<Campaign> list = campaignDao.pageList(searchCondition);
		pageBean.setList(list);
		return pageBean;
	}

	public boolean addCampaign(Campaign campaign) {
		int result = campaignDao.addCampaign(campaign);
		
		return result > 0 ? true : false;
	}


	public boolean deleteCampaign(Integer id) {
		int result = campaignDao.deleteCampaign(id);
		return result > 0 ? true : false;
	}

	public boolean updateStatus(Integer id, Integer status) {
		int result = campaignDao.updateStatus(id,status);
		return false;
	}

	public List<Campaign> findAll() {
		return campaignDao.findAll();
	}

	public Campaign findById(Integer id) {
		return campaignDao.findById(id);
	}

	public boolean updateCampaign(Campaign campaign) {
		int result = campaignDao.updateCampaign(campaign);
		return result > 0 ? true : false;
	}

}
