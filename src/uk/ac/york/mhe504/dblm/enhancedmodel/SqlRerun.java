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
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FileUtils;

/** Executes an Oracle SQL script on a target database.
 *  The result is saved to a file in the following format:
 *  	TABLENAME
 *  	row1Field1, row1Field2, ... row1Fieldn
 * 		row2Field1, row2Field2, ... row2Fieldn
 * 		rownField1, rownField2, ... rownFieldn
 * 
 * args[0] a CSV list of tables in the database with the columns
 * args[1] the file to execute 
 * args[2] the name of the result file
 */
public class SqlRerun {
	
	static Map<String,String> tableMap = new HashMap<String,String>();

	public static void main (String[] args)
	{
		String query = null;
		try {
			List<String> tablelist = FileUtils.readLines(new File(args[0]));
			List<String> file = FileUtils.readLines(new File(args[1]));
			
			for (String s:tablelist)
			{
				int splitPoint = s.indexOf(",");
				String tblName = s.substring(0, splitPoint);
				String cols = s.substring(splitPoint+1);
				tableMap.put(cols, tblName);
			}
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection connection = null;
			connection = DriverManager.getConnection(
				"jdbc:oracle:thin:@host:1521:sid","username","password");
			Statement stmt = connection.createStatement();
			PrintWriter csvWriter = new PrintWriter(new File(args[2])) ;
			for (int i=0;i<file.size();i++)
			{
				query = file.get(i);
				try{
					ResultSet rs = stmt.executeQuery(query);
					convertToCsv(rs,csvWriter,query);
				}catch (java.sql.SQLIntegrityConstraintViolationException e){
					System.out.println("SQLIntegrityConstraintViolationException:" + query);
				}
				catch(java.sql.SQLSyntaxErrorException e)
				{
					System.out.println("SQLSyntaxErrorException:" + query);
				}
				
			}
	        csvWriter.close();
			connection.close();
			
		} catch (ClassNotFoundException | SQLException | IOException e) {
			e.printStackTrace();
		}


	}
	
	public static void convertToCsv(ResultSet rs, PrintWriter csvWriter, String query) throws SQLException, FileNotFoundException {
        
        ResultSetMetaData meta = rs.getMetaData() ; 
        int numberOfColumns = meta.getColumnCount() ; 
        if (numberOfColumns > 0)
        {
	        String allCols = meta.getColumnName(1); 
	        for (int i = 2 ; i < numberOfColumns + 1 ; i ++ ) { 
	                allCols += "," + meta.getColumnName(i);
	        }

	        String table1Name = tableMap.get(allCols);
	        String table2Name = null;
	        String table1Cols = null;
	        String table2Cols = null;
	        if (table1Name == null)
	        {
	        	if (query.contains(" JOIN "))
	        	{
	        		//remove the last
	        		String[] split = allCols.split(",");
	        		String[] newHeaders = Arrays.copyOf(split, split.length-1);
	        		do{
	        	        String h = newHeaders[0]; 
	        	        for (int j = 1 ; j < newHeaders.length; j ++ ) 
	        	        	h += "," + newHeaders[j];
	        	        table1Name = tableMap.get(h);
	        	        if (table1Name == null)
	        	        	newHeaders = Arrays.copyOf(newHeaders, newHeaders.length-1);
	        	        else
	        	        {
	        	        	table1Cols = h;
	        	        	newHeaders = Arrays.copyOfRange(allCols.split(","), newHeaders.length, split.length);
	        	        	h = newHeaders[0]; 
		        	        for (int j = 1 ; j < newHeaders.length; j ++ ) 
		        	        	h += "," + newHeaders[j];
		        	        table2Name = tableMap.get(h);
		        	        table2Cols = h;
		        	        newHeaders=new String[]{""};
	        	        }
	        		}while(newHeaders.length > 1 && table1Name == null);
	        	}
	        	else
	        	{
	        		System.out.println(allCols);
	        		System.exit(0);	        		
	        	}
	        }
	        if (table2Name == null)
	        {
	        	boolean printonce = true;
		        while (rs.next()) {
		        	if (printonce)
		        	{
		        		csvWriter.println(table1Name) ;
		        		printonce = false;
		        	}
		            String row = rs.getString(1) ; 
		            for (int i = 2 ; i < numberOfColumns + 1 ; i ++ ) {
		                row += "," + rs.getString(i);
		            }
		        csvWriter.println(row) ;
		        }
	        }
	        else
	        {
	        	String[] all = allCols.split(",");
	        	String[] one = table1Cols.split(",");
	        	String[] two = table2Cols.split(",");
	        	List<String> oneRows = new ArrayList<String>();
	        	List<String> twoRows = new ArrayList<String>();
	        	
		        
		        while (rs.next()) {
		        	String row = "";
		        	for (int k = 0; k<one.length; k++)
		        	{
		        		//find the position of one(k) in all(k)
		        		int position = 0;
		        		while (!all[position].equals(one[k]))
		        			position++;
		        		row = row + rs.getString(position+1) + ",";
		        	}
		        	oneRows.add(row.substring(0, row.length()-1));
		        	
		        	row = "";
		        	for (int k = 0; k<two.length; k++)
		        	{
		        		//find the position of one(k) in all(k)
		        		int position = 0;
		        		while (!all[position].equals(two[k]))
		        			position++;
		        		row = row + rs.getString(position+1) + ",";
		        	}
		        	twoRows.add(row.substring(0, row.length()-1));
		        }
		        csvWriter.println(table1Name) ;
		        oneRows.forEach(csvWriter::println);
		        csvWriter.println(table2Name) ;
		        twoRows.forEach(csvWriter::println);
	        }

        }
        
    }

}
