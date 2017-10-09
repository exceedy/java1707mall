package com.situ.mall.controller.back;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.situ.mall.pojo.Campaign;
import com.situ.mall.service.ICampaignService;
import com.situ.mall.vo.PageBean;
import com.situ.mall.vo.SearchCondition;

@Controller
@RequestMapping(value="campaign")
public class CampaignController {
	
	@Autowired
	private ICampaignService campaignService;
	
	@RequestMapping(value="searchConditionSelect")
	public String searchConditionSelect(SearchCondition<Campaign> searchCondition, Model model) {
		Integer pageIndex = searchCondition.getPageIndex();
		int index = 1;
		if (pageIndex != null) {
			index = pageIndex;
		}
		searchCondition.setPageIndex(index);
		Integer pageSize = searchCondition.getPageSize();
		int size = 3;
		if (pageSize != null) {
			size = pageSize;
		}
		
		searchCondition.setPageSize(size);
		PageBean<Campaign> pageBean = campaignService.getPageBean(searchCondition);
		model.addAttribute("pageBean", pageBean);
		return "campaign_show";
	}
	
	@RequestMapping(value="toAddCampaign")
	public String toAddCampaign() {
		return "add_campaign";
	}
	
	@RequestMapping(value="addCampaign")
	public String addCampaign(Campaign campaign) {
		boolean result = campaignService.addCampaign(campaign);
		return "redirect:/campaign/searchConditionSelect.action";
	}
	
	@RequestMapping(value="updateStatusUp")
	public String updateStatusUp(Integer id) {
		Integer status = 1;
		Campaign campaign = new Campaign();
		campaign.setId(id);
		campaign.setStatus(status);
		boolean result = campaignService.updateStatus(id,status);
		return "redirect:/campaign/searchConditionSelect.action";
	}
	
	@RequestMapping(value="updateStatusDown")
	public String updateStatusDown(Integer id) {
		Integer status = 2;
		Campaign campaign = new Campaign();
		campaign.setId(id);
		campaign.setStatus(status);
		boolean result = campaignService.updateStatus(id, status);
		return "redirect:/campaign/searchConditionSelect.action";
	}
	
	@RequestMapping(value="deleteCampaign")
	public String deleteCampaign(Integer id) {
		campaignService.deleteCampaign(id);
		return "redirect:/campaign/searchConditionSelect.action";
	}
	
	
	@RequestMapping(value="deleteAll")
	public String deleteAll(Integer[] selectIds) {
		for (Integer id : selectIds) {
			campaignService.deleteCampaign(id);
		}
		return "redirect:/campaign/searchConditionSelect.action";
	}
	
	@RequestMapping(value="updateAllStatusUp")
	public String updateAllStatusUp(Integer[] selectIds) {
		for (Integer id : selectIds) {
			campaignService.updateStatus(id,1);
		}
		return "redirect:/campaign/searchConditionSelect.action";
	}
	
	@RequestMapping(value="toUpdateCampaign")
	public String toUpdateCampaign(Integer id, Model model) {
		Campaign campaign = campaignService.findById(id);
		model.addAttribute("campaign", campaign);
		return "update_campaign";
	}
	
	@RequestMapping(value="updateCampaign")
	public String updateCampaign(Campaign campaign) {
		boolean result = campaignService.updateCampaign(campaign);
		return "redirect:/index.shtml";
	}
}
