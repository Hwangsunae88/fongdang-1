package kh.spring.fongdang.member.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.fongdang.member.domain.Member;

@Repository
public class MemberDao {
	@Autowired
	private SqlSession sqlSession;

	public Member selectLogin(Member member) {
		return sqlSession.selectOne("Member.selectLogin", member);
	}

	public Member selectMember(String email) {		
		return sqlSession.selectOne("Member.selectMember", email);
	}
	
	public int insertMember(Member member) {
		return sqlSession.insert("Member.insertMember", member);
	}

	public int withdrawMember(String email) {
		return sqlSession.update("Member.withdrawMember", email);
	}

	public int updateMember(Member member) {		
		return sqlSession.update("Member.updateMember", member);
	}

	
}
