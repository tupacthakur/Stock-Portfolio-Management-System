
# Stock Portfolio Management System

A Stock Portfolio Management application made using netbeans GUI builder, java and JDBC. 

It enables users to buy, sell stocks and view their Portfolio.

  





## Run Locally

Clone the project

```bash
  git clone https://github.com/UdayrajJhala/E-Notice-Board-Web-App
```

Go to the project directory

```bash
  cd my-project
```

Install JRE on your system

Install MySQL on your system

Install JDBC driver on your system using this link https://dev.mysql.com/downloads/connector/j/

Add the driver to your project as a dependency/referenced library

Run query.sql to create database and required tables.


In DB.java, change the username and password according to your MySQL server
```
con = DriverManager.getConnection("jdbc:mysql://server-address/stock_portfolio_management","username","password");

```

Run LoginPage.java

