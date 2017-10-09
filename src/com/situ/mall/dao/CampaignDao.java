package com.situ.mall.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.situ.mall.pojo.Campaign;
import com.situ.mall.vo.SearchCondition;

public interface CampaignDao {

	List<Campaign> pageList(SearchCondition<Campaign> searchCondition);

	int getCount(SearchCondition<Campaign> searchCondition);

	int addCampaign(Campaign campaign);


	int deleteCampaign(Integer id);

	int updateStatus(@Param(value="id")Integer id, @Param(value="status") Integer status);

	List<Campaign> findAll();

	Campaign findById(Integer id);

	int updateCampaign(Campaign campaign);

}
