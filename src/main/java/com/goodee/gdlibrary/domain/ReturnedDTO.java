package com.goodee.gdlibrary.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ReturnedDTO {
	   private Long returnedNo;
	   private Long bookNo; 
	   private String memberId;
	   private java.util.Date returnedDate;

}
