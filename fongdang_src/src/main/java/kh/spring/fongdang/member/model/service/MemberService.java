package kh.spring.fongdang.member.model.service;

import kh.spring.fongdang.member.domain.Member;

public interface MemberService {
	
	/* 로그인 */
	public Member selectLogin(Member member);
	
	/* 회원가입 */
	public int insertMember(Member member) ;
	
	
	
	
	
	
	
}
