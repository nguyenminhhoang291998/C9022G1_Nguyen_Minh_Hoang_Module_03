package com.example.user_manager.repository.impl;

import com.example.user_manager.model.User;
import com.example.user_manager.repository.BaseRepository;
import com.example.user_manager.repository.IUserRepository;

import java.math.BigDecimal;
import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository {

    private static final String INSERT_USERS_SQL = "INSERT INTO users (name, email, country) VALUES (?, ?, ?);";
    private static final String SELECT_USER_BY_ID = "select id,name,email,country from users where id =?";

    private static final String SELECT_USER_BY_COUNTRY = "select id,name,email,country from users where country =?";

    private static final String SELECT_ALL_USERS = "select * from users";
    private static final String SP_SELECT_ALL_USERS = "CALL select_all_user";
    private static final String DELETE_USERS_SQL = "delete from users where id = ?;";
    private static final String SP_DELETE_USERS_SQL = "CALL delete_user(?)";
    private static final String UPDATE_USERS_SQL = "update users set name = ?,email= ?, country =? where id = ?;";
    private static final String SP_UPDATE_USERS_SQL = "CALL update_user(?,?,?,?)";

    private static final String SQL_INSERT = "INSERT INTO EMPLOYEE (NAME, SALARY, CREATED_DATE) VALUES (?,?,?)";

    private static final String SQL_UPDATE = "UPDATE EMPLOYEE SET SALARY=? WHERE NAME=?";

    private static final String SQL_TABLE_CREATE = "CREATE TABLE EMPLOYEE"

            + "("

            + " ID serial,"

            + " NAME varchar(100) NOT NULL,"

            + " SALARY numeric(15, 2) NOT NULL,"

            + " CREATED_DATE timestamp,"

            + " PRIMARY KEY (ID)"

            + ")";

    private static final String SQL_TABLE_DROP = "DROP TABLE IF EXISTS EMPLOYEE";



    @Override
    public boolean insertUser(User user) {
        try {
            Connection connection = BaseRepository.getConnectDB();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL);
            preparedStatement.setString(1,user.getName());
            preparedStatement.setString(2,user.getEmail());
            preparedStatement.setString(3,user.getCountry());
            return preparedStatement.executeUpdate() >0;
        } catch (SQLException e) {
            e.getStackTrace();
        }
        return false;
    }

    @Override
    public User selectUser(int id) {
        User user = null;
        try {
            Connection connection = BaseRepository.getConnectDB();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);
            preparedStatement.setInt(1,id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                user = new User(id,name,email,country);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return user;
    }

    @Override
    public List<User> selectAllUsers() {
        List<User> userList = new ArrayList<>();
        try {
            Connection connection = BaseRepository.getConnectDB();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt(1);
                String name = resultSet.getString(2);
                String email = resultSet.getString(3);
                String country = resultSet.getString(4);
                userList.add(new User(id,name,email,country));
            }

        } catch (SQLException e) {
            e.getStackTrace();
        }
        return userList;
    }

    @Override
    public boolean deleteUser(int id) {
        try {
            Connection connection = BaseRepository.getConnectDB();
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_USERS_SQL);
            preparedStatement.setInt(1,id);
            return preparedStatement.executeUpdate()>0;
        } catch (SQLException e) {
            e.getStackTrace();
        }
        return false;
    }

    @Override
    public boolean updateUser(User user) {
        try {
            Connection connection = BaseRepository.getConnectDB();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USERS_SQL);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            preparedStatement.setInt(4, user.getId());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.getStackTrace();
        }
        return false;
    }

    @Override
    public List<User> findByCountry(String country) {
        List<User> userList = new ArrayList<>();
        try {
            Connection connection = BaseRepository.getConnectDB();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_COUNTRY);
            preparedStatement.setString(1,country);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                int id = resultSet.getInt("id");
                userList.add(new User(id,name,email,country));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return userList;
    }

    @Override
    public User getUserById(int id) {
        User user =null;
        String query = "{CALL get_user_by_id(?)}";
        try {
            Connection connection = BaseRepository.getConnectDB();
            CallableStatement callableStatement = connection.prepareCall(query);
            callableStatement.setInt(1,id);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()){
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                user = new User(id, name, email, country);
            }
        } catch (SQLException e) {
            e.getStackTrace();
        }
        return user;
    }

    @Override
    public boolean insertUserStore(User user) {
        String query = "{CALL insert_user(?,?,?)}";
        try {
            Connection connection = BaseRepository.getConnectDB();
            CallableStatement callableStatement = connection.prepareCall(query);
            callableStatement.setString(1,user.getName());
            callableStatement.setString(2,user.getEmail());
            callableStatement.setString(3,user.getCountry());
            return callableStatement.executeUpdate()>0;
        } catch (SQLException e) {
            e.getStackTrace();
        }
        return false;
    }

    @Override
    public void addUserTransaction(User user, int[] permisions) {
        try {
            Connection connection = BaseRepository.getConnectDB();
            connection.setAutoCommit(false);
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL,Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
             int rowAffected = preparedStatement.executeUpdate();

             ResultSet resultSet = preparedStatement.getGeneratedKeys();
            int userId = 0;
            if(resultSet.next())
                userId = resultSet.getInt(1);

            if(rowAffected == 1){
                preparedStatement = connection.prepareStatement("INSERT INTO user_permision(user_id,permision_id) VALUES(?,?)");
                for (int pms: permisions) {
                    preparedStatement.setInt(1,userId);
                    preparedStatement.setInt(2,pms);
                    preparedStatement.executeUpdate();
                }
                connection.commit();
            }else {
                connection.rollback();
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void insertUpdateWithoutTransaction() {
        try (Connection conn = BaseRepository.getConnectDB();
             Statement statement = conn.createStatement();
             PreparedStatement psInsert = conn.prepareStatement(SQL_INSERT);
             PreparedStatement psUpdate = conn.prepareStatement(SQL_UPDATE)) {
            statement.execute(SQL_TABLE_DROP);
            statement.execute(SQL_TABLE_CREATE);
            psInsert.setString(1, "Quynh");
            psInsert.setBigDecimal(2, new BigDecimal(10));
            psInsert.setTimestamp(3, Timestamp.valueOf(LocalDateTime.now()));
            psInsert.execute();
            psInsert.setString(1, "Ngan");
            psInsert.setBigDecimal(2, new BigDecimal(20));
            psInsert.setTimestamp(3, Timestamp.valueOf(LocalDateTime.now()));
            psInsert.execute();
            psUpdate.setBigDecimal(2, new BigDecimal(999.99));
            psUpdate.setString(2, "Quynh");
            psUpdate.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<User> selectAllUseCallable(){
        List<User> userList = new ArrayList<>();
        try {
            Connection connection = BaseRepository.getConnectDB();
            CallableStatement callableStatement = connection.prepareCall(SP_SELECT_ALL_USERS);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt(1);
                String name = resultSet.getString(2);
                String email = resultSet.getString(3);
                String country = resultSet.getString(4);
                userList.add(new User(id,name,email,country));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return userList;
    }

    public boolean updateUserUseCallable(User user){
        try {
            Connection connection = BaseRepository.getConnectDB();
            CallableStatement callableStatement = connection.prepareCall(SP_UPDATE_USERS_SQL);
            callableStatement.setInt(1,user.getId());
            callableStatement.setString(2,user.getName());
            callableStatement.setString(3,user.getEmail());
            callableStatement.setString(4,user.getCountry());
            return callableStatement.executeUpdate()>0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public boolean deleteUserUseCallable(int id) {
        try {
            Connection connection = BaseRepository.getConnectDB();
            CallableStatement callableStatement = connection.prepareCall(SP_DELETE_USERS_SQL);
            callableStatement.setInt(1,id);
            return callableStatement.executeUpdate()>0;
        } catch (SQLException e) {
            e.getStackTrace();
        }
        return false;
    }
}
