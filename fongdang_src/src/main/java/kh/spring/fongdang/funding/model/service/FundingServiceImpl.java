package kh.spring.fongdang.funding.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.fongdang.funding.domain.Funding;
import kh.spring.fongdang.funding.model.dao.FundingDao;

@Service
public class FundingServiceImpl implements FundingService {
	@Autowired
	private FundingDao dao;

	@Override
	public Funding selectFunding(int p_no) {
		return dao.selectFunding(p_no);
	}

	@Override
	public Funding selectBeforeFunding(int p_no, String email) {
		return dao.selectBeforeFunding(p_no, email);
	}

	@Override
	public List<Funding> selectPreProducts(int n) {
		return dao.selectPreProducts(n);
	}

	@Override
	public List<Funding> selectAllProducts() {
		return dao.selectAllProducts();
	}

	@Override
	public List<Funding> selectPreProducts() {
		return dao.selectPreProducts();
	}
	@Override
	public List<Funding> selectCateProducts1(String C1) {
		return dao.selectCateProducts1(C1);
	}
	@Override
	public List<Funding> selectCateProducts2(String C2) {
		return dao.selectCateProducts2(C2);
	}
	@Override
	public List<Funding> selectCateProducts3(String C3) {
		return dao.selectCateProducts3(C3);
	}
	@Override
	public List<Funding> selectCateProducts4(String C4) {
		return dao.selectCateProducts4(C4);
	}
	@Override
	public List<Funding> selectCateProducts5(String C5) {
		return dao.selectCateProducts5(C5);
	}
	@Override
	public List<Funding> selectCateProducts6(String C6) {
		return dao.selectCateProducts6(C6);
	}
	@Override
	public List<Funding> selectCatePreProducts1(String C1) {
		return dao.selectCatePreProducts1(C1);
	}
	@Override
	public List<Funding> selectCatePreProducts2(String C2) {
		return dao.selectCatePreProducts2(C2);
	}
	@Override
	public List<Funding> selectCatePreProducts3(String C3) {
		return dao.selectCatePreProducts3(C3);
	}
	@Override
	public List<Funding> selectCatePreProducts4(String C4) {
		return dao.selectCatePreProducts4(C4);
	}
	@Override
	public List<Funding> selectCatePreProducts5(String C5) {
		return dao.selectCatePreProducts5(C5);
	}
	@Override
	public List<Funding> selectCatePreProducts6(String C6) {
		return dao.selectCatePreProducts6(C6);
	}

}
