package uk.ac.york.mhe504.dblm.enhancedmodel;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import org.apache.commons.io.FileUtils;


/**
 * Merges two sets of table data CSV files
 * 
 * args[0] tables.csv
 * args[1] folder containing the access data files
 * args[2] folder containing the database table dump files
 * args[3] folder to save the output
 */
public class DumpMerger {
	
	public static void main (String[] args)
	{

		try {
			List<String> tablelist = FileUtils.readLines(new File(args[0]));
			ExecutorService executor = Executors.newFixedThreadPool(32);
			for (String tableName : tablelist)
			{
				tableName = tableName.split(",")[0];
				Merger m = new Merger(tableName, args);
				executor.execute(m);
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

	}

}

class Merger implements Runnable{
	
	 String tableName;
	 String[] args;
	 public Merger(String tname, String[] a)
	 {
		 tableName = tname;
		 args = a;
	 }
	 public void run() {
			try {
				List<String> accessFile = FileUtils.readLines(new File(args[1] + java.io.File.separator +tableName));
				List<String> dumpFile = FileUtils.readLines(new File(args[2] + java.io.File.separator +tableName));
				
				PrintWriter pw = new PrintWriter(args[3] + java.io.File.separator +tableName);
				for (String dline : dumpFile)
				{
					for (String aline: accessFile)
					{
						if (aline.split("\t")[0].equals(dline))
							pw.println(aline);
						else
							pw.println(dline + "\t 0");
					}
				}
				pw.close();
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

	 }
}
