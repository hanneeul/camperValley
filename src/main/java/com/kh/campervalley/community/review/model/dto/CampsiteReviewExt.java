package com.kh.campervalley.community.review.model.dto;

import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.ToString;

@Data
@NoArgsConstructor
@ToString(callSuper = true)
public class CampsiteReviewExt extends CampsiteReview {

	private int commentCount;
	private int likeCount;
	private List<ReviewPhoto> photos;
	private List<ReviewComment> comments;
	private List<ReviewRecommend> recommends;
	
	public void addReviewPhoto(@NonNull ReviewPhoto photo) {
		photos.add(photo);
	}
	
}
