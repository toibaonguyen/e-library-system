package com.toibaonguyen.eLibrarySystem.common.dao;

import com.mysql.cj.jdbc.ConnectionImpl;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;

public class DBConnectionPool {
    private static DBConnectionPool instance;
    private final BlockingQueue<Connection> pool;

    private DBConnectionPool()
    {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            InputStream is = getClass().getClassLoader().getResourceAsStream("config/config.properties");
            if (is == null) {
                throw new RuntimeException("File config.properties not found!");
            }
            Properties properties=new Properties();
            properties.load(is);
            String dbUrl = properties.getProperty("db.url");
            String dbUser = properties.getProperty("db.user");
            String dbPassword = properties.getProperty("db.password");
            int poolSize = Integer.parseInt(properties.getProperty("db.connection_pool_size"));
            pool= new LinkedBlockingQueue<>(poolSize);
            for (int i=0;i<poolSize;i++)
            {
                pool.add(DriverManager.getConnection(dbUrl, dbUser, dbPassword));
            }

        } catch (ClassNotFoundException | IOException | SQLException e) {
            throw new RuntimeException(e);
        }
    }

    static public DBConnectionPool getInstance()
    {
        if(instance==null)
        {
            instance=new DBConnectionPool();
        }
        return instance;
    }

    public Connection getConnection() throws InterruptedException {
        return pool.take();
    }

    public boolean releaseConnection(Connection connection) {
        return pool.offer(connection);
    }
}
