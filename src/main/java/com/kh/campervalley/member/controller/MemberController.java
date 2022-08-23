package com.kh.campervalley.member.controller;

import java.nio.charset.StandardCharsets;
import java.security.Key;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.campervalley.member.model.dto.Member;
import com.kh.campervalley.member.model.service.MemberService;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/member")
@PropertySource("classpath:datasource.properties")
@Slf4j
public class MemberController {

	@Autowired
	MemberService memberService;

	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;

	@Autowired
	ServletContext application;
	
	@Value("${bs-info.naverId}")
	private String NAVER_ID;

	@Value("${bs-info.naverPassword}")
	private String NAVER_PASSWORD;

	@Value("${jwt.secret-key}")
	private String secretKey;

	// 테스트용 토큰 저장

	// 회원가입페이지
	@GetMapping("/enroll")
	public void memberEnroll() {
	}

	@GetMapping("/enrollSuccess")
	public void memberEnrollSuccess() {
	}

	@GetMapping("/resetPassword")
	public ModelAndView resetPassword( @RequestParam String token) {
		
		ModelAndView mav= new ModelAndView();
		try {
			Key key = Keys.hmacShaKeyFor(secretKey.getBytes(StandardCharsets.UTF_8));
			log.debug("token={}",token);
			Jws<Claims> jws = Jwts.parserBuilder()
								.setSigningKey(key)
								.build()
								.parseClaimsJws(token);
			mav.addObject("email",jws.getBody().get("email"));
			return mav;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@PostMapping("/resetPassword")
	public String resetPassword(String email,String password, RedirectAttributes redirectAttr) {
		
		Map<String, Object> map = new HashMap<>();
		try {
			String encryptedPassword = bcryptPasswordEncoder.encode(password);
			map.put("password", encryptedPassword);
			map.put("email", email);
			int result = memberService.updatePassword(map);
			redirectAttr.addFlashAttribute("msg", "비밀번호가 변경되었습니다. 로그인페이지로 이동합니다.");
		} catch (Exception e) {
			e.printStackTrace();
			redirectAttr.addFlashAttribute("msg", "비밀번호 찾기부터 다시 진행해주세요");
			return "redirect:/member/passwordSearcg";
		}
		return "redirect:/member/login";
	}
	
	@GetMapping("/searchId")
	public void searchId() {
	}

	@GetMapping("/searchPassword")
	public void searchPassword() {
	}

	@GetMapping("/login")
	public void login() {
	}

	@PostMapping("/enroll")
	public String memberEnroll(Member member, RedirectAttributes redirectAttr) {
		log.debug("member = {}", member);
		try {
			String rawPassword = member.getPassword();
			String encryptedPassword = bcryptPasswordEncoder.encode(rawPassword);
			member.setPassword(encryptedPassword);
			log.debug("member.getPassword={}", member.getPassword());

			int result = memberService.insertMember(member);

			log.info("회원가입 성공");
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return "redirect:/member/enrollSuccess";
	}

	@GetMapping("/checkDuplicate")
	public ResponseEntity<?> checkIdDuplicate(@RequestParam String value, @RequestParam String attribute) {

		Map<String, Object> map = new HashMap<>();
		try {
			Member member = memberService.selectOneMember(attribute, value);
			boolean available = member == null;// 사용가능 true 1 사용불가능 false 0

			map.put("value", value);// 필요없나?
			map.put("available", available);
			log.debug("컨트롤러 중복검사");
		} catch (Exception e) {
			log.error("중복검사 체크 오류", e);
			map.put("error", e.getMessage());

			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_UTF8_VALUE).body(map);
		}

		return ResponseEntity.status(HttpStatus.OK)
				.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_UTF8_VALUE).body(map);

	}

	@PostMapping("/searchId")
	public ResponseEntity<?> searchId(@RequestParam String name, @RequestParam String email) {
		Map<String, Object> map = new HashMap<>();
		log.debug(name);
		log.debug(email);
		try {
			String memberId = memberService.selectIDByNameAndEmail(name, email);
			map.put("memberId", memberId);
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.OK)
					.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_UTF8_VALUE).body(map);
		}
		return ResponseEntity.status(HttpStatus.OK)
				.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_UTF8_VALUE).body(map);
	}

	@PostMapping("/searchPassword")
	public String searchMemberN(@RequestParam String memberId, @RequestParam String email, RedirectAttributes redirectAttr) {
		Map<String, Object> map = new HashMap<>();
		try {
			Member member = memberService.selectOneMember("member_Id", memberId);
			// 이메일 일치
			if (member != null && email.equals(member.getEmail()) ) {
				mailSender(email, member.getName(), "비밀번호 찾기");
				redirectAttr.addFlashAttribute("msg", "이메일로 인증번호를 발송하였습니다.");
				return "redirect:/";
			} else {
				redirectAttr.addFlashAttribute("msg", "입력하신 정보와 일치하는 회원이 없습니다.");
				return "redirect:/member/searchPassword";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/member/searchPassword";
		}
	}

	 
	  private void mailSender(String emailTo, String nameTo, String title) {
	  
		  String token = createToken("campervalley@naver.com");
		  log.debug("token={}",token);
		  String charSet = "utf-8"; 
		  String hostSMTP = "smtp.naver.com";
		  String hostSMTPid = NAVER_ID;
		  String hostSMTPpwd = NAVER_PASSWORD;
	  
	
		  String fromEmail = "campervalley@naver.com";
		  String fromName = "campervalley";
		  String subject = "테스트";

		  
		  try { 
			  HtmlEmail htmlEmail = new HtmlEmail(); htmlEmail.setCharset(charSet);
			  htmlEmail.setHostName(hostSMTP); htmlEmail.setSSLOnConnect(true);
			  htmlEmail.setSmtpPort(465);
		  
			  htmlEmail.setAuthentication(hostSMTPid, hostSMTPpwd); htmlEmail.addTo(emailTo,nameTo ,charSet); // 받는사람 정보 
			  htmlEmail.setFrom(fromEmail, fromName, charSet);
			  htmlEmail.setSubject(subject);
			  htmlEmail.setHtmlMsg("<!DOCTYPE html>\r\n"
			  		+ "<html>\r\n"
			  		+ "	<style>\r\n"
			  		+ "		body{\r\n"
			  		+ "			color: #2B380C;\r\n"
			  		+ "			font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif\r\n"
			  		+ "		}\r\n"
			  		+ "	</style>\r\n"
			  		+ "<body>\r\n"
			  		+ "	<div style=\"min-width: 350px; width: 500px; margin: auto; margin-top: 6%; font-size: 1rem;\">\r\n"
			  		+ "		<h1 style=\"font-size: 1.6rem;\">안녕하세요 <strong>캠퍼밸리</strong>입니다.</h1>\r\n"
			  		+ "		<p style=\"margin: 1rem 0 1.5rem 0;\">아래 링크를 클릭하여 비밀번호를 재설정 해주세요.<br>\r\n"
			  		+ "			개인정보 보호를 위해 아래 링크는 1시간 동안만 유효합니다.</p>\r\n"
			  		+ "		\r\n"
			  		+ "		<hr>\r\n"
			  		+ "		<a href=\"http://localhost:9090/campervalley/member/resetPassword?token="+token+"\" style=\"display: block; font-weight: 700; background-color: #2B380C; margin: auto; border-radius: 4px; margin-top: 30px;\r\n"
			  		+ "			margin-bottom: 30px;font-size: 1.08rem;  text-decoration: none; color: #fff; width: 200px; padding: 11px 15px; text-align: center; \">\r\n"
			  		+ "				비밀번호 재설정\r\n"
			  		+ "		</a>\r\n"
			  		+ "		<p></p>\r\n"
			  		+ "		<hr>\r\n"
			  		+ "	</div>\r\n"
			  		+ "	\r\n"
			  		+ "</body>\r\n"
			  		+ "</html>"
					  
			  		);  
			  htmlEmail.send(); 
			  log.debug("이메일 전송{}",token);
	  

	  
	  } catch (Exception e) { log.error("비밀번호 찾기 오류",e); }
	  
	  
	  }

	// 토큰생성 메소드
	public String createToken(String email) {
		
		Key key = Keys.hmacShaKeyFor(secretKey.getBytes());

		Map<String, Object> headers = new HashMap<>();
		headers.put("typ", "JWT");

		Map<String, Object> payloads = new HashMap<>();
		payloads.put("email", email);

		Date exp = new Date(); // 토큰 만료 시간
		exp.setTime(exp.getTime() + 1000 * 60L * 60);
		
		return Jwts.builder()
				.setHeaderParam("typ", "jwt")
				.setIssuer("campervalley")
				.setSubject("passwordReset")
				.setClaims(payloads)
				.setExpiration(exp)
				.setIssuedAt(new Date())
				.signWith(key)
				.compact();

	}
	


}
