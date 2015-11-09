package uk.ac.york.mhe504.dblm.evaluation;

import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
/**
 * This class compares the elements in a SQL file
 * with the elements in a KDM file to verify that the 
 * extracted model is complete.
 * 
 * @author mhe504@york.ac.uk
 *
 */
public class Completeness {
	
	private static List<String> tableNames = new ArrayList<String>();
	private static List<String> colNames = new ArrayList<String>();
	private static List<String> pkNames = new ArrayList<String>();
	private static List<String> keyNames = new ArrayList<String>();
	private static List<String> tableCommentValues = new ArrayList<String>();
	private static List<String> colCommentValues = new ArrayList<String>();
	private static List<String> seqNames = new ArrayList<String>();
	private static List<String> references = new ArrayList<String>();
	
	public static void main (String[] args) throws IOException
	{
		List<String> file = Files.readAllLines(Paths.get("sample-inputs/schema.sql"), Charset.defaultCharset());

		extractSqlElementNames(file);
		
		System.out.println(tableNames.size() + " tables");
		System.out.println(colNames.size() + " columns");
		System.out.println(pkNames.size() + " primary keys");
		System.out.println(keyNames.size() + " keys");
		System.out.println(tableCommentValues.size() + " table comments");
		System.out.println(colCommentValues.size() + " col comments");
		System.out.println(seqNames.size() + " sequences");
		System.out.println(references.size() + " references");
		
	}

	
	private static void extractSqlElementNames(List<String> schemaFile)
	{
		for (int i =0; i < schemaFile.size(); i++)
		{
			String line = schemaFile.get(i);
			if (line.contains("CREATE TABLE `"))
			{
				String[] parts = line.split("`");
				tableNames.add(parts[1]);
			}
			else if (line.contains("  CREATE TABLE \""))
			{
				String[] parts = line.split("\"");
				tableNames.add(parts[1]);
			}
			else if (line.contains("CREATE TABLE "))
			{
				String[] parts = line.split(" ");
				tableNames.add(parts[1]);
			}
			else if (line.contains("  PRIMARY KEY (`"))
			{
				String[] parts = line.split("`");
				pkNames.add(parts[1]);
			}
			else if (line.contains(" PRIMARY KEY (\""))
			{
				String[] parts = line.split("\"");
				pkNames.add(parts[3]);
			}
			else if (line.contains("  PRIMARY KEY ("))
			{
				String[] parts = line.split(" ");
				pkNames.add(parts[5]);
			}
			else if (line.contains(" KEY `"))
			{
				String[] parts = line.split("`");
				keyNames.add(parts[1]);
			}
			else if (line.contains(" INDEX \""))
			{
				String[] parts = line.split("\"");
				keyNames.add(parts[1]);	
			}
			else if (line.matches("^COMMENT ON TABLE.*"))
			{
				String[] parts = line.split(" IS '");
				tableCommentValues.add(parts[1].replace("';", ""));
			}
			else if (line.matches("^COMMENT ON COLUMN.*"))
			{
				String[] parts = line.split(" IS '");
				colCommentValues.add(parts[1].replace("';", ""));
			}
			else if (line.matches("^CREATE SEQUENCE.*"))
			{
				String[] parts = line.split(" ");
				seqNames.add(parts[2]);
			}
			else if (line.contains("CREATE SEQUENCE  \""))
			{
				String[] parts = line.split("\"");
				seqNames.add(parts[1]);
			}
			else if (line.contains("ALTER TABLE") && schemaFile.get(i+1).contains("FOREIGN KEY"))
			{
				String[] parts = line.split(" ");
				String fromTable = parts[2];
				String fromCol = schemaFile.get(i+1).split("\\(")[1];
				fromCol.replace(")", "");
				
				String toTable =schemaFile.get(i+2).split("REFERENCES ")[1];
				toTable = toTable.split(" ")[0];
				String toCol=schemaFile.get(i+2).split(" \\(")[1];
				toCol = toCol.split("\\)")[0];
				
				references.add(fromTable + "." + fromCol + ";" + toTable + "." + toCol);
			}
			else if (line.contains("\" FOREIGN KEY") && schemaFile.get(i+1).contains("REFERENCES \""))
			{
				String[] parts = line.split("\"");
				String fromTable = parts[1];
				String fromCol = parts[5];
				
				parts = schemaFile.get(i+1).split("\"");
				String toTable =parts[1];
				String toCol=parts[3];
				
				references.add(fromTable + "." + fromCol + ";" + toTable + "." + toCol);
			}
			else if (line.contains("FOREIGN KEY") && line.contains("REFERENCES"))
			{
				String[] parts = line.split("`");
				String fromTable = tableNames.get(tableNames.size()-1);
				String fromCol = parts[3];
				String toTable =parts[5];
				String toCol=parts[7];
				
				references.add(fromTable + "." + fromCol + ";" + toTable + "." + toCol);
			}
			else if (line.contains("  `"))
			{
		
				String[] parts = line.split("`");
				colNames.add(parts[0]);
			}
			else if (line.contains("	\""))
			{
				String[] parts = line.split("`");
				colNames.add(parts[0]);
			}
			else if (line.matches("\\s\\s.*") && !line.contains("REFERENCES") && !line.contains("CONSTRAINT") && !line.contains("\"")&& !line.contains(";"))
			{
				String[] parts = line.split("`");
				colNames.add(parts[0]);
			}
		}
	}
}
