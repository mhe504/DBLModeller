package uk.ac.york.mhe504.dblm.datacapture;
import static org.grep4j.core.Grep4j.constantExpression;
import static org.grep4j.core.Grep4j.grep;
import static org.grep4j.core.fluent.Dictionary.on;
import static org.grep4j.core.options.Option.lineNumber;
import static org.grep4j.core.options.Option.maxMatches;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLConnection;
import java.text.DateFormatSymbols;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.io.FileUtils;
import org.grep4j.core.model.Profile;
import org.grep4j.core.model.ProfileBuilder;

/**
 * This class downloads the Wikipedia log files and database
 * dumps, then uses these to produce CSV input required for 
 * DBLModeller.
 * 
 * @author mhe504@york.ac.uk
 *
 */
public class WikipediaLogProcessor {

	private Map<String, Long> requests = new HashMap<> ();
	private Map<String, Long> pages = new HashMap<> ();
	private Map<String, Long> pagesNotRequested = new HashMap<> ();
	private Map<String, Long> dbSizes = new HashMap<> ();
	private Map<String, Long> totalEdits = new HashMap<> ();
	
	private Set<String> logFile;
	private Set<String> titleFile;
	
	private Map<String, String> urls = new HashMap<>();
	private Map<String, String> completeDbDumpURLs = new HashMap<>();
	private Map<String, String> siteStatsSqlURLs = new HashMap<>();

	
	public void execute(String urls_file) throws Exception {
		
	    loadFileURLs(urls_file);
	    
	    for (Map.Entry<String, String> entry : urls.entrySet()) {
	    		
			//Log File					
			URL logURL = new URL(entry.getKey());
			String logPath = logURL.getPath();
			String logFilename = logPath.substring(logPath.lastIndexOf("/")+1, logPath.length());
			
			
			Thread logDownloader = new Thread(new Downloader(logURL, logFilename));
			logDownloader.start();

			//Title File    
	        URL titleListURL = new URL(entry.getValue());
			String titlePath = titleListURL.getPath();
			String titleFilename = titlePath.substring(titlePath.lastIndexOf("/")+1, titlePath.length());
			
			Thread titleDownloader = new Thread(new Downloader(titleListURL, titleFilename));
			titleDownloader.start();
			
			logDownloader.join();
			titleDownloader.join();
			
			String extractedLogFilename = logFilename.replace(".bz2", "");
			
			loadLogFile(extractedLogFilename);

			String extractedTitleFileName = titleFilename.replace(".gz", "");
			loadTitleFile(extractedTitleFileName, extractedLogFilename);

			titleFile.removeAll(logFile);
			pagesNotRequested.put(extractedLogFilename, Long.valueOf(titleFile.size()));

			//site stats
	        URL statsURL = new URL(siteStatsSqlURLs.get(entry.getKey()));
			String statsPath = statsURL.getPath();
			String statsFilename = statsPath.substring(statsPath.lastIndexOf("/")+1, statsPath.length());
			
			Thread statsDownloader = new Thread(new Downloader(statsURL, statsFilename));
			statsDownloader.start();
			statsDownloader.join();

			//Dump File
			URL dumpURL = new URL(completeDbDumpURLs.get(entry.getKey()));
			URLConnection openConnection = dumpURL.openConnection();
			dbSizes.put(extractedLogFilename, openConnection.getContentLengthLong());
			System.out.println("Size of " + dumpURL.toString() + ": " + openConnection.getContentLengthLong() + " bytes");
			
			
			List<String> sqlStats = FileUtils.readLines(new File(statsFilename.replace(".gz", "")));
			
			totalEdits.put(extractedLogFilename, Long.parseLong(sqlStats.get(42).split(",")[2]));
		    
			saveResult();
		}
		

	}
	
	private void saveResult() {
		try {
			PrintWriter writer = new PrintWriter(new FileOutputStream(new File("output.csv")));
			writer.println("PeriodAlias, PeriodStart, PeriodEnd, EntityCount, EntityReads, EntityWrites, UnusedEntities, DatabaseSize");
			Set<String> keySet = requests.keySet();
			String[] keys = keySet.toArray(new String[keySet.size()]);
						
			
			for (int i = 0; i < requests.size(); i++)
			{
				String month, year,alias, startPeriod, endPeriod, fileSize;
				year = keys[i].split("-")[1];
				month = keys[i].split("-")[2];
				startPeriod = year + "-" + month + "-" + "01 00:00:00";

				Calendar c = Calendar.getInstance();
				c.set(Integer.valueOf(year), Integer.valueOf(month), 1);
				c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH));
				Date lastDayOfMonth = c.getTime();
				endPeriod = new SimpleDateFormat("yyyy-MM-dd").format(lastDayOfMonth);
				endPeriod = endPeriod + " 23:59:59";

				month = new DateFormatSymbols().getMonths()[Integer.valueOf(month)-1];
				alias = month + year;
				
				fileSize = Long.toString(dbSizes.get(keys[i]) / 1024 /1024) + "MB";
				
				writer.println(alias + ", " + 
							   startPeriod + ", " + 
							   endPeriod + ", " + 
							   pages.get(keys[i]) + ", " + 
							   requests.get(keys[i])  + ", " + 
							   totalEdits.get(keys[i]) + ", " +
							   pagesNotRequested.get(keys[i]) + ", " +
							   fileSize);
			}
			
			writer.close();
			
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		
		
	}

	private void loadTitleFile(String targetFile, String id) {
		
		System.out.println("loadTitleFile(" + targetFile + "," + id + ") : starting");
		
	    try {
			titleFile = new HashSet<String>();
			long startTime = System.currentTimeMillis();
			
			titleFile.addAll(FileUtils.readLines(new File(targetFile)));
			pages.put(id, Long.valueOf(titleFile.size()));
			System.out.println(targetFile  + ": " + pages.size());
			
			long endTime = System.currentTimeMillis();
			System.out.println("loadTitleFile complete - " + ((endTime - startTime) / 1000) + "s");
	    }catch (IOException e) {
	    	e.printStackTrace();
	    }
	}

	private void loadLogFile(String targetFile){
	    try {
			System.out.println("loadLogFile(" + targetFile + ") : starting");
			long startTime = System.currentTimeMillis();
			
			logFile = new HashSet<String>();
			
			Profile localProfile = ProfileBuilder.newBuilder()
	                .name("profile1")
	                .filePath(targetFile)
	                .onLocalhost()
	                .build();
			
			String result_start = grep(constantExpression("^en.z"), on(localProfile), lineNumber(), maxMatches(1)).toString();
			System.out.println("grep '^en.z' -nm1 " + targetFile + ": " + result_start);
			int start = Integer.valueOf(result_start.substring(0, result_start.indexOf(':')));
	
			String result_end = grep(constantExpression("^eo.b"), on(localProfile), lineNumber(), maxMatches(1)).toString();
			System.out.println("grep '^eo.b' -nm1 " + targetFile + ": " + result_end);
			int finish = (Integer.valueOf(result_end.substring(0, result_end.indexOf(':')))-1);
	
			List<String> lines =  FileUtils.readLines(new File(targetFile));
		
			long requestCount = 0l;
			for (int k = start; k<=finish;k++)
			{
				requestCount = requestCount + Long.parseLong(lines.get(k).split(" ")[2]);
				logFile.add(lines.get(k).split(" ")[1]);
			}
			System.out.println(targetFile + ": " + logFile.size());
			requests.put(targetFile, requestCount);
			long endTime = System.currentTimeMillis();
			System.out.println("loadLogFile complete - " + ((endTime - startTime) / 1000) + "s");
	    }catch (IOException e) {
	    	e.printStackTrace();
	    }
	
	}

	private void loadFileURLs(String url_file) {
	    try {
	    	List<String> allLines  = FileUtils.readLines(new File(url_file));
	    	
	    	for (String s : allLines){
	    		urls.put(s.split(",")[0], s.split(",")[1]);
	    		completeDbDumpURLs.put(s.split(",")[0], s.split(",")[2]);
	    		siteStatsSqlURLs.put(s.split(",")[0], s.split(",")[3]);
	    	}
	    	
	    	System.out.println("loadFileURLs() : " + allLines.size() + " lines loaded");

	    }catch (IOException e) {
	    	e.printStackTrace();
	    }
	}

}
