package kr.or.ddit.util;

import java.io.IOException;
import java.io.Reader;
import java.nio.charset.Charset;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisUtil {
	
	private static SqlSessionFactory sqlSessionFactory;
	
	static {
		
		try {
			// 1-1. �꽕�젙�뙆�씪�쓣 �씫湲� �쐞�븳 Reader媛앹껜 �깮�꽦�븯湲�
			// �꽕�젙�뙆�씪�쓽 �씤肄붾뵫 �젙蹂� �꽕�젙(�븳湲�泥섎━瑜� �쐞�빐�꽌...)
			Charset charset = Charset.forName("UTF-8"); 
			Resources.setCharset(charset);
			Reader rd = Resources.getResourceAsReader(
					"config/mybatis-config.xml");
			
			// 1-2. Reader媛앹껜瑜� �궗�슜�븯�뿬 SqlSessionFactory媛앹껜 �깮�꽦�븯湲�
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(rd);
			rd.close(); // �옄�썝諛섎궔
			
		} catch (IOException ex) {
			ex.printStackTrace();
		}
	}
	
	/**
	 * SqlSession媛앹껜瑜� �젣怨듯븯湲� �쐞�븳 硫붿꽌�뱶
	 * @return SqlSession媛앹껜
	 */
	public static SqlSession getSqlSession() {
		return sqlSessionFactory.openSession(); // 湲곕낯媛� : autoCommit false.
	}
	
	/**
	 * SqlSession媛앹껜瑜� �젣怨듯븯湲� �쐞�븳 硫붿꽌�뱶
	 * @param autoCommit autoCommit �뿬遺�媛�
	 * @return SqlSession媛앹껜
	 */
	public static SqlSession getSqlSession(boolean autoCommit) {
		return sqlSessionFactory.openSession(autoCommit);
	}
}
