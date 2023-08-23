package bank;

import java.sql.Connection;
import java.sql.DriverManager;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

@WebListener
public class ConnectionListener implements ServletContextListener {
    public void contextInitialized(ServletContextEvent event) {
        try {
            // Establish the database connection
        	Class.forName("oracle.jdbc.driver.OracleDriver");
            String dbUrl = "jdbc:oracle:thin:@localhost:1521:xe";
            String dbUser = "hdfc";
            String dbPassword = "maihar";

            Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

            // Set the connection as a context attribute
            ServletContext sc = event.getServletContext();
            sc.setAttribute("oracle", conn);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void contextDestroyed(ServletContextEvent event) {
        // Clean up resources if needed
    }
}
