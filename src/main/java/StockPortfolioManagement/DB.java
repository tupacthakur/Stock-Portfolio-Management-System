package StockPortfolioManagement;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author udayj
 */

import java.util.*;
import java.sql.*;

public class DB {
    public static Connection mycon() {
        Connection con=null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stock_portfolio_management","root","Jhala@27");
            System.out.println("connected");
        } catch (Exception e) {
            System.out.println(e);
        }
        return con;
    }
}
