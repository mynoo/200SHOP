package shopping.review.model;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import shopping.common.model.SuperDao;

public class ReviewDao extends SuperDao {

	
	
	
	
	

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

}
