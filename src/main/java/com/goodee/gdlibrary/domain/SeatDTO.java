package com.goodee.gdlibrary.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SeatDTO {
   private Long seatNo;   
   private Long memberNo;
   private Integer seatStatus;         
   private java.util.Date seatDate;      
   private String memberId;
   private String memberName;
   private Long seatCode;
}
