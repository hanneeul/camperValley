package com.kh.campervalley.mypage.advertiser.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;

import com.kh.campervalley.mypage.advertiser.model.dto.Admoney;
import com.kh.campervalley.mypage.advertiser.model.dto.AdvertiserExt;
import com.kh.campervalley.mypage.advertiser.model.dto.AdvertiserMoneyExt;
import com.kh.campervalley.mypage.advertiser.model.dto.LicenseFile;
import com.kh.campervalley.mypage.advertiser.model.dto.Pay;

@Mapper
public interface AdvertiserDao {

	int insertAdvertiser(AdvertiserExt advertiser);
	
	@Insert("insert into admoney values (seq_admoney_no.nextval, #{advertiserNo}, default)")
	int insertAdmoney(int advertiserNo);

	@Insert("insert into license_file values (seq_license_file_no.nextval, #{advertiserNo}, #{originalFilename}, #{renamedFilename}, default)")
	int insertLicenseFile(LicenseFile licenseFile);

	List<AdvertiserExt> selectAdvertiserList(RowBounds rowBounds);
	
	List<AdvertiserExt> selectAdvertiserFilteredList(Map<String, Object> param, RowBounds rowBounds);

	int selectTotalAdvertiser();
	
	int selectFilteredTotalAdvertiser(Map<String, Object> param);

	@Select("select * from license_file where license_file_no = #{no}")
	LicenseFile selectOneLicenseFile(int no);

	@Update("update advertiser set biz_status = 'Y' where advertiser_no = #{advertiserNo}")
	int updateAdvertiserStatus(int advertiserNo);

	@Insert("insert into authority values (#{auth}, #{memberId})")
	int insertAuthority(Map<String, Object> map);

	@Delete("delete from authority where member_id = #{memberId} and auth = #{auth}")
	int deleteAuthority(Map<String, Object> map);

	AdvertiserMoneyExt selectOneAdvertiserMoney(String memberId);

	@Select("select * from admoney where advertiser_no = #{advertiserNo}")
	Admoney selectOneAdmoney(int advertiserNo);

	@Insert("insert into pay values (#{merchantUid}, #{advertiserNo}, #{impUid}, #{payMethod}, #{paidAmount}, #{status}, #{buyerEmail}, #{buyerName}, #{buyerTel}, #{paidAt}, #{pgProvider})")
	int insertPay(Pay pay);

	@Update("update admoney set balance = balance + #{paidAmount} where advertiser_no = #{advertiserNo}")
	int updateAdmoneyCharge(Pay pay);

	@Select("select * from pay where status != 'cancel' and advertiser_no = #{advertiserNo} order by paid_at desc")
	List<Pay> selectNotCancelPayByAdvertiserNo(int advertiserNo);

}
