package uk.ac.york.mhe504.dblm.datacapture;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.SortedMap;
import java.util.TreeMap;

import org.apache.commons.io.FileUtils;

/**
 * This class transforms a Oracle JDBC log file into 
 * the CSV input required for DBLModeller.
 * 
 *  @author mhe504@york.ac.uk
 * 
 */
public class OJDBCLogProcessor {
	
	public void execute(File targetFile, String entity) throws IOException, ParseException {

		getOrderedQueryList(targetFile,new File("OrderedQueryList.csv"));
		outputQueryTypeCounts("OrderedQueryList.csv", "Counts.csv");
		resultsToCSV("OrderedQueryList.csv", "measurements.csv", entity,5);
		System.out.println("OJDBC log proccesing finished!");
	}
		
	
	private static void resultsToCSV(String queryList, String outputFile, String databaseEntity, int splits) throws IOException, ParseException {
		
		List<String> file = FileUtils.readLines(new File(queryList));
		
		DateFormat df = new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss", Locale.ENGLISH);
		Date startTime = df.parse(file.get(0).split(";")[0]);
		Date endTime = df.parse(file.get(file.size()-1).split(";")[0]);
		
		List<Date> dates = new ArrayList<>();
		Date current = startTime;
		do
		{
			Calendar cal = Calendar.getInstance();
		    cal.setTime(current);
		    cal.set(Calendar.MINUTE, 0);
		    cal.set(Calendar.SECOND, 0);
		    cal.set(Calendar.MILLISECOND, 0);
		    dates.add(cal.getTime());
		    cal.add(Calendar.HOUR_OF_DAY, 1);
		    current = cal.getTime();
		}while(current.compareTo(endTime)<0);
		
		FileWriter fw = new FileWriter(outputFile,true);
		BufferedWriter bufferWritter = new BufferedWriter(fw);
		bufferWritter.write("[SYSTEM NAME], [SCOPE], " + databaseEntity + "\n");
				 
		for (Date d : dates)
		{
			Calendar cal = Calendar.getInstance(); 
		    cal.setTime(d);
		    cal.set(Calendar.MINUTE, 59);
		    cal.set(Calendar.SECOND, 59);
		    Date end = cal.getTime();
			int reads, writes;
			reads = writes = 0;
			for (int i =2; i < file.size(); i++)
			{
				String sql = file.get(i);
				if (sql.contains(databaseEntity))
				{
					if (sql.matches(".*SELECT.*FROM.*"))		
						reads++;
					else if (sql.matches(".*INSERT INTO.*") || sql.matches(".*DELETE FROM.*") || sql.matches(".*MERGE INTO.*") || sql.matches(".*MERGE INTO.*") || sql.matches(".*UPDATE .*SET.*"))
						writes++;
				}
			}
			bufferWritter.write("[ALAIS]" + ", " + d.toString() + ", " + end.toString() + ", " + reads + ", " + writes + ",[UNUSED ENTITIES] ,[DB SIZE] \n");
		}

        bufferWritter.close();
		
	}


	private static void outputQueryTypeCounts (String logFileName, String outputFileName) throws IOException
	{
		System.out.println("Producing query type counts");
		List<String> file = FileUtils.readLines(new File(logFileName));
		Map<String, Integer> tableSelects = new HashMap<>();
		Map<String, Integer> tableInserts = new HashMap<>();
		Map<String, Integer> tableUpdates = new HashMap<>();
		Map<String, Integer> tableDeletes = new HashMap<>();
		Map<String, Integer> tableMerge = new HashMap<>();
		
		for (int i = 0; i < file.size();i++)
		{
			String sql = file.get(i).split(";")[1];
			countReadWriteFrequenciesVerbose(sql,tableSelects,tableInserts,tableUpdates,tableDeletes,tableMerge);
		}
		
		Set<String> tableNames = new HashSet<>();
		tableNames.addAll(tableSelects.keySet());
		tableNames.addAll(tableInserts.keySet());
		tableNames.addAll(tableDeletes.keySet());
		tableNames.addAll(tableUpdates.keySet());
		tableNames.addAll(tableMerge.keySet());
		
		PrintWriter printer = new PrintWriter(new File(outputFileName));
		printer.println("Tables Accessed, SELECTs, INSERTS, DELETES, UPDATES, MERGES");
		for (String s: tableNames)
		{
			String outputLine = s + ", " + tableSelects.get(s) + ", " + tableInserts.get(s) + ", " + tableDeletes.get(s) + ", " + tableUpdates.get(s) + ", " + tableMerge.get(s);
			printer.println(outputLine.replace("null", "0"));
		}
		printer.close();
		System.out.println("Query type counts complete");
	
	}



	private static void countReadWriteFrequenciesVerbose(String sql, Map<String, Integer> tableSelects, Map<String, Integer> tableInserts, Map<String, Integer> tableUpdates, Map<String, Integer> tableDeletes, Map<String, Integer> tableMerge) {
		
		if (sql.matches(".*SELECT.*FROM.*"))
		{			
			int where = sql.indexOf(" WHERE ");
			if (where == -1) 
				where = sql.length()-1;
			String tablesUsed = sql.substring(sql.indexOf(" FROM ")+6, where).trim();
			
			//Remove join constructs
			tablesUsed = tablesUsed.replaceAll(" ON.*?\\)","").replaceAll(" ON.*?\\Z","");
			tablesUsed = tablesUsed.replace(",","").replace(")", "").replace("(", "");
			tablesUsed = tablesUsed.replaceAll(" INNER JOIN ",",").replaceAll(" LEFT OUTER JOIN ",",").replaceAll(" RIGHT OUTER JOIN ",",").replaceAll(" FULL OUTER JOIN ",",");
			
			
			String[] tableNames = tablesUsed.split(",");
			for (String tableName : tableNames)
			{
				if (!(tableName.toLowerCase().contains("all_cons_columns") | 
					  tableName.toLowerCase().contains("all_tab_columns") |
					  tableName.toLowerCase().contains("all_objects")))
				{
					//Remove Alias
					tableName = tableName.trim();
					int end = tableName.trim().indexOf(' ');
					if (end == -1) 
						end = tableName.length();
					tableName = tableName.substring(0, end);
					
					Integer count = tableSelects.get(tableName);
					if (count != null)
						count++;
					else
						count = 1;
					tableSelects.put(tableName, count);					
				}
			}
		}
		else if (sql.matches(".*INSERT INTO.*\\(.*"))
		{
			
			String tableName = sql.substring(sql.indexOf("INSERT INTO ")+12, sql.length());
			tableName = tableName.trim().substring(0, tableName.indexOf(' '));
			
			Integer count = tableInserts.get(tableName);
			if (count != null)
				count++;
			else
				count = 1;
			tableInserts.put(tableName, count);	
		}
		else if (sql.matches(".*DELETE FROM.*WHERE.*"))
		{
			
			String tableName = sql.substring(sql.indexOf("DELETE FROM ")+12, sql.length());
			tableName = tableName.trim().substring(0, tableName.indexOf(' '));
			
			Integer count = tableDeletes.get(tableName);
			if (count != null)
				count++;
			else
				count = 1;
			tableDeletes.put(tableName, count);	
		}
		else if (sql.matches(".*MERGE INTO.*"))
		{
			
			String tableName = sql.substring(sql.indexOf("MERGE INTO ")+11, sql.length());
			tableName = tableName.trim().substring(0, tableName.indexOf(' '));
			
			Integer count = tableMerge.get(tableName);
			if (count != null)
				count++;
			else
				count = 1;
			tableMerge.put(tableName, count);	
		}		
		else if (sql.matches(".*UPDATE .*SET.*"))
		{
			
			String tableName = sql.substring(sql.indexOf("UPDATE ")+7, sql.indexOf(" SET"));
			Integer count = tableInserts.get(tableName);
			if (count != null)
				count++;
			else
				count = 1;
			tableInserts.put(tableName, count);	
		}
		
	}


	private void getOrderedQueryList(File f, File output) throws IOException, ParseException, FileNotFoundException {

		System.out.println("Producing OrderQueryList for " + f.toString());
		SortedMap<Date, List<String>> map = new TreeMap<>();

		List<String> lines = FileUtils.readLines(f);
		System.out.println("\tLoaded:" + f.toString());
		System.out.println("\tStarted Proccessing");
		for (int i = 0; i < lines.size();i++)
		{
			String sql = "";
			String timestamp = "";
			if (lines.get(i).contains(" SQL: "))
			{
				timestamp = lines.get(i-1).substring(0,20).replace(",", "");
				do {
					sql = sql + " " + lines.get(i);
					i++;

				} while (i < lines.size() && !lines.get(i).contains("oracle.jdbc.driver.OracleStatement doExecuteWithTimeout") );

				sql = sql.trim();
				sql = sql.replaceAll("^CONFIG: .* SQL: ", "");
				sql = sql.split("java\\.lang\\.Throwable")[0];
				sql = sql.replaceAll("(\n|\r)", "");
				sql = sql.replaceAll("       ", " ");
				sql = sql.replaceAll("    ", " ");

				SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss");
				Date date = dateFormat.parse(timestamp);

				if (map.containsKey(date))
				{
					List<String> values = map.get(date);
					values.add(sql);
					map.put(date, values);
				}
				else
				{
					List<String> values = new ArrayList<String>();
					values.add(sql);
					map.put(date, values);
				}

			}
			
		}

		saveTreeMap(map,output);
		System.out.println("OrderQueryList saved");
	}

	private static void saveTreeMap(SortedMap<Date, List<String>> map, File output) throws FileNotFoundException {


		PrintWriter printer = new PrintWriter(output);

		for (Entry<Date, List<String>> entry : map.entrySet()) {

			Date date = entry.getKey();
			SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss");
			String timestamp = dateFormat.format(date);
			List<String> values = entry.getValue();

			for (String value : values)
			{
				printer.println(timestamp + ";" + value);
			}

		}

		printer.close();
	}
	

}
