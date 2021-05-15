package shopping.review.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import shopping.common.model.SuperDao;
import shopping.product.model.Product;

public class ReviewDao extends SuperDao {

	
	
	public List<Review> SelectDataList(int pno) {
		// 해당 검색 조건에 맞는 모든 데이터를 조회합니다.
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		String sql = " select * from review " ;
		sql += " where pno = ?  " ;
		

		List<Review> lists = new ArrayList<Review>();
		
		try {
			if( conn == null ){ super.conn = super.getConnection() ; }
			pstmt = super.conn.prepareStatement(sql) ;
			
			pstmt.setInt(1, pno);
			
			rs = pstmt.executeQuery() ;	
			
			while( rs.next() ){
				Review bean = new Review();
				
				bean.setPno(rs.getInt("pno"));
				bean.setMid(rs.getString("mid"));				
				bean.setVnum(rs.getInt("vnum"));				
				bean.setVcomment(rs.getString("vcomment"));
				bean.setInputdate(rs.getString("inputdate"));
				
				lists.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			try {
				if( rs != null ){ rs.close(); }
				if( pstmt != null ){ pstmt.close(); }
				super.closeConnection(); 
			} catch (Exception e2) {
				e2.printStackTrace(); 
			}
		}
		
		return lists ;
	}
	
	
	
	
	
	
	
	
	
	

	public int InsertData(Review bean) {
		String sql = " insert into review " ;
		sql += " (" ;
		sql += " vnum, pno, mid, vcomment, inputdate" ;
		sql += " )" ;
		sql += " values" ;
		sql += " (" ;
		sql += " seqreview.nextval, ?, ?, ?, default" ;
		sql += " )" ;		
		
		
		
		PreparedStatement pstmt = null ;
		int cnt = -99999 ;
		try {
			if( conn == null ){ super.conn = super.getConnection() ; }
			conn.setAutoCommit( false );
			pstmt = super.conn.prepareStatement(sql) ;
			
			
			pstmt = null ;
			pstmt = conn.prepareStatement(sql) ;
			
			pstmt.setInt(1, bean.getPno());
			pstmt.setString(2, bean.getMid());
			pstmt.setString(3, bean.getVcomment());			
			
			cnt = pstmt.executeUpdate() ; 
			
			conn.commit(); 
		} catch (Exception e) {
			SQLException err = (SQLException)e ;			
			cnt = - err.getErrorCode() ;			
			e.printStackTrace();
			try {
				conn.rollback(); 
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} finally{
			try {
				if( pstmt != null ){ pstmt.close(); }
				super.closeConnection(); 
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return cnt ;
		
		
	}









	public int DeleteData(int vnum) {
			String sql = " delete from review " ;
			sql += " where vnum = ? " ;

			
			PreparedStatement pstmt = null ;
			int cnt = -99999 ;
			try {
				if( conn == null ){ super.conn = super.getConnection() ; }
				conn.setAutoCommit( false );
				pstmt = super.conn.prepareStatement(sql) ;
				
				pstmt.setInt(1, vnum);
				
				cnt = pstmt.executeUpdate() ; 
				conn.commit(); 
			} catch (Exception e) {
				SQLException err = (SQLException)e ;			
				cnt = - err.getErrorCode() ;			
				e.printStackTrace();
				try {
					conn.rollback(); 
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			} finally{
				try {
					if( pstmt != null ){ pstmt.close(); }
					super.closeConnection(); 
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			return cnt ;
	}

	
	
	
	
	
	
	
}
