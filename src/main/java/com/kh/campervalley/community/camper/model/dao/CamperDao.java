package com.kh.campervalley.community.camper.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.session.RowBounds;

import com.kh.campervalley.community.camper.model.dto.Camper;

@Mapper
public interface CamperDao {

	int insertCamper(Camper camper);

	@Select("select * from camper order by camper_no desc")
	List<Camper> selectCamperList(RowBounds rowBounds);

	@Select("select * from camper order by camper_no desc")
	List<Camper> selectMoreCamperList(RowBounds rowBounds);

}
