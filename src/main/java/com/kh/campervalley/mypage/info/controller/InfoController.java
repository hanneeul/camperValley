package com.kh.campervalley.mypage.info.controller;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.campervalley.common.CamperValleyUtils;
import com.kh.campervalley.member.model.dto.Member;
import com.kh.campervalley.member.model.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/mypage/info")
@Slf4j
public class InfoController {
	@Autowired
	MemberService memberService;
	
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	ServletContext application;
	
	@Autowired
	ResourceLoader resourceLoader;
	
	@GetMapping("/edit")
	public void mypageUpdate(@AuthenticationPrincipal Member member) {
	}
	
	@PostMapping("/edit")
	public String mypageUpdate(Member updateMember,
								@AuthenticationPrincipal Member loginMember,
								@RequestParam("profileImgFile") MultipartFile upFile,
								@RequestParam("changeImg") String changeImg,
								RedirectAttributes redirectAttr) throws Exception {
		
		Map<String, Object> map = new HashMap<>();
		try {
			System.out.println(updateMember.getPassword()==null + "");
			System.out.println(updateMember.getPassword().equals(""));
			
			//파일 처리
			String saveDirectory = application.getRealPath("/resources/upload/member");
			
			//파일업로드
			if (upFile.getSize() > 0) {
				String originalFilename = upFile.getOriginalFilename();
				String renamedFilename = CamperValleyUtils.getRenamedFilename(originalFilename);
				File destFile = new File(saveDirectory, renamedFilename);
				upFile.transferTo(destFile);

				updateMember.setProfileImg(renamedFilename);
				
			}
			//기존파일 삭제
			if(loginMember.getProfileImg() != null && changeImg.equals("1")) {
				File delFile = new File(saveDirectory, loginMember.getProfileImg());
				if(delFile.exists()) {
					delFile.delete();
					log.debug("{}님 프로필 사진{} 삭제", loginMember.getMemberId(), loginMember.getProfileImg());		
				}
			}
			
			
			//비밀번호 암호화
			if(updateMember.getPassword().equals(""))
				updateMember.setPassword(loginMember.getPassword());
			else
				updateMember.setPassword(bcryptPasswordEncoder.encode(updateMember.getPassword()));
			//업데이트 처리
			log.debug("updateMember = {}", updateMember);
			log.debug("loginMember = {}", loginMember);
			int result = memberService.updateMember(updateMember);
			log.debug(result+"");
			loginMember.setNickname(updateMember.getNickname());
			loginMember.setPassword(updateMember.getPassword());
			loginMember.setEmail(updateMember.getEmail());
			loginMember.setName(updateMember.getTel());
			if(changeImg.equals("1"))
				loginMember.setProfileImg(updateMember.getProfileImg());
			
			Authentication newAuthentication = new UsernamePasswordAuthenticationToken(
					loginMember, loginMember.getPassword());
					
			log.debug("success{}",loginMember.getProfileImg());
			
			redirectAttr.addFlashAttribute("msg", "회원정보가 성공적으로 수정되었습니다.");
		} catch (Exception e) {
			log.error("회원정보 수정 오류", e);
			throw e; 
		}
		return "redirect:/mypage/info/edit";
	}
	
	@GetMapping("/main")
	public void mypage(@AuthenticationPrincipal Member member) {
		log.debug("member = {}", member);
	}
	
	@GetMapping("/withdrawal")
	public void withdrawal() {}

}
