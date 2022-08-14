package com.kh.campervalley.community.review.model.dto;

import java.util.ArrayList;
import java.util.List;

import com.kh.campervalley.member.model.dto.Member;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.ToString;

@Data
@NoArgsConstructor
@ToString(callSuper = true)
public class CampsiteReviewExt extends CampsiteReview {
	private int commentCount;
	private int recommendCount;
	private List<ReviewPhoto> photos = new ArrayList<>();
	private List<ReviewRecommend> recommends = new ArrayList<>();
	private List<ReviewComment> comments = new ArrayList<>();
	private Member member;
	
	public void addReviewPhoto(@NonNull ReviewPhoto photo) {
		photos.add(photo);
	}

}
