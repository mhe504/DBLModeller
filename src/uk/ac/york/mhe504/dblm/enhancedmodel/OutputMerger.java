package uk.ac.york.mhe504.dblm.enhancedmodel;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FileUtils;

/**
 * This takes the file produced by SqlRerun and produces a
 * set of files for each accessed table. The file is named after
 * the table and contains all of the unique data accessed.
 * 
 * args[0] a CSV list of tables in the database with the columns
 * args[1] the target file
 * 
 */
public class OutputMerger {
	
	public static void main (String[] args)
	{
		try {
			List<String> tablelist = FileUtils.readLines(new File(args[0]));
			List<String> file = FileUtils.readLines(new File(args[1]));
			
			for (String tableName : tablelist)
			{
				tableName = tableName.split(",")[0];
				Map<String, Integer> records = new HashMap<String, Integer>();
				for (int i = 0; i < file.size(); i++){
					String line = file.get(i);
					if (line.equals(tableName))
					{
						do{
							i++;
							line = file.get(i);
							if (records.containsKey(line))
								records.put(line, records.get(line)+1);
							else
								records.put(line,1);
						}while (i+1 != file.size() && file.get(i+1).contains(","));
					}
				}
				
				PrintWriter pw = new PrintWriter(tableName);
				for (Map.Entry<String, Integer> entry : records.entrySet()) {
					pw.println(entry.getKey()+"\t"+entry.getValue());
				}
				pw.close();
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

}
