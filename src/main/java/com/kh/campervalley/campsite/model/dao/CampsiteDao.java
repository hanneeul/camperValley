package com.kh.campervalley.campsite.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.kh.campervalley.campsite.model.dto.CampsiteExt;
import com.kh.campervalley.campsite.model.dto.CampsiteFacility;

@Mapper
public interface CampsiteDao {

	@Insert("insert into campsite values (#{contentId}, #{facltNm}, #{lineIntro}, #{intro}, #{facltDivNm}, "
			+ "#{induty}, #{lctCl}, #{addr1}, #{addr2}, #{mapX}, #{mapY}, #{tel}, #{homepage}, #{resveCl}, "
			+ "#{operPdCl}, #{operDeCl}, #{posblFcltyCl}, #{themaEnvrnCl}, #{firstImageUrl})")
	int insertCampsite(CampsiteExt campsite);
	
	@Insert("insert into campsite_facility values (#{contentId}, #{gnrlSiteCo}, #{autoSiteCo}, #{glampSiteCo}, "
			+ "#{caravSiteCo}, #{indvdlCaravSiteCo}, #{siteMg1Width}, #{siteMg2Width}, #{siteMg3Width}, "
			+ "#{siteMg1Vrticl}, #{siteMg2Vrticl}, #{siteMg3Vrticl}, #{siteMg1Co}, #{siteMg2Co}, #{siteMg3Co}, "
			+ "#{siteBottomCl1}, #{siteBottomCl2}, #{siteBottomCl3}, #{siteBottomCl4}, #{siteBottomCl5}, "
			+ "#{glampInnerFclty}, #{caravInnerFclty}, #{trlerAcmpnyAt}, #{caravAcmpnyAt}, "
			+ "#{toiletCo}, #{swrmCo}, #{wtrplCo}, #{brazierCl}, "
			+ "#{sbrsCl}, #{sbrsEtc}, #{extshrCo}, #{frprvtWrppCo}, #{frprvtSandCo}, "
			+ "#{eqpmnLendCl}, #{animalCmgCl})")
	int insertCampsiteFacility(CampsiteFacility campsiteFacility);

	@Delete("delete from campsite")
	int campsiteListReset();

	List<CampsiteExt> recentCampsiteList();

	List<CampsiteExt> searchCampsiteList(Map<String, Object> searchParam);

	List<CampsiteExt> searchCampsiteThemeList(Map<String, Object> searchParam);

	CampsiteExt selectOneCampsite(long contentId);
	
}
