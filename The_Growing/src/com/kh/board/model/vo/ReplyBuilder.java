package com.kh.board.model.vo;

public class ReplyBuilder {
	
	private int replyNo;
	private String replyContent;
	private int refBno;
	
	private ReplyBuilder() {
		super();
	}
	
	public static class Builder {
		
		private int replyNo; // 필수로 받아야할 정보
		private String replyContent; // 선택적으로 받아야할 정보
		private int refBno;// 선택적으로 받아야할 정보
		
		// 필수로 받아야할정보는 생성자로 값을 전달해줌.
		public Builder(int replyNo) {
			this.replyNo = replyNo;
		}
		
		// 선택적으로 받아야하는 빌더클래스의 필드값을 세터함수로 만듬(이때 반환값은 Builder객체로 반환★)
		public Builder setReplyContent(String replyContent) {
			this.replyContent = replyContent;
			
			return this; // 현재 객체를 반환함으로써 메서드 체이닝을 이용할수 있게함.
		}
		
		public Builder setRefBno(int refBno) {
			this.refBno = refBno;
			
			return this;
		}
		
		public ReplyBuilder build() {
			
			ReplyBuilder rb = new ReplyBuilder();
			rb.replyNo = this.replyNo;
			rb.replyContent = this.replyContent;
			rb.refBno = this.refBno;
			
			return rb;
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
