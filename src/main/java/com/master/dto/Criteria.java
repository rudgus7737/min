package com.master.dto;

import java.util.Arrays;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter

public class Criteria {
	private int pageNum;	// ���� ������
	private int amount;		// �� ������ �� ������ �Խù� ����
	private int skip;		// ��ŵ �� �Խù� ��( (pageNum-1) * amount )
	private String keyword;	// �˻� ����
	private String type;	// �˻� Ÿ��
	private String[] typeArr;	// �˻� Ÿ�� �迭
	
	public Criteria() {	// �⺻ ������ 1�������� �Խù� 10��
		this(1,10);
	}
	public Criteria(int pageNum, int amount) {	// �����ڸ� �����ϸ� ���ϴ� ���� ����
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
