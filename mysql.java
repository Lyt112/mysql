import java.sql.*;

public class mysql {
    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");//加载驱动
        String url = "jdbc:mysql://localhost:3306/students?useUnicode=true";
        Connection connection = null;
        connection = DriverManager.getConnection(url, "root", "123456");//数据库连接
        try {
            connection.setAutoCommit(false);//开启事务
            String sql1 = "INSERT INTO `students`.`student` (`studentid`, `name`, `sex`, `age`) VALUES ('15', '王七', '男', `20`)";
            String sql2 = "INSERT INTO `students`.`class` (`classid`, `studentid`, `time`) VALUES ('1', '15', '2023-01-12')";
            PreparedStatement preparedStatement1 = connection.prepareStatement(sql1);
            PreparedStatement preparedStatement2 = connection.prepareStatement(sql2);//获取预处理对象
            preparedStatement1.executeUpdate();
            preparedStatement2.executeUpdate();
            connection.commit();//事务完成正常提交
        } catch (Exception e) {//事务异常，回滚
            if (connection != null) {
                connection.rollback();
            }
        }
        String sql3 = "DELETE from students.student where studentid = 14";//删除学生
        PreparedStatement preparedStatement = connection.prepareStatement(sql3);
        preparedStatement.executeUpdate();
        Statement statement = connection.createStatement();
        String sql = "SELECT * FROM student LIMIT 0,2";//查询学生
        ResultSet resultSet = statement.executeQuery(sql);
        while (resultSet.next()) {
            System.out.println("id=" + resultSet.getObject("studentid"));
            System.out.println("name=" + resultSet.getObject("name"));
            System.out.println("sex=" + resultSet.getObject("sex"));
            System.out.println("age=" + resultSet.getObject("age"));
        }
        resultSet.close();
        statement.close();
        connection.close();//关闭数据库
    }
}
