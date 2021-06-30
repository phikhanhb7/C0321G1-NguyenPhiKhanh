package model.repository;

import model.bean.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserRepositoryImpl implements IUserRepository {

    private static final String SORT_BY_NAME_SQL = "select * from user\n" +
            "order by name;";
    @Override
    public List<User> findAll() {
        List<User> userList = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        if (connection != null){
            try {
                statement = connection.prepareStatement("select *from `user` ");
                resultSet = statement.executeQuery();

                User user = null ;
                while (resultSet.next()){
                    int id = resultSet.getInt("id");
                    String name = resultSet.getString("name");
                    String email = resultSet.getString("email");
                    String country = resultSet.getString("country");

                    user = new User(id,name,email,country);
                    userList.add(user);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }finally {
                try {
                    resultSet.close();
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                DBConnection.close();
            }
        }
        return userList ;
    }

    @Override
    public void save(User user) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;

        if (connection!= null) {
            try {
                statement = connection.prepareStatement("insert into `user` (name , email , country) " +
                        "values(?,?,?) ");
                statement.setString(1, user.getName());
                statement.setString(2, user.getEmail());
                statement.setString(3, user.getCountry());


                statement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                DBConnection.close();
            }
        }
    }

    @Override
    public User findById(int id) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null ;
        ResultSet resultSet = null ;
        User user = null ;

        if (connection!= null){


            try {
                statement = connection.prepareStatement("select * from `user` where id = ?");
                statement.setInt(1,id);

                resultSet =  statement.executeQuery();

                while (resultSet.next()){
                    int idUser = resultSet.getInt("id") ;
                    String name = resultSet.getString("name");
                    String email = resultSet.getString("email");
                    String country = resultSet.getString("country");

                    user = new User(idUser,name,email,country);

                }



            } catch (SQLException e) {
                e.printStackTrace();
            }finally {
                try {
                    resultSet.close();
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                DBConnection.close();
            }

        }
        return user;

    }

    @Override
    public boolean remove(int id) {
        boolean rowRemove = false ;
        Connection connection = DBConnection.getConnection() ;
        PreparedStatement statement = null ;

        try {
            statement = connection.prepareStatement("delete from `user` where id = ?");
            statement.setInt(1,id);
            rowRemove = statement.executeUpdate() > 0 ;

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            DBConnection.close();
        }

        return rowRemove ;
    }

    @Override
    public boolean updateByID(int id, User user) {
        boolean rowUpdate = false ;
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null ;


        try {
            statement = connection.prepareStatement("update `user`  set name = ? ,  " +
                    "email = ? , country = ? where id = ? ");
            statement.setString(1,user.getName());
            statement.setString(2,user.getEmail());
            statement.setString(3,user.getCountry());
            statement.setInt(4,id);

            rowUpdate = statement.executeUpdate() >0 ;
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            DBConnection.close();
        }
        return rowUpdate;
    }

    @Override
    public List<User> findByCountry(String country) {
        List<User> userList = new ArrayList<>();
        Connection connection = DBConnection.getConnection();

        PreparedStatement statement = null ;
        ResultSet resultSet = null ;
        User user = null ;

        try {
            statement = connection.prepareStatement("select * from `user` where country like ?");
            statement.setString(1,"%"+country+"%");

            resultSet =  statement.executeQuery();

            while (resultSet.next()){
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String countryUser = resultSet.getString("country");

                user = new User(name,email,countryUser);
                userList.add(user);

            }



        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                resultSet.close();
                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            DBConnection.close();
        }
        return userList;
    }
    public List<User> sortByName(){
        List<User> userList = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SORT_BY_NAME_SQL);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                userList.add(new User(id, name, email, country));
            }
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }

}
