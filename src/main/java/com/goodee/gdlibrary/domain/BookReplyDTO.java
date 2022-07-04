package com.goodee.gdlibrary.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BookReplyDTO {
	private Long bookReplyNo;
	private Long bookNo;
	private String memberId;
	private String bookReplyContent;
	private java.util.Date bookReplyCreated;
	private Integer bookRating;
}
