package com.master.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PageMakerDTO {
    private int startPage; // ���� ������
    private int endPage; // �� ������
    private boolean prev, next; // ����, ���� ������ ���� ����
    private int total; // ��ü �Խù� ��
    private Criteria cri; // ���� ������, ������ �� �Խù� ǥ�� �� ����
    
    
    public PageMakerDTO(Criteria cri, int total) {	// ������
        this.cri = cri;
        this.total = total;
        this.endPage = (int)(Math.ceil(cri.getPageNum()/10.0))*10; // ������ ������
        this.startPage = this.endPage - 9; // ���� ������
        int realEnd = (int)(Math.ceil(total * 1.0/cri.getAmount())); // ��ü ������ ������
        
        
        // ��ü ������ ������(realend)�� ȭ�鿡 ���̴� ������������(endPage)���� ���� ���, ���̴� ������(endPage) �� ����
        if(realEnd < this.endPage) {
            this.endPage = realEnd;
        }
        // ���� ������(startPage)���� 1���� ū ��� true
        this.prev = this.startPage > 1;
        
        // ������ ������(endPage)���� 1���� ū ��� true
        this.next = this.endPage < realEnd;
        
        
    }
}
