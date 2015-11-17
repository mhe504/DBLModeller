package uk.ac.york.mhe504.dblm.datacapture;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.SortedMap;
import java.util.TreeMap;

import org.apache.commons.io.FileUtils;

public class OJDBCLogProcessor {

	/* Input: folder of JDBC log files
	 * Output: CSV metric file for the SMM transformation. A CSV file for each time interval
	 * listing the tables and the queries received for each.
	 * 
	 */
	
	public void execute(File targetFile, String entity) throws IOException, ParseException {

		getOrderedQueryList(targetFile,new File("OrderedQueryList.csv"));
		outputQueryTypeCounts("OrderedQueryList.csv", "Counts.csv");
		resultsToCSV("Counts.csv", "measurements.csv", entity);		
	}
		
	
	private static void resultsToCSV(String metricFile, String outputFile, String databaseEntity) throws IOException {
		
		List<String> file = FileUtils.readLines(new File(metricFile));
		String[] timestamps = file.get(0).split(",");
		int reads, writes;
		reads = writes = 0;
		
		for (int i =2; i < file.size(); i++)
		{
			if (file.get(i).contains(databaseEntity))
			{
				String[] line = file.get(i).split(",");
				reads = Integer.valueOf(line[1].trim());
				writes = Integer.valueOf(line[2].trim()) + Integer.valueOf(line[3].trim()) + Integer.valueOf(line[4].trim()) + Integer.valueOf(line[5].trim());
			}
			
		}
		
		String fileNameOnly = Paths.get(metricFile).getFileName().toString();
		File output = new File(outputFile);
		if (!output.exists())
			output.createNewFile();

		FileWriter fw = new FileWriter(output,true);
		BufferedWriter bufferWritter = new BufferedWriter(fw);
        bufferWritter.write(fileNameOnly + ", " + timestamps[0] + ", " + timestamps[1] + ", " + reads + ", " + writes + ", , \n");
        bufferWritter.close();
		
	}


	private static void outputQueryTypeCounts (String logFileName, String outputFileName) throws IOException
	{
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

		SortedMap<Date, List<String>> map = new TreeMap<>();

		List<String> lines = FileUtils.readLines(f);
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
