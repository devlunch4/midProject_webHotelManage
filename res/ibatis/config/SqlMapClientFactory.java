package ibatis.config;

import java.io.IOException;
import java.io.Reader;
import java.nio.charset.Charset;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

public class SqlMapClientFactory {

	static Reader rd = null;
	static SqlMapClient smc = null;
	static {

		try {
			// 1. iBatis의 환경 설정 파일 ()sqlMapConfig.xml)을 읽어와서 실행한다.
			// Class LprodIbatisTest 복붙 //환경설정
			// 1-1. 문자 인코딩 캐릭터 셋 설정하기
			Charset charset = Charset.forName("UTF-8");
			Resources.setCharset(charset);

			// 1-2. 환경 설정 파일을 읽어온다.
			rd = Resources.getResourceAsReader("ibatis/config/sqlMapConfig.xml");

			// 1-3. 위에서 읽어온 reader 객체를 이용하여 실제 환경 설정을 완성한후
			/////// SQL문을 호출해서 실행할 수 있는 객체를 생성한다.
			smc = SqlMapClientBuilder.buildSqlMapClient(rd);

			// 환경설정 끝.~~~~~~~~~~

		} catch (IOException e) {
			e.printStackTrace();
		}

		// factory에서 지우는가 마는가. == close or not close????
		finally {
			if (rd != null) {
				try {
					rd.close(); // 객체 닫기
				} catch (IOException e2) {
					// TODO: handle exception
				}
			} // if
		} // finally
	}// static

	// static (위의 메소드)이 끝난후 리턴해준다.
	// dao에서 받았을 경우에 따라서 설정된 환경설정값을 호출
	public static SqlMapClient getSqlMapClient() {
		return smc;
	}

}// class
