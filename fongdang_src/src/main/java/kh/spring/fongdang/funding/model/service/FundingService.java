package kh.spring.fongdang.funding.model.service;

import java.util.List;

import kh.spring.fongdang.funding.domain.Funding;

public interface FundingService {
	/* 펀딩 상세조회 */
	public Funding selectFunding(int p_no);
	
	/* 펀딩예정 상세조회 */
	public Funding selectBeforeFunding(int p_no, String email);
	
	/* 펀딩 예정 상품 N개 불러오기*/
	public List<Funding> selectPreProducts(int n);
	
	/* 펀딩 예정 상품 불러오기*/
	public List<Funding> selectPreProducts();
	
	/* 펀딩 상품 불러오기*/
	public List<Funding> selectAllProducts();
	/*카테고리 상품 불러오기*/
	public List<Funding> selectCateProducts1(String c1);
	public List<Funding> selectCateProducts2(String c2);
	public List<Funding> selectCateProducts3(String c3);
	public List<Funding> selectCateProducts4(String c4);
	public List<Funding> selectCateProducts5(String c5);
	public List<Funding> selectCateProducts6(String c6);
	/*예정 상품 카테고리 불러오기*/
	public List<Funding> selectCatePreProducts1(String c1);
	public List<Funding> selectCatePreProducts2(String c2);
	public List<Funding> selectCatePreProducts3(String c3);
	public List<Funding> selectCatePreProducts4(String c4);
	public List<Funding> selectCatePreProducts5(String c5);
	public List<Funding> selectCatePreProducts6(String c6);
}
