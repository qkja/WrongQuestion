
//
//准备数据库驱动包，并添加到项目的依赖中：
//        在项目中创建文件夹lib，并将依赖包mysql-connector-java-5.1.47.jar复制到lib中。再配置该jar
//        包到本项目的依赖中：右键点击项目Open Module Settings，在Modules中，点击项目，配置
//        Dependencies，点击+，JARS or Directories，将该lib文件夹配置进依赖中，表示该文件夹下的
//        jar包都引入作为依赖。


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
            String sql = "insert into user(username,password) values('马先生','m25')";
            int a = statement.executeUpdate(sql);
            if(a==1){
                System.out.println("数据插入成功");
            }


            PreparedStatement ps = con.prepareStatement("select * from student");
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

public class TestJDBCSelect{
    public static void main(String[] args){
        Sample example = new Sample();
        example.connectToAccess();//连接access
        example.closeConnection();//关闭数据库
    }
}
/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: Qkj
 * Date: 2022-09-03
 * Time: 15:43
 */

//import java.sql.*;
//class Sample  {
//    Connection con=null;//定义数据库连接对象
//    public void connectToAccess(){
//        try{
//            //查找
//            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");//如果查找成功就尝试连接数据库
//            //Driver={Microsoft Access Driver (*.mdb)};DBQ=D:\\java连接access数据库\\Database1.accdb
//            System.out.println(123);
//            con=DriverManager.getConnection("jdbc:odbc:lyang","ly","098");
//            System.out.println(con);
//            System.out.println("Access数据库连接成功");
//            /****实现插入语句************/
//            Statement statement = con.createStatement();
//            String sql = "insert into user(username,password) values('马先生','m25')";
//            int a = statement.executeUpdate(sql);
//            if(a==1){
//                System.out.println("数据插入成功");
//            }
//
//
//            PreparedStatement ps = con.prepareStatement("select * from student");
//            ResultSet rs = ps.executeQuery();
//            while(rs.next())
//                String sno= rs.getString("sno");
//            String sname = rs.getString("sname");
//            String sex = rs.getString("sex");
//            String sage = rs.getString("sage");
//            System.out.println(sno+" "+sname+" "+sex+" "+sage);
//
//        }
//    }catch(Exception e){
//        System.out.println("Access数据库连接错误");
//        System.out.println(e.getMessage());
//    }
//}
//    //关闭
//    public void closeConnection(){
//        try{
//            con.close();
//            System.out.println("数据库关闭成功");
//        }catch(SQLException e){
//            //捕获错误
//            System.out.println("数据库关闭错误");
//            System.out.println(e.getMessage());
//        }
//    }
//}
//public class Text9{
//    public static void main(String[] args){
//        Sample example = new Sample();
//        example.connectToAccess();//连接access
//        example.closeConnection();//关闭数据库
//    }
//}
//public class TestJDBCSelect {
//    public static void main(String[] args) throws SQLException {
//        String str = "hello";
//        System.out.println(str);
////        DataSource dataSource = new MysqlDataSource();
////        ((MysqlDataSource)dataSource).setURL("jdbc:mysql://127.0.0.1:3306/104_test?characterEncoding=utf8&useSSL=false");
////        ((MysqlDataSource)dataSource).setUser("root");
////        ((MysqlDataSource)dataSource).setPassword("111111");
////
////        // 建立链接
////        Connection connection = dataSource.getConnection();
////
////        // 拼装 sql
////        String sql = "select * from student";
////        PreparedStatement statement = connection.prepareStatement(sql);
////
////        // 执行 sql  结果 是一个 临时表
////        ResultSet resultSet = statement.executeQuery();
////        // 如何 取出 表的内容  遍历表
////        //获取每一行   获取每一行的
////        while (resultSet.next()) {
////
////        }
//    }
//}
//import java.sql.*;
//class Sample  {
//    Connection con=null;//定义数据库连接对象
//    public void connectToAccess(){
//        try{
//            //查找
//            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");//如果查找成功就尝试连接数据库
//
//            //Driver={Microsoft Access Driver (*.mdb)};DBQ=D:\\java连接access数据库\\Database1.accdb
//            System.out.println(123);
//
//            con=DriverManager.getConnection("jdbc:odbc:lyang","ly","098");
//            System.out.println(con);
//            System.out.println("Access数据库连接成功");
//
//            /****实现插入语句************/
//            Statement statement = con.createStatement();
//            String sql = "insert into user(username,password) values('马先生','m25')";
//            int a = statement.executeUpdate(sql);
//            if(a==1){
//                System.out.println("数据插入成功");
//            }
//
//
//            PreparedStatement ps = con.prepareStatement("select * from student");
//            ResultSet rs = ps.executeQuery();
//            while(rs.next()) {
//                String sno = rs.getString("sno");
//                String sname = rs.getString("sname");
//                String sex = rs.getString("sex");
//                String sage = rs.getString("sage");
//                System.out.println(sno + " " + sname + " " + sex + " " + sage);
//            }
//
//        } catch(Exception e){
//        System.out.println("Access数据库连接错误");
//        System.out.println(e.getMessage());
//    }
//}
    //关闭
//    public void closeConnection(){
//        try{
//            con.close();
//            System.out.println("数据库关闭成功");
//        }catch(SQLException e){
//            //捕获错误
//            System.out.println("数据库关闭错误");
//            System.out.println(e.getMessage());
//        }
//    }
//}

//import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;
//
//import javax.sql.DataSource;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.sql.Connection;


//import java.sql.*;
//class Sample  {
//    Connection con=null;//定义数据库连接对象
//    public void connectToAccess(){
//        try{
//            DataSource dataSource = new MysqlDataSource();
//           ((MysqlDataSource)dataSource).setURL("jdbc:mysql://127.0.0.1:3306/104_test?characterEncoding=utf8&useSSL=false");
//        ((MysqlDataSource)dataSource).setUser("root");
//        ((MysqlDataSource)dataSource).setPassword("111111");
//
//        // 建立链接
//        con = dataSource.getConnection();
//
//           // ((MysqlDataSource)dataSource).setURL("jdbc:mysql://127.0.0.1:3306/104_test?characterEncoding=utf8&useSSL=false");
//////        ((MysqlDataSource)dataSource).setUser("root");
//////        ((MysqlDataSource)dataSource).setPassword("111111");
//////
//            //查找
////            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");//如果查找成功就尝试连接数据库
////            //Driver={Microsoft Access Driver (*.mdb)};DBQ=D:\\java连接access数据库\\Database1.accdb
////            System.out.println(123);
////            con=DriverManager.getConnection("jdbc:odbc:lyang","ly","098");
//            System.out.println(con);
//            System.out.println("Access数据库连接成功");
//            /****实现插入语句************/
//            Statement statement = con.createStatement();
//            //String sql = "insert into user(username,password) values('马先生','m25')";
//            String sql = "insert into student(id,name) values(8,'m25')";
//            int a = statement.executeUpdate(sql);
//            if(a==1){
//                System.out.println("数据插入成功");
//            }
//
//
//            PreparedStatement ps = con.prepareStatement("select * from students");
//            ResultSet rs = ps.executeQuery();
//            while(rs.next()){
//                String sno= rs.getString("sno");
//            String sname = rs.getString("sname");
//            String sex = rs.getString("sex");
//            String sage = rs.getString("sage");
//            System.out.println(sno+" "+sname+" "+sex+" "+sage);
//
//        }
//    }catch(Exception e){
//        System.out.println("Access数据库连接错误");
//        System.out.println(e.getMessage());
//    }
//}
//    //关闭
//    public void closeConnection(){
//        try{
//            con.close();
//            System.out.println("数据库关闭成功");
//        }catch(SQLException e){
//            //捕获错误
//            System.out.println("数据库关闭错误");
//            System.out.println(e.getMessage());
//        }
//    }
//}
//import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;
//
//        import javax.sql.DataSource;
//        import java.sql.PreparedStatement;
//        import java.sql.ResultSet;
//        import java.sql.SQLException;
//        import java.sql.Connection;
       // Connection con=null;//定义数据库连接对象
//public void connectToAccess(){
//        try{
//        DataSource dataSource = new MysqlDataSource();
//        ((MysqlDataSource)dataSource).setURL("jdbc:mysql://127.0.0.1:3306/104_test?characterEncoding=utf8&useSSL=false");
//        ((MysqlDataSource)dataSource).setUser("root");
//        ((MysqlDataSource)dataSource).setPassword("111111");
//
//        // 建立链接
//        con = dataSource.getConnection();

//import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;
//
//import javax.sql.DataSource;
//import java.sql.*;
//
//class Sample  {
//    Connection con=null;//定义数据库连接对象
//    public void connectToAccess(){
//        try{
//            DataSource dataSource = new MysqlDataSource();
//            //
//            ((MysqlDataSource)dataSource).setURL("jdbc:mysql://127.0.0.1:3306/104_test?characterEncoding=utf8&useSSL=false");
//            ((MysqlDataSource)dataSource).setUser("root");
//            ((MysqlDataSource)dataSource).setPassword("111111");
//
//            // 建立链接
//            con = dataSource.getConnection();
//
//
//            System.out.println("Access数据库连接成功");
//            /****实现插入语句************/
//
//            Statement statement = con.createStatement();
//            String sql = "insert into student(id,name) values(10,'m25')";
//            int a = statement.executeUpdate(sql);
//            if(a==1){
//                System.out.println("数据插入成功");
//            }
//
//
//            PreparedStatement ps = con.prepareStatement("select * from students");
//            ResultSet rs = ps.executeQuery();
//            while(rs.next()){
//                String sno= rs.getString("sno");
//            String sname = rs.getString("sname");
//            String sex = rs.getString("sex");
//            String sage = rs.getString("sage");
//            System.out.println(sno+" "+sname+" "+sex+" "+sage);
//
//        }
//    }catch(Exception e){
//        System.out.println("Access数据库连接错误");
//        System.out.println(e.getMessage());
//    }
//}
//    //关闭
//    public void closeConnection(){
//        try{
//            con.close();
//            System.out.println("数据库关闭成功");
//        }catch(SQLException e){
//            //捕获错误
//            System.out.println("数据库关闭错误");
//            System.out.println(e.getMessage());
//        }
//    }
//}
//public class TestJDBCSelect{
//    public static void main(String[] args){
//        Sample example = new Sample();
//        example.connectToAccess();//连接access
//        example.closeConnection();//关闭数据库
//    }
//}