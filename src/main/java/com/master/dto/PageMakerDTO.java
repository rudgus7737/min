package com.master.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PageMakerDTO {
    private int startPage; // 시작 페이지
    private int endPage; // 끝 페이지
    private boolean prev, next; // 이전, 다음 페이지 존재 유무
    private int total; // 전체 게시물 수
    private Criteria cri; // 현재 페이지, 페이지 당 게시물 표시 수 정보
    
    
    public PageMakerDTO(Criteria cri, int total) {	// 생성자
        this.cri = cri;
        this.total = total;
        this.endPage = (int)(Math.ceil(cri.getPageNum()/10.0))*10; // 마지막 페이지
        this.startPage = this.endPage - 9; // 시작 페이지
        int realEnd = (int)(Math.ceil(total * 1.0/cri.getAmount())); // 전체 마지막 페이지
        
        
        // 전체 마지막 페이지(realend)가 화면에 보이는 마지막페이지(endPage)보다 작은 경우, 보이는 페이지(endPage) 값 조정
        if(realEnd < this.endPage) {
            this.endPage = realEnd;
        }
        // 시작 페이지(startPage)값이 1보다 큰 경우 true
        this.prev = this.startPage > 1;
        
        // 마지막 페이지(endPage)값이 1보다 큰 경우 true
        this.next = this.endPage < realEnd;
        
        
    }
}
