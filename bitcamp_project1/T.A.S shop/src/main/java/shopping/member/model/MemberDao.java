package shopping.member.model ;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import shopping.common.model.SuperDao;

public class MemberDao extends SuperDao {

	public List<Member> GetManagerList() {
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;

		String sql = " select * from members  " ; 
		sql += " where manager is null " ;	
		sql += " order by name asc " ;
		
		List<Member> lists = new ArrayList<Member>();
		try {
			if( conn == null ){ super.conn = super.getConnection() ; }
			pstmt = super.conn.prepareStatement(sql) ;			
	
			rs = pstmt.executeQuery() ;		
			
			while( rs.next() ){
				Member bean = new Member();
				
				pstmt.setString(1, bean.getId());
				pstmt.setString(2, bean.getName());
				pstmt.setString(3, bean.getPassword());
				pstmt.setString(4, bean.getEmail());
				pstmt.setString(5, bean.getGender());
				pstmt.setString(6, bean.getZipcode());
				pstmt.setString(7, bean.getAddress1());
				pstmt.setString(8, bean.getAddress2());
				pstmt.setString(9, bean.getBirth());
				pstmt.setInt(10, bean.getPoint());					
							 				 
				lists.add( bean ) ;
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
	
	public Member SelectData(String id, String password) {
		Member bean = null ;
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		String sql = " select * from members where id = ? and password = ? " ;
		
		try {
			if(conn == null) {super.conn = super.getConnection() ; }
			pstmt = conn.prepareStatement(sql) ;
			
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			
			rs = pstmt.executeQuery() ; 
			
			if(rs.next()) {
				bean = new Member() ;
				
				pstmt.setString(1, bean.getId());
				pstmt.setString(2, bean.getName());
				pstmt.setString(3, bean.getPassword());
				pstmt.setString(4, bean.getEmail());
				pstmt.setString(5, bean.getGender());
				pstmt.setString(6, bean.getZipcode());
				pstmt.setString(7, bean.getAddress1());
				pstmt.setString(8, bean.getAddress2());
				pstmt.setString(9, bean.getBirth());
				pstmt.setInt(10, bean.getPoint());				
			}
		} catch (Exception e) {			
			e.printStackTrace();
			bean = null ; 
		}finally {
			try {
				if(rs != null) {rs.close();}
				if(pstmt != null) {pstmt.close();} 
				
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return bean ;
	}	
	
	
	public int InsertData( Member bean ){
		String sql = " insert into members(id, name, password, email, gender, zipcode, address1, address2, birth, point) " ; 
		sql += "                    values(?,  ?,    ?,        ?,     ?,      ?,       ?,        ?,        ?,     default ) " ;
		
		PreparedStatement pstmt = null ;
		int cnt = -99999 ;
		try {
			if( conn == null ){ super.conn = super.getConnection() ; }
			conn.setAutoCommit( false );
			pstmt = super.conn.prepareStatement(sql) ;
			
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getName());
			pstmt.setString(3, bean.getPassword());
			pstmt.setString(4, bean.getEmail());
			pstmt.setString(5, bean.getGender());
			pstmt.setString(6, bean.getZipcode());
			pstmt.setString(7, bean.getAddress1());
			pstmt.setString(8, bean.getAddress2());
			pstmt.setString(9, bean.getBirth());
			pstmt.setInt(10, bean.getPoint());			
			
			
			cnt = pstmt.executeUpdate() ; 
			conn.commit(); 
		} catch (Exception e) {
			SQLException err = (SQLException)e ;
			//getErrorCode() : ����Ŭ ���� ����� ����
			//�� : not null �̸� 1400 
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
	public int UpdateData( Member bean ){
		String sql = " " ; 
		sql += " " ;
		sql += " " ;		

		PreparedStatement pstmt = null ;
		int cnt = -99999 ;
		try {
			if( conn == null ){ super.conn = super.getConnection() ; }
			conn.setAutoCommit( false );
			pstmt = super.conn.prepareStatement(sql) ;			
			
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
	public int DeleteData( String id ){		
		String sql ;		
		PreparedStatement pstmt = null ;		
		Member bean = null ;
		int cnt = -99999 ;
		try {
			bean = this.SelectDataByPk(id) ;
			
			if( conn == null ){ super.conn = super.getConnection() ; }
			conn.setAutoCommit( false );
			
			// step01 : 게시물 테이블 remark 컬럼 수정하기
			sql = " update boards set remark = ?  " ;
			sql += " where writer = ? " ;
			pstmt = super.conn.prepareStatement(sql) ;
			
			String imsi = bean.getName() +  "(" + id + ")가 회원 탈퇴를 하였습니다." ;
			pstmt.setString(1, imsi);			
			pstmt.setString(2, id);
			
			cnt = pstmt.executeUpdate() ;
			if(pstmt != null) {pstmt.close();}
			
			// step02 : 매출 테이블 remark 컬럼 수정하기
			sql = " update orders set remark = ? " ;
			sql += " where mid = ? " ;
			pstmt = super.conn.prepareStatement(sql) ;
			
			pstmt.setString(1, imsi);			
			pstmt.setString(2, id);
			
			cnt = pstmt.executeUpdate() ;
			if(pstmt != null) {pstmt.close();}
			
			// step03 : 회원 테이블 행 삭제하기
			sql = " delete from members " ;
			sql += " where id = ? " ;
			pstmt = super.conn.prepareStatement(sql) ;
			pstmt.setString(1, id);			
			cnt = pstmt.executeUpdate() ;
			if(pstmt != null) {pstmt.close();}
			
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
	
	public List<Member> SelectDataList(int beginRow, int endRow) {
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;

		String sql = " select * from members  " ; 
		sql += " order by name asc" ;	
		
		List<Member> lists = new ArrayList<Member>();
		try {
			if( conn == null ){ super.conn = super.getConnection() ; }
			pstmt = super.conn.prepareStatement(sql) ;
			
//			pstmt.setInt(1, beginRow);
//			pstmt.setInt(2, endRow);
			
			rs = pstmt.executeQuery() ;		
			
			while( rs.next() ){
				Member bean = new Member();
				
				pstmt.setString(1, bean.getId());
				pstmt.setString(2, bean.getName());
				pstmt.setString(3, bean.getPassword());
				pstmt.setString(4, bean.getEmail());
				pstmt.setString(5, bean.getGender());
				pstmt.setString(6, bean.getZipcode());
				pstmt.setString(7, bean.getAddress1());
				pstmt.setString(8, bean.getAddress2());
				pstmt.setString(9, bean.getBirth());
				pstmt.setInt(10, bean.getPoint());							
							 				 
				lists.add( bean ) ;
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
	
	public MemberDao() {
		
	}
	public Member SelectDataByPk( String id ){
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;				

		String sql = " select * from members  " ; 
		sql += " where id = ? " ; 

		Member bean = null ;
		
		try {
			if( this.conn == null ){ this.conn = this.getConnection() ; }			
			pstmt = this.conn.prepareStatement(sql) ;			
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery() ;
			
			if ( rs.next() ) {
				bean = new Member(); 

				pstmt.setString(1, bean.getId());
				pstmt.setString(2, bean.getName());
				pstmt.setString(3, bean.getPassword());
				pstmt.setString(4, bean.getEmail());
				pstmt.setString(5, bean.getGender());
				pstmt.setString(6, bean.getZipcode());
				pstmt.setString(7, bean.getAddress1());
				pstmt.setString(8, bean.getAddress2());
				pstmt.setString(9, bean.getBirth());
				pstmt.setInt(10, bean.getPoint());			
				
				
			}
			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally{
			try {
				if( rs != null){ rs.close(); } 
				if( pstmt != null){ pstmt.close(); } 
				this.closeConnection() ;
			} catch (Exception e2) {
				e2.printStackTrace(); 
			}
		} 		
		return bean  ;
	}
	public int SelectTotalCount() {
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;				
		
		String sql = " " ; 
		sql += " " ;
		sql += " " ;		

		
		int cnt = -99999 ;
		try {
			if( this.conn == null ){ this.conn = this.getConnection() ; }			
			pstmt = this.conn.prepareStatement(sql) ;			 
			rs = pstmt.executeQuery() ; 			
			
			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally{
			try {
				if( rs != null){ rs.close(); } 
				if( pstmt != null){ pstmt.close(); } 
				this.closeConnection() ;
			} catch (Exception e2) {
				e2.printStackTrace(); 
			}
		} 		
		return cnt  ; 
	}
	
	public int UpdateMpoint(String id, int mpoint ) {
		String sql = " " ; 
		sql += " " ;
		sql += " " ;		

		PreparedStatement pstmt = null ;
		int cnt = -99999 ;
		try {
			if( conn == null ){ super.conn = super.getConnection() ; }
			conn.setAutoCommit( false );
			pstmt = super.conn.prepareStatement(sql) ;
		
			
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