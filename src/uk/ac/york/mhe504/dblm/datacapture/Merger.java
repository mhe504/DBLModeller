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
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.grep4j.core.model.Profile;
import org.grep4j.core.model.ProfileBuilder;

public class Merger {

	
	private static final File TARGET_FILE_URLS = new File("jan-urls.csv");
	private static List<String> urls = new ArrayList<>();
	private static Map<String, Long> month = new HashMap<>();
	static String filename1, filename2;
	static Profile localProfile1, localProfile2;
	static int start1, start2, finish1, finish2;
	
	public static void main(String[] args) throws InterruptedException, IOException {
		loadFileURLs();
		
		for (int i = 0; i < urls.size(); i=i+2)
		{
			URL url = new URL(urls.get(i));
			String path = url.getPath();
			filename1 = path.substring(path.lastIndexOf("/")+1, path.length());
			Thread downloader1 = new Thread(new Downloader(url, filename1));
			downloader1.start();
			
			url = new URL(urls.get(i+1));
			path = url.getPath();
			filename2 = path.substring(path.lastIndexOf("/")+1, path.length());
			Thread downloader2 = new Thread(new Downloader(url, filename2));
			downloader2.start();
			
			downloader1.join();
			downloader2.join();
			
			filename1 = filename1.replace(".bz2", "");
			filename2 = filename2.replace(".bz2", "");
			
			localProfile1 = ProfileBuilder.newBuilder()
					.name("profile1")
					.filePath(filename1)
					.onLocalhost()
					.build();
			
			localProfile2 = ProfileBuilder.newBuilder()
					.name("profile2")
					.filePath(filename2)
					.onLocalhost()
					.build();
			
			Thread grep1 = new Thread() {
				  public void run() {
					  String result_start = grep(constantExpression("^en.z"), on(localProfile1), lineNumber(), maxMatches(1)).toString();
					  System.out.println("grep '^en.z' -nm1 " + filename1 + ": " + result_start);
					  start1 = Integer.valueOf(result_start.substring(0, result_start.indexOf(':')));
				  }
				 };
			 grep1.start();
			
			Thread grep2 = new Thread() {
				  public void run() {
						String result_end = grep(constantExpression("^eo.b"), on(localProfile1), lineNumber(), maxMatches(1)).toString();
						System.out.println("grep '^eo.b' -nm1 " + filename1 + ": " + result_end);
						finish1 = (Integer.valueOf(result_end.substring(0, result_end.indexOf(':')))-1);
				  }
				 };
			grep2.start();
	
			grep1.join();
			
			Thread grep3 = new Thread() {
				  public void run() {
					  String result_start = grep(constantExpression("^en.z"), on(localProfile2), lineNumber(), maxMatches(1)).toString();
					  System.out.println("grep '^en.z' -nm1 " + filename2 + ": " + result_start);
					  start2 = Integer.valueOf(result_start.substring(0, result_start.indexOf(':')));
				  }
				 };
			 grep3.start();
			
			Thread grep4 = new Thread() {
				  public void run() {
						String result_end = grep(constantExpression("^eo.b"), on(localProfile2), lineNumber(), maxMatches(1)).toString();
						System.out.println("grep '^eo.b' -nm1 " + filename2 + ": " + result_end);
						finish2 = (Integer.valueOf(result_end.substring(0, result_end.indexOf(':')))-1);
				  }
				 };
			grep4.start();
	
			grep1.join();
			
			List<String> lines =  FileUtils.readLines(new File(filename1));
			
			for (int k = start1; k<=finish1;k++)
			{
				List<String> line = Arrays.asList(lines.get(k).split(" "));
				month.put(line.get(1),Long.parseLong(line.get(2)));
			}
			
			grep2.join();
			
			lines =  FileUtils.readLines(new File(filename2));
			
			for (int k = start2; k<=finish2;k++)
			{
				List<String> line = Arrays.asList(lines.get(k).split(" "));
				month.put(line.get(1),Long.parseLong(line.get(2)));
			}
			
		}
		
		saveResult();

	}

	private static void loadFileURLs() {
	    try {
	    	urls = FileUtils.readLines(TARGET_FILE_URLS);
	    	
	    	System.out.println("loadFileURLs() : " + urls.size() + " lines loaded");

	    }catch (IOException e) {
	    	e.printStackTrace();
	    }
	}
	
	private static void saveResult() {
		try {
			PrintWriter writer = new PrintWriter(new FileOutputStream(new File("output.csv")));
			writer.println("name, requests");						
			
			for (Map.Entry<String, Long> entry : month.entrySet()) {
			   	writer.println(entry.getKey() + ", " + entry.getValue());
			}
			writer.close();
			
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		
		
	}
	
}
