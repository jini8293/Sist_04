package board.data;

import java.sql.Timestamp;

import org.hibernate.annotations.CreationTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "jpaboard")
public class BoardDto {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long num;
	
	@Column(updatable = false)
	private String writer;
	@Column
	private String subject;
	@Column
	private String content;
	@Column
	private String photo;
	
	@CreationTimestamp
	@Column(updatable = false)
	private Timestamp writeday;
	

}
