package com.tech.blog.dao;

import com.tech.blog.entities.User;
import java.sql.*;

public class UserDao {

    private Connection con; //Connection is an interface in the java.sql package that represents a session between a Java application and a database.

    public UserDao(Connection con) {
        this.con = con;
    }

//    method to insert user to db
    public boolean saveUser(User user) {
        boolean f = false;
        try {

            String query = "insert into user(name,email,password,gender,about) values (?,?,?,?,?)";
            PreparedStatement ptst = this.con.prepareStatement(query);
            ptst.setString(1, user.getName());
            ptst.setString(2, user.getEmail());
            ptst.setString(3, user.getPassword());
            ptst.setString(4, user.getGender());
            ptst.setString(5, user.getAbout());

            ptst.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    //get user by email and password:
    public User getUserByEmailAndPassword(String email, String password) {
        User user = null;
        try {

            String query = "select * from user where email=? and password =?";
            PreparedStatement ptst = con.prepareStatement(query);
            ptst.setString(1, email);
            ptst.setString(2, password);

            ResultSet set = ptst.executeQuery();

            if (set.next()) {

            }

            user = new User();
            //data from db
            String name = set.getString("name");
            //set to user obj
            user.setName(name);

            user.setId(set.getInt("id"));
            user.setEmail(set.getString("email"));
            user.setPassword(set.getString("password"));
            user.setGender(set.getString("gender"));
            user.setAbout(set.getString("about"));
            user.setDateTime(set.getTimestamp("rdate"));
            user.setProfile(set.getString("profile"));

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;

    }

    public boolean updateUser(User user) {
        boolean f = false;
        try {
            String query = "update user set name=?,email=?,password=?,about=?,profile=? where id=?";
            PreparedStatement p = con.prepareStatement(query);
            p.setString(1, user.getName());
            p.setString(2, user.getEmail());
            p.setString(3, user.getPassword());
            p.setString(4, user.getAbout());
            p.setString(5, user.getProfile());
            p.setInt(6, user.getId());

            p.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();

        }
        return f;
    }

    public User getUserByUserId(int userId) throws SQLException {
        User user = null;
        try {
            String q = "select * from user where id=?";
            PreparedStatement ps = this.con.prepareStatement(q);
            ps.setInt(1, userId);
            ResultSet set = ps.executeQuery();
            if (set.next()) {

                user = new User();
                //data from db
                String name = set.getString("name");
                //set to user obj
                user.setName(name);

                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setAbout(set.getString("about"));
                user.setDateTime(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

}
