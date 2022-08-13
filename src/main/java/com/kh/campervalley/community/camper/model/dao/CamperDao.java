package com.kh.campervalley.community.camper.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.session.RowBounds;

import com.kh.campervalley.community.camper.model.dto.Camper;
import com.kh.campervalley.community.camper.model.dto.CamperExt;

@Mapper
public interface CamperDao {

	int insertCamper(Camper camper);

	@Select("select c.*, (select nickname from member where member_id = c.member_id) nickname from camper c order by c.camper_no desc")
	List<CamperExt> selectCamperList(RowBounds rowBounds);

	@Select("select * from camper order by camper_no desc")
	List<Camper> selectMoreCamperList(RowBounds rowBounds);

	CamperExt selectCamperOne(int camperNo);

}
