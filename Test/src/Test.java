/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: Qkj
 * Date: 2022-11-11
 * Time: 19:01
 */
import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;

import javax.sql.DataSource;
import java.sql.*;

class Sample  {
    Connection con=null;//定义数据库连接对象
    public void connectToAccess(){
        try{
            DataSource dataSource = new MysqlDataSource();
            //
            ((MysqlDataSource)dataSource).setURL("jdbc:mysql://127.0.0.1:3306/104_test?characterEncoding=utf8&useSSL=false");
            ((MysqlDataSource)dataSource).setUser("root");
            ((MysqlDataSource)dataSource).setPassword("111111");

            // 建立链接
            con = dataSource.getConnection();


            System.out.println("Access数据库连接成功");
            /****实现插入语句************/

            Statement statement = con.createStatement();
            String sql = "insert into student(id,name) values(23,'m25')";
            int a = statement.executeUpdate(sql);
            if(a==1){
                System.out.println("数据插入成功");
            }


            PreparedStatement ps = con.prepareStatement("select * from students");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                String sno= rs.getString("sno");
                String sname = rs.getString("sname");
                String sex = rs.getString("sex");
                String sage = rs.getString("sage");
                System.out.println(sno+" "+sname+" "+sex+" "+sage);

            }
        }catch(Exception e){
            System.out.println("Access数据库连接错误");
            System.out.println(e.getMessage());
        }
    }
    //关闭
    public void closeConnection(){
        try{
            con.close();
            System.out.println("数据库关闭成功");
        }catch(SQLException e){
            //捕获错误
            System.out.println("数据库关闭错误");
            System.out.println(e.getMessage());
        }
    }
}
public class Test{
    public static void main(String[] args){
        Sample example = new Sample();
        example.connectToAccess();//连接access
        example.closeConnection();//关闭数据库
    }
}
