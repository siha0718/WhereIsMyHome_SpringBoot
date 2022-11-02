package com.ssafy.sample.model.service;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.sample.dto.Apt;

public interface AptService {	///인터페이스 ==> 명세
	/*
		    서비스 클래스 ==> 사용자관점
	  DAO클래스와 다른점 ==> 관련있는 두개 이상의 메서드를 호출, 호출메서드에 대한 트랜잭션 처리 
					==> Controller와 DAO사이에 위치하여 다리 역할 수행
					==> DB외에 비지니스 로직에 대한 처리를 할 수 있음.

 
	 
	하고싶은 기능을 써주기....
	
	매개변수의 의미 : 1. 조건의 의미   2. 메서드 실행 시 필요한 데이터 전달

	public void regist(DTO);		//일반적으로 이런식으로 매개변수가 들어감(data transfer object)
	public void modify(DTO);		//수정
	public void remove(PK);			
	public DTO info(PK);
	public List<DTO> infos();
	
	
	 
	 리턴 자료형(실행 성공 여부) :  boolean(true, false)
							string(success, run_fail, db_fail 등)
							int : 1,2,3....  ==> (등록, 수정, 삭제) 된 행의 개수 리턴
							   	  0  		 ==> (등록, 수정, 삭제) 된 행이 없음 
	보통 int를 많이 사용하는데, executeUpdate()가 int로 결과를 반환하기 떄문이다. 
	
	*/
	
	
	public int regist(Apt person) throws SQLException;		//등록
	public int modify(Apt person) throws SQLException;
	public int remove(int no) throws SQLException;				//삭제(특정 레코드1개)
	public Apt info(int no) throws SQLException;				//조회(레코드 1개)
	public List<Apt> infos(String dong, int row,String aptName) throws SQLException;			//조회(레코드 여러개)

	
	

}
