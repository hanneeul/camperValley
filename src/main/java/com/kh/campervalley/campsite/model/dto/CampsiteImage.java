package com.kh.campervalley.campsite.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString(callSuper = true)
public class CampsiteImage extends Campsite {
	@NonNull
	private long serialnum;
	private String imageUrl;
}
