package com.goodee.gdlibrary.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MemberLogDTO {

	private Long memberLogNo;
	private String memberId;
	private java.util.Date memberLogSignIn;



}
