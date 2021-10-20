package com.master.dto;

import java.util.Arrays;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter

public class Criteria {
	private int pageNum;	// 현재 페이지
	private int amount;		// 한 페이지 당 보여질 게시물 갯수
	private int skip;		// 스킵 할 게시물 수( (pageNum-1) * amount )
	private String keyword;	// 검색 내용
	private String type;	// 검색 타입
	private String[] typeArr;	// 검색 타입 배열
	
	public Criteria() {	// 기본 세팅이 1페이지당 게시물 10개
		this(1,10);
	}
	public Criteria(int pageNum, int amount) {	// 생성자를 생성하면 원하는 세팅 가능
		this.pageNum = pageNum;
		this.amount = amount;
		this.skip = (pageNum-1)*amount;
	}
	
	public void setPageNum(int pageNum) {
		this.skip = (pageNum-1)*this.amount;
		this.pageNum = pageNum;
	}
	
	public void setAmount(int amount) {
		this.skip = (this.pageNum-1)*amount;
		this.amount = amount;
	}
	
	public void setType(String type) {
		this.type = type;
		this.typeArr = type.split("");
	}
	
	@Override
	public String toString() {
		return "criteria [pageNum=" +pageNum +", amount=" +amount +", skip=" +skip 
					+", keyword=" +keyword +", type=" +type +", typeArr=" +Arrays.toString(typeArr) +"]";
	}
}
