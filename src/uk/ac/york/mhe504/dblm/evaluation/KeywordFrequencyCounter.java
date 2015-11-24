package uk.ac.york.mhe504.dblm.evaluation;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * This class takes a folder containing Oracle or MySQL DDL dumps, and a text file
 * containing keywords, then outputs a CSV file listing the key words and the number
 * of times they found. 
 * 
 * @author mhe504@york.ac.uk
 * 
 */
public class KeywordFrequencyCounter {
	
	public static void main(String[] args) throws IOException {
		
		countKeywordOccurences("/home/matyn/git/KDMModelExtraction/data/oracle-keywords.txt", 
							   "/home/matyn/git/KDMModelExtraction/data/sql/oracle",
							   "/home/matyn/oracle-count.csv");
	}
	
	public static void countKeywordOccurences(String keywordListFile, String dumpsFolder, String outputFile) throws IOException
	{
		List<String> filePaths = new ArrayList<>();
		
		Files.walk(Paths.get(dumpsFolder)).forEach(filePath -> {
		    if (Files.isRegularFile(filePath)) {
		    	filePaths.add(filePath.toString());
		    }
		});
		
		List<String> dumpKeywords = new ArrayList<>();
		for (String file : filePaths)
			dumpKeywords.addAll(extractKeywordList(loadFile(file)));
		
		countAndSaveFrequencies(outputFile, loadFile(keywordListFile), dumpKeywords);
	}

	private static void countAndSaveFrequencies(String outputFileName, List<String> languageKeywords,
			List<String> dumpKeywords) throws FileNotFoundException, UnsupportedEncodingException {
		PrintWriter writer = new PrintWriter(outputFileName, Charset.defaultCharset().toString());
		for (String keyword : languageKeywords)
		{
			int count = 0;
			for (String target : dumpKeywords)
			{
				if (target.toLowerCase().equals(keyword.toLowerCase()))
					count++;
			}
			writer.println(keyword + ", " + count);
		}
		
		writer.close();
	}

	private static List<String> loadFile(String filename) {
		List<String> sqlFile = new ArrayList<String>();
		try {
			sqlFile = Files.readAllLines(Paths.get(filename), Charset.defaultCharset());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return sqlFile;
	}

	private static List<String> extractKeywordList(List<String> input) {
		
		//Remove comments
		List<String> inputWithoutComments = new ArrayList<String>();
		for (String s : input)
		{
			if (!s.startsWith("--") && !s.startsWith("/*"))
			{
				inputWithoutComments.add(s);
			}
		}
		
		//Remove IDs and numeric parameters
		String regex1 = "`.*?`|\\([0-9]*\\)|\\([0-9]*,[0-9]*\\)|'.*?'";
		List<String> inputWithoutIDs = new ArrayList<String>();
		for (String s : inputWithoutComments) {
			Pattern p = Pattern.compile(regex1, Pattern.CASE_INSENSITIVE);
			Matcher m = p.matcher(s);

			 if(!s.equals(""))
			 {
				 while (m.find()) {
					 s  = s.replace(m.group(),"");
				 }
				 inputWithoutIDs.add(s.trim());				 
			 }
		}
		
		//extract keywords from within parameters
		String q1regex = "\\(.[0-9]* [a-z][A-Z]*\\)";
		List<String> inputWithoutParams = new ArrayList<String>();
		for (String s : inputWithoutIDs) {
			Pattern p = Pattern.compile(q1regex, Pattern.CASE_INSENSITIVE);
			Matcher m = p.matcher(s);

			 if(!s.equals(""))
			 {
				 while (m.find()) {
					 String match = m.group();
					 match = match.replace("(", "").replace(")","");
					 s = match.split(" ")[1];
				 }
				 inputWithoutParams.add(s.trim());				 
			 }
		}
		
		//split into words
		String q2regex = "(?<![\\S`])([^`\\s]+)(?![\\S`])";
		List<String> words = new ArrayList<String>();
		
		for (String s : inputWithoutParams) {
			Pattern p = Pattern.compile(q2regex, Pattern.CASE_INSENSITIVE);
			Matcher m = p.matcher(s);
			

			 while (m.find()) {
				 words.add(m.group());
			 }
		}
		
		//Remove brackets, commas, semi-colons, and equals.
		List<String> result = new ArrayList<String>();
		for (String s : words) {
			s = s.replace("(", "").replace(")", "").replace(",","").replace(";", "");
			if (!s.equals("")){
				if (s.contains("="))
				{
					for (String part : s.split("="))
					{
						result.add(part);
					}
				}
				else{
					result.add(s);				
				}
			}

		}
		return result;
	}
}