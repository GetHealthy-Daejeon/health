package com.dw.health.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardVO {
	
	private int boardId;
	private int memberId;
	private String title;
	private String content;
	private String updateAt;
	private String createAt;
	private int cnt; //조회 수(하려나..?)
}
