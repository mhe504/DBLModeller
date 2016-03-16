package uk.ac.york.mhe504.dblm.enhancedmodel;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import org.apache.commons.io.FileUtils;

/**
 * Saves all the table data from an Oracle database as  a
 * CSV file. One file is created per table and named after it.
 * 
 * args[0] the list of target table names
 * 
 */
public class DBtoCSV {

	public static void main (String[] args)
	{
		try {
			List<String> tablelist = FileUtils.readLines(new File(args[0]));
			
			ExecutorService executor = Executors.newFixedThreadPool(20);
			for (String tableName : tablelist)
			{
				tableName = tableName.split(",")[0];
				TableDumper td1 = new TableDumper(tableName);
				executor.execute(td1);
			}				

			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
}

class TableDumper implements Runnable{
	
	 String tableName;
	 public TableDumper(String tname)
	 {
		 tableName = tname;
	 }
	 public void run() {
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				
				Connection connection = null;
				connection = DriverManager.getConnection(
					"jdbc:oracle:thin:@server:1521:SID","username","password");
				Statement stmt = connection.createStatement();
				ResultSet rs = stmt.executeQuery("SELECT * FROM " + tableName);
				ResultSetMetaData meta = rs.getMetaData() ; 
				int numberOfColumns = meta.getColumnCount() ; 
				PrintWriter pw = new PrintWriter(tableName);
				int rowcount =0;
				while (rs.next())
				{
					rowcount++;
					try{
					    String row = rs.getString(1) ; 
					    for (int i = 2 ; i < numberOfColumns + 1 ; i ++ ) {
					        row += "," + rs.getString(i);
					    }
					    pw.println(row);
					}catch (SQLException e)
					{
						
					}
				}
				pw.close();
				connection.close();
				System.out.println(tableName + ": " + rowcount + " rows.");
			} catch (ClassNotFoundException | SQLException | FileNotFoundException e) {
				e.printStackTrace();
			}

	 }
}
