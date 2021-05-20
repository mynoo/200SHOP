package shopping.common.model ;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import shopping.reply.model.Reply;

public class DatabaseDao extends SuperDao{

	public List<ShoppingInfo> ShowDetail(int oid) {
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		String sql = "select p.num pnum, p.name pname, od.qty, p.price, p.point, p.image " ; 
		sql += " from ( orders o inner join orderdetails od  ";
		sql += " on o.oid=od.oid ) inner join products p ";
		sql += " on od.pnum = p.num and o.oid = ? "; 
		sql += " order by od.odid desc "; 
		List<ShoppingInfo> lists = new ArrayList<ShoppingInfo>();
		try {
			if( conn == null ){ super.conn = super.getConnection() ; }
			pstmt = super.conn.prepareStatement(sql) ;			
			pstmt.setInt(1, oid); 
			rs = pstmt.executeQuery() ;
			
			while( rs.next() ){
				ShoppingInfo bean = new ShoppingInfo();
				bean.setImage( rs.getString("image") );
				bean.setPname( rs.getString("pname") );
				bean.setPnum( Integer.parseInt( rs.getString("pnum") ));
				bean.setPrice( Integer.parseInt( rs.getString("price") ));
				bean.setQty( Integer.parseInt( rs.getString("qty") ));				 
				 
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
	
	public List<Postcode> SelectDataZipcode(String dong) {		
		Connection conn = null ;
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;

		/* emd_nm : 占쏙옙占쏙옙占쏙옙, rd_nm : 占쏙옙占쏙옙 占싱몌옙, / search_word : 占싯삼옙占쏙옙 占쌤억옙 */ 
		String sql = " select * from  postcodes " ;
		sql += " where emd_nm like '%" + dong + "%' or "  ;
		sql += " rd_nm like '%" + dong + "%' or "  ;
		sql += " search_word like '%" + dong + "%' "  ;
		sql += " order by si_nm, sgg_nm, rd_nm " ;
		
		System.out.println("占쏙옙占싱몌옙 : " + dong);
		
		List<Postcode> lists = new ArrayList<Postcode>();
		try {
			conn = getConnection() ;
			pstmt = conn.prepareStatement(sql) ;			
			 
			rs = pstmt.executeQuery() ;			
			while( rs.next() ){
				Postcode bean = new Postcode();
				//占쏙옙체占쏙옙 占쏙옙占쏙옙占싼댐옙.
				bean.setArea_cd( rs.getString( "area_cd" )) ; 
				bean.setBd_ma_sn( rs.getString( "bd_ma_sn" ));
				bean.setBd_sb_sn( rs.getString( "bd_sb_sn" ));
				bean.setDisplay_word( rs.getString( "display_word" ));
				bean.setDisplay_word_dtail( rs.getString( "display_word_dtail" ));
				bean.setEmd_nm( rs.getString( "emd_nm" ));
				bean.setLndn_ma_sn( rs.getString( "lndn_ma_sn" ));
				bean.setLndn_sb_sn( rs.getString( "lndn_sb_sn" ));
				bean.setMt_yn( rs.getString( "mt_yn" ));
				bean.setRd_nm( rs.getString( "rd_nm" ));
				bean.setRi_nm( rs.getString( "ri_nm" ));
				bean.setSearch_word( rs.getString( "search_word" ));
				bean.setSgg_nm( rs.getString( "sgg_nm" ));
				bean.setSi_nm( rs.getString( "si_nm" ));
				bean.setUdrgrnd_yn( rs.getString( "udrgrnd_yn" ));

				//System.out.println( bean.toString() );
				lists.add( bean ) ;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			try {
				if( rs != null ){ rs.close(); }
				if( pstmt != null ){ pstmt.close(); }
				if( conn != null){ conn.close(); } 
			} catch (Exception e2) {
				e2.printStackTrace(); 
			}
		}
		
		return lists ;
	}

	public int DeletereplyData(int rno) {
		Connection conn = null ;
		String sql = " delete from reply where rno = ? " ;
		PreparedStatement pstmt = null ;
		int cnt = -99999 ;
		try {
			conn = this.getConnection() ; 
			conn.setAutoCommit( false );
			pstmt = conn.prepareStatement(sql) ;
			pstmt.setInt(1, rno);
			
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
				if( conn != null ){ conn.close(); }
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return cnt ;
	}

	public int InsertreplyData(Reply bean) {
		Connection conn = null ;
		System.out.println( bean.toString() ); 

		String sql = " insert into reply( rno, groupno, mid, comment, date) " ;
		sql += " values(seqcomm.nextval, seqcomm.nextval, ?, ?, sysdate ) " ;

		PreparedStatement pstmt = null ;
		int cnt = -99999 ;
		try {
			conn = this.getConnection() ; 
			conn.setAutoCommit( false );
			pstmt = conn.prepareStatement(sql) ;
			
			pstmt.setString(1, bean.getMid() );
			pstmt.setString(2, bean.getcomments() );
			
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
				if( conn != null ){ conn.close(); }
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return cnt ;
	}

	public List<Reply> SelectreplyListByPk(int no) {
		Connection conn = null ;
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;

		String sql = " select * from replys " ;
		sql += " where no = ? order by cnum " ;
		
		List<Reply> lists = new ArrayList<Reply>();
		try {
			conn = getConnection() ;
			pstmt = conn.prepareStatement(sql) ;			
			pstmt.setInt(1, no);
		
			rs = pstmt.executeQuery() ;			
			while( rs.next() ){
				Reply bean = new Reply();
				
				bean.setRno( Integer.parseInt( rs.getString("rno") ));
				bean.setcomments( rs.getString("comment") );
				bean.setGroupno( Integer.parseInt( rs.getString("groupno") ));
				bean.setredate( String.valueOf( rs.getDate("date") ));
				bean.setMid( rs.getString("mid") );
		  
				lists.add( bean ) ;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			try {
				if( rs != null ){ rs.close(); }
				if( pstmt != null ){ pstmt.close(); }
				if( conn != null){ conn.close(); } 
			} catch (Exception e2) {
				e2.printStackTrace(); 
			}
		}
		
		return lists ;
	}
	

}
