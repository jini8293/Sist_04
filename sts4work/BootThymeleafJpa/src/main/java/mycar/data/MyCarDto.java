package mycar.data;

import java.sql.Timestamp;

import org.hibernate.annotations.CreationTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@Table(name = "mycar")
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MyCarDto {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long num;
	
	@Column
	private String carname;
	@Column
	private String carprice;
	@Column
	private String carcolor;
	@Column
	private String carphoto;
	
	@Column(updatable = false)
	@CreationTimestamp
	private Timestamp writeday;
	
	@Transient //테이블의 컬럼으로 생성되지 않고, 객체에서는 사용가능한 멤버변수
	private int commentcount;
	
	@Transient
	private String message;
	
	

}
