package com.master.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CommentVO {

	private Long cno;
	private Long bnum;
	private String comment;
	private String writer;
	private Date reg_datetime; 

	
}
