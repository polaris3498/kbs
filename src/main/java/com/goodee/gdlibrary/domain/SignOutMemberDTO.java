package com.goodee.gdlibrary.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SignOutMemberDTO {

	private Long signOutNo;
	private Long memberNo;
	private String memberId;
	private String memberName;
	private String memberPhone;
	private String memberEmail;
	private String memberPostcode;
	private String memberRoadAddress;
	private String memberDetailAddress;
	private Integer memberAgreeState;
	private java.util.Date memberSignUp;
	private java.util.Date signOut;

}
