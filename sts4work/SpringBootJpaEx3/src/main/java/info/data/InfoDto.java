package info.data;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "info")
public class InfoDto {
	
	@Id // 각 엔티티를 구별할 수 있는 식별자(시퀀스)
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int num;

	@Column
	private String stuname;
	@Column
	private String stuhp;
	@Column
	private String stuaddr;
	@Column
	private String stuphoto;
	

}
