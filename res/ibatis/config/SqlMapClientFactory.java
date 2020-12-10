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
			// 1. iBatis�� ȯ�� ���� ���� ()sqlMapConfig.xml)�� �о�ͼ� �����Ѵ�.
			// Class LprodIbatisTest ���� //ȯ�漳��
			// 1-1. ���� ���ڵ� ĳ���� �� �����ϱ�
			Charset charset = Charset.forName("UTF-8");
			Resources.setCharset(charset);

			// 1-2. ȯ�� ���� ������ �о�´�.
			rd = Resources.getResourceAsReader("ibatis/config/sqlMapConfig.xml");

			// 1-3. ������ �о�� reader ��ü�� �̿��Ͽ� ���� ȯ�� ������ �ϼ�����
			/////// SQL���� ȣ���ؼ� ������ �� �ִ� ��ü�� �����Ѵ�.
			smc = SqlMapClientBuilder.buildSqlMapClient(rd);

			// ȯ�漳�� ��.~~~~~~~~~~

		} catch (IOException e) {
			e.printStackTrace();
		}

		// factory���� ����°� ���°�. == close or not close????
		finally {
			if (rd != null) {
				try {
					rd.close(); // ��ü �ݱ�
				} catch (IOException e2) {
					// TODO: handle exception
				}
			} // if
		} // finally
	}// static

	// static (���� �޼ҵ�)�� ������ �������ش�.
	// dao���� �޾��� ��쿡 ���� ������ ȯ�漳������ ȣ��
	public static SqlMapClient getSqlMapClient() {
		return smc;
	}

}// class
