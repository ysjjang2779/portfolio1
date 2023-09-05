package com.kh.semi01.manager.model.service;

import static com.kh.semi01.common.JDBCTemplate.close;
import static com.kh.semi01.common.JDBCTemplate.commit;
import static com.kh.semi01.common.JDBCTemplate.getConnection;
import static com.kh.semi01.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi01.manager.common.model.vo.PageInfo;
import com.kh.semi01.manager.model.dao.MemberDao;
import com.kh.semi01.manager.model.vo.Member;
import com.kh.semi01.user.model.vo.User;

public class MemberService {

	public int selectListCount() {
		Connection conn = getConnection();
		
		int listCount = new MemberDao().selectListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	public ArrayList<User> selectList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<User> list = new MemberDao().selectList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<User> searchMemberByUserNo(int userNo, PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<User> list = new MemberDao().searchMemberByUserNo(conn, userNo, pi);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<User> searchMemberByUserId(String userId, PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<User> list = new MemberDao().searchMemberByUserId(conn, userId, pi);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<User> searchMemberByUserName(String userName, PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<User> list = new MemberDao().searchMemberByUserName(conn, userName, pi);
		
		close(conn);
		
		return list;
	}
	
	public int selectListCountByUserNo(int userNo) {
		Connection conn = getConnection();
		
		int count = new MemberDao().selectListCountByUserNo(conn, userNo);
		
		close(conn);
		
		return count;
	}
	
	public int selectListCountByUserId(String userId) {
		Connection conn = getConnection();
		
		int count = new MemberDao().selectListCountByUserId(conn, userId);
		
		close(conn);
		
		return count;
	}
	
	public int selectListCountByUserName(String userName) {
		Connection conn = getConnection();
		
		int count = new MemberDao().selectListCountByUserName(conn, userName);
		
		close(conn);
		
		return count;
	}
	
	public User selectManagerMember(int userNo) {
		Connection conn = getConnection();
		
		User u = new MemberDao().selectManagerMember(conn, userNo);
		
		close(conn);
		
		return u;
	}
	
	public int updateMember(User u) {
		Connection conn = getConnection();
		
		int result = new MemberDao().updateMember(conn, u);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public int deleteMemberByUserNo(int userNo) {
		Connection conn = getConnection();
		
		int result = new MemberDao().deleteMemberByUserNo(conn, userNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
}
