package com.kh.campervalley.chat.payload;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Payload {
	
	private int no;
	private String from;
	private String to;
	private String msg;
	private long time;
	private Type type;
}
