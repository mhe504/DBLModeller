package uk.ac.york.mhe504.dblm.evaluation;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

/**
 * This class extracts execution times from the output of console output of
 * DBLM/Gra2Mol when both are executed via ant using the following optition:
 * -logger org.apache.tools.ant.listener.ProfileLogger.
 * 
 * @author mhe504@york.ac.uk
 * 
 */
public class ProcessResults {
	
	public static void main (String[] args) throws IOException
	{
		List<String> f = Files.readAllLines(Paths.get("results/dbl-wiki-mysql.txt"), Charset.defaultCharset());
		List<Integer> newTotals = getTotalDuration(f);
		
		f = Files.readAllLines(Paths.get("results/g2m-mysql-wiki.txt"), Charset.defaultCharset());
		List<Integer> oldTotals = getTotalDuration(f);
		
		System.out.println("DBLM");
		for (int j = 0; j < newTotals.size(); j++)
			System.out.println(newTotals.get(j));
		
		System.out.println("G2M");
		for (int j = 0; j < oldTotals.size(); j++)
			System.out.println(oldTotals.get(j));
		
	}

	private static List<Integer> getTotalDuration(List<String> f) {
		
		List<Integer> result = new ArrayList<Integer>();
		
		int i =0;
		while (i <= f.size()-3)
		{
			String line = f.get(i);
			Integer duration = 0;
			
			while (! line.contains("BUILD SUCCESSFUL"))
			{
				if (line.contains("ms)"))
				{
					String ms = line.substring(line.indexOf('(')+1, line.indexOf("ms)"));
					duration = duration + Integer.parseInt(ms);
				}
				i++;
				line = f.get(i);
				
			}
			
			i++;
			result.add(duration);

		}
		
		return result;
	}

}
