import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;

import javax.sql.DataSource;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Connection;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: Qkj
 * Date: 2022-09-03
 * Time: 15:43
 */
public class TestJDBCSelect {
    public static void main(String[] args) throws SQLException {
        DataSource dataSource = new MysqlDataSource();
        ((MysqlDataSource)dataSource).setURL("jdbc:mysql://127.0.0.1:3306/104_test?characterEncoding=utf8&useSSL=false");
        ((MysqlDataSource)dataSource).setUser("root");
        ((MysqlDataSource)dataSource).setPassword("111111");

        // 建立链接
        Connection connection = dataSource.getConnection();

        // 拼装 sql
        String sql = "select * from student";
        PreparedStatement statement = connection.prepareStatement(sql);

        // 执行 sql  结果 是一个 临时表
        ResultSet resultSet = statement.executeQuery();
        // 如何 取出 表的内容  遍历表
        //获取每一行   获取每一行的
        while (resultSet.next()) {

        }
    }
}
