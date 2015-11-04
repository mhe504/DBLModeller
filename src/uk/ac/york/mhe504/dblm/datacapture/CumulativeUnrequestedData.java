package uk.ac.york.mhe504.dblm.datacapture;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.commons.io.FileUtils;

public class CumulativeUnrequestedData {
	

	private static final String targetFile = "enwiki-latest-all-titles";
	private static Set<String> titleFile = new HashSet<>();

	public static void main(String[] args) throws IOException, InterruptedException {

		
		PrintWriter writer = new PrintWriter(new FileOutputStream(new File("cumulative-output.csv")));
		titleFile.addAll(FileUtils.readLines(new File(targetFile)));
		
		List<String> logFiles  = new ArrayList<>();
		logFiles.add("http://dumps.wikimedia.org/other/pagecounts-ez/merged/pagecounts-2014-07-views-ge-5-totals.bz2");
		logFiles.add("http://dumps.wikimedia.org/other/pagecounts-ez/merged/pagecounts-2014-08-views-ge-5-totals.bz2");
		logFiles.add("http://dumps.wikimedia.org/other/pagecounts-ez/merged/pagecounts-2014-09-views-ge-5-totals.bz2");
		logFiles.add("http://dumps.wikimedia.org/other/pagecounts-ez/merged/pagecounts-2014-10-views-ge-5-totals.bz2");
		logFiles.add("http://dumps.wikimedia.org/other/pagecounts-ez/merged/pagecounts-2014-11-views-ge-5-totals.bz2");
		logFiles.add("http://dumps.wikimedia.org/other/pagecounts-ez/merged/pagecounts-2014-12-views-ge-5-totals.bz2");
		logFiles.add("http://dumps.wikimedia.org/other/pagecounts-ez/merged/pagecounts-2015-01-views-ge-5-totals.bz2");
		logFiles.add("http://dumps.wikimedia.org/other/pagecounts-ez/merged/pagecounts-2015-02-views-ge-5-totals.bz2");
		
		writer.println("file, pages-not-requested");
		for(int i = 0; i< logFiles.size();i=i+2)
		{
			URL logURL = new URL(logFiles.get(i));
			String logPath = logURL.getPath();
			String logFilename = logPath.substring(logPath.lastIndexOf("/")+1, logPath.length());
			
			Thread logDownloader = new Thread(new Downloader(logURL, logFilename));
			logDownloader.start();
			logFilename = logFilename.replace(".bz2", "");
			
			URL logURL2 = new URL(logFiles.get(i+1));
			String logPath2 = logURL2.getPath();
			String logFilename2 = logPath2.substring(logPath2.lastIndexOf("/")+1, logPath2.length());
			
			Thread logDownloader2 = new Thread(new Downloader(logURL2, logFilename2));
			logDownloader2.start();
			logFilename2 = logFilename2.replace(".bz2", "");
			
			logDownloader.join();
			logDownloader2.join();
			String[] grepResult = runCmd("grep -nm1 ^en.z " + logFilename ).split(":");
			String[] wcResult = runCmd("wc -l " + logFilename ).split(" ");
			
			int tail = Integer.parseInt(wcResult[0]) - Integer.parseInt(grepResult[0]);
			runCmd("tail -n " + tail + " " + logFilename + " > tmp_" + logFilename);
			String[] grepResult2 = runCmd("grep -nm1 ^eo.b " + logFilename ).split(":");
			int head = Integer.parseInt(grepResult2[0]);
			head--;
			runCmd("head -n " + head + " tmp_" + logFilename + " > tmp2_" + logFilename);
			
			runCmd("cut -d\" \" -f2 tmp2_" + logFilename + " > " +logFilename);
			
			String[] grepResultB = runCmd("grep -nm1 ^en.z " + logFilename2 ).split(":");
			String[] wcResultB = runCmd("wc -l " + logFilename2 ).split(" ");
			
			int tailB = Integer.parseInt(wcResultB[0]) - Integer.parseInt(grepResultB[0]);
			runCmd("tail -n " + tailB + " " + logFilename2 + " > tmp_" + logFilename2);
			String[] grepResult2B = runCmd("grep -nm1 ^eo.b " + logFilename2 ).split(":");
			int headB = Integer.parseInt(grepResult2B[0]);
			headB--;
			runCmd("head -n " + headB + " tmp_" + logFilename2 + " > tmp2_" + logFilename2);
			runCmd("cut -d\" \" -f2 tmp2_" + logFilename2 + " > " +logFilename2);
			
			Set<String> logFile = new HashSet<>();
			logFile.addAll(FileUtils.readLines(new File(logFilename)));
			titleFile.removeAll(logFile);
			writer.println(logFilename +"," + titleFile.size());
			logFile = new HashSet<>();
			logFile.addAll(FileUtils.readLines(new File(logFilename2)));
			titleFile.removeAll(logFile);
			writer.println(logFilename2 +"," + titleFile.size());
		}
		writer.close();
		
	}
	
    private static String runCmd(String cmd)
    {
		String output = "";
		Process p;
		try {
			System.out.println(cmd);
			String [] cmds = {"/bin/sh" , "-c", cmd};
			p = Runtime.getRuntime().exec(cmds);
			p.waitFor();
			BufferedReader reader = new BufferedReader(new InputStreamReader(p.getInputStream()));
 
			String line = "";			
			while ((line = reader.readLine())!= null) {
				System.out.println(line);
				output += (line + ' ');
			}
 
		} catch (Exception e) {
			e.printStackTrace();
			return output;
		}
		
		System.out.println(output);
		return output;

		
    }

}
