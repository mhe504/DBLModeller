package uk.ac.york.mhe504.dblm.evaluation;

import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
/**
 * This class compares the elements in a SQL file with the elements in a 
 * KDM file to verify that the extracted model is complete.
 * 
 * @author mhe504@york.ac.uk
 *
 */
public class ModelChecker {
	
	//SQL
	private static List<String> tableNames = new ArrayList<String>();
	private static List<String> colNames = new ArrayList<String>();
	private static List<String> ukNames = new ArrayList<String>();
	private static List<String> keyNames = new ArrayList<String>();
	private static List<String> tableCommentValues = new ArrayList<String>();
	private static List<String> colCommentValues = new ArrayList<String>();
	private static List<String> seqNames = new ArrayList<String>();
	private static List<String> references = new ArrayList<String>();
	
	//KDM
	private static List<String> relationalTableNames = new ArrayList<String>();
	private static List<String> itemUnitNames = new ArrayList<String>();
	private static List<String> uniqueKeyNames = new ArrayList<String>();
	private static List<String> indexElementNames = new ArrayList<String>();
	private static List<String> seqContentNames = new ArrayList<String>();
	private static List<String> annotationValues = new ArrayList<String>();
	private static List<String> keyRelationships = new ArrayList<String>();
	
	//CSV
	private static List<String> tupleNames = new ArrayList<String>();
	private static List<Double> tupleValues = new ArrayList<Double>();
	
	//SMM
	private static List<String> observationNames = new ArrayList<String>();
	private static List<Double> directMeasurementValues = new ArrayList<Double>();
	
	public static void main (String[] args) throws IOException
	{
		List<String> input = Files.readAllLines(Paths.get("sample-inputs/schema.sql"), Charset.defaultCharset());
		List<String> model = Files.readAllLines(Paths.get("StructureModel.xmi"), Charset.defaultCharset());

		extractSqlElementNames(input);
		extractKdmElementNames(model);
		
		outputResults();
		
		input = Files.readAllLines(Paths.get("sample-inputs/loadmeasurements.csv"), Charset.defaultCharset());
		model = Files.readAllLines(Paths.get("WorkloadModel.xmi"), Charset.defaultCharset());
		
		extractCsvElements(input);
		extractSmmElements(model);
		
		outputSmmResults();

	}
	
	private static void extractCsvElements(List<String> input) {

		for (int i =1; i < input.size(); i++)
		{
			String line = input.get(i);
			tupleNames.add(line.split(",")[0]);
			tupleValues.add(Double.parseDouble(line.split(",")[3]));
			tupleValues.add(Double.parseDouble(line.split(",")[4]));
			tupleValues.add(Double.parseDouble(line.split(",")[5]));
			tupleValues.add(Double.parseDouble(line.split(",")[6]));
			tupleValues.add(Double.parseDouble(line.split(",")[7]));
		}
		
	}
	
	private static void extractSmmElements(List<String> model) {
		for (String s : model)
		{
			if (s.contains("<observations name"))
			{
				observationNames.add(s.split("=")[1].replace("\"", "").replace(">", ""));
			}
			else if (s.contains("smm:DirectMeasurement"))
			{
				directMeasurementValues.add(Double.parseDouble(s.split("\"")[5]));
			}
		}
		
	}
	
	private static void outputSmmResults() {
		System.out.println("================== ELEMENT COUNTS =================");
		System.out.println("Measurement Set:\tSMM:");
		System.out.println("Tuples:\t\t" + tupleNames.size() + "\tOberservations:\t" + observationNames.size());
		System.out.println("Values:\t\t" + tupleValues.size() + "\tDirectMeasurements:\t" + directMeasurementValues.size());
		System.out.println("==================================================");
		System.out.println();
		System.out.println("===================== TUPLES =====================");
		System.out.format("%-30s%-30s\n", "CSV Tuple Names:", "SMM Observation Names:");
		makeListSizeEqual(tupleNames, observationNames);
		for (int i = 0; i < tupleNames.size(); i++)
			System.out.format("%-30s%-30s\n", tupleNames.get(i), observationNames.get(i));
		System.out.println("==================================================");
		System.out.println("Tuple Names Match? " + areIdentical(tupleNames,observationNames));
		System.out.println("==================================================");
		System.out.println();
		System.out.println("===================== VALUES =====================");
		System.out.format("%-30s%-30s\n", "CSV Values:", "SMM DirectMeasurement values:");
		makeListSizeEqual(tupleValues, directMeasurementValues);
		for (int i = 0; i < tupleValues.size(); i++)
			System.out.format("%-30s%-30s\n", tupleValues.get(i), directMeasurementValues.get(i));
		System.out.println("==================================================");
		System.out.println("Values Match? " + areIdentical(tupleValues,directMeasurementValues));
		System.out.println("==================================================");
	}



	private static void outputResults(){
		System.out.println("================== ELEMENT COUNTS =================");
		System.out.println("SQL:\t\t\tKDM:");
		System.out.println("Tables:\t\t" + tableNames.size() + "\tRelationalTables:\t" + relationalTableNames.size());
		System.out.println("Columns:\t" + colNames.size() + "\tItemUnits:\t\t"+ itemUnitNames.size());
		System.out.println("UKs:\t\t" + ukNames.size() + "\tUniqueKeys:\t\t" + uniqueKeyNames.size());
		System.out.println("Indexes:\t" + keyNames.size() + "\tIndexElements:\t\t"+indexElementNames.size());
		System.out.println("Relationships:\t" + references.size()+"\tKeyRelationships:\t" + keyRelationships.size());
		System.out.println("Sequences:\t" + seqNames.size() + "\tSeqContents:\t\t" + seqContentNames.size());
		System.out.println("Table Comments:\t" + tableCommentValues.size() + "\tAnnotations:\t\t" +annotationValues.size());
		System.out.println("Col Comments:\t" + colCommentValues.size());
		System.out.println("==================================================");
		System.out.println();
		System.out.println("========================== TABLES ==========================");
		System.out.format("%-30s%-30s\n", "SQL CREATE TABLE:", "KDM RelationalTable Elements:");
		makeListSizeEqual(relationalTableNames, tableNames);
		for (int i = 0; i < relationalTableNames.size(); i++)
			System.out.format("%-30s%-30s\n", tableNames.get(i), relationalTableNames.get(i));
		System.out.println("============================================================");
		System.out.println("Tables Match? " + areIdentical(tableNames,relationalTableNames));
		System.out.println("============================================================");
		System.out.println();
		System.out.println("========================== COLUMNS ==========================");
		System.out.format("%-30s%-30s\n", "SQL COLUMNS:", "KDM ItemUnit Elements:");
		makeListSizeEqual(colNames, itemUnitNames);
		for (int i = 0; i < colNames.size(); i++)
			System.out.format("%-30s%-30s\n", colNames.get(i), itemUnitNames.get(i));
		System.out.println("===========================================================");
		System.out.println("Columns Match? " + areIdentical(colNames,itemUnitNames));
		System.out.println("============================================================");
		System.out.println();
		System.out.println("========================== UKs ==========================");
		System.out.format("%-30s%-30s\n", "SQL Unique + Primary Keys:", "KDM UniqueKeys Elements:");
		makeListSizeEqual(ukNames, uniqueKeyNames);
		for (int i = 0; i < ukNames.size(); i++)
			System.out.format("%-30s%-30s\n", ukNames.get(i), uniqueKeyNames.get(i));
		System.out.println("==========================================================");
		System.out.println("PKs Match? " + areIdentical(ukNames,uniqueKeyNames));
		System.out.println("==========================================================");
		System.out.println();
		System.out.println("========================== Indexes ==========================");
		System.out.format("%-30s%-30s\n", "SQL Indexes:", "KDM IndexElement:");
		makeListSizeEqual(keyNames, indexElementNames);
		for (int i = 0; i < indexElementNames.size(); i++)
			System.out.format("%-30s%-30s\n", keyNames.get(i), indexElementNames.get(i));
		System.out.println("=============================================================");
		System.out.println("Indexes Match? " + areIdentical(keyNames,indexElementNames));
		System.out.println("=============================================================");
		System.out.println();
		System.out.println("========================== Sequences ==========================");
		System.out.format("%-30s%-30s\n", "SQL CREATE SEQUENCE:", "KDM SeqContent Elements:");
		makeListSizeEqual(seqNames, seqContentNames);
		for (int i = 0; i < seqContentNames.size(); i++)
			System.out.format("%-30s%-30s\n", seqNames.get(i), seqContentNames.get(i));
		System.out.println("===============================================================");
		System.out.println("Sequences Match? " + areIdentical(seqNames,seqContentNames));
		System.out.println("===============================================================");
		System.out.println();
		System.out.println("======================================== Relationships =====================================");
		System.out.format("%-50s%-50s\n", "SQL Relationships:", "KDM KeyRelationship Elements:");
		makeListSizeEqual(keyRelationships, references);
		for (int i = 0; i < references.size(); i++)
			System.out.format("%-70s%-70s\n", references.get(i), keyRelationships.get(i));
		System.out.println("============================================================================================");
		System.out.println("Relationships Match? " + areIdentical(keyRelationships,references));
		System.out.println("============================================================================================");
		System.out.println("========================== Comments =============================");
		System.out.println("SQL Table and Column Comments:");
		List<String> allComments = tableCommentValues;
		allComments.addAll(colCommentValues);
		for (int i = 0; i < allComments.size(); i++)
			System.out.println(allComments.get(i));
		System.out.println();
		System.out.println("KDM Annotation Elements:");
		for (int i = 0; i < annotationValues.size(); i++)
			System.out.println(annotationValues.get(i));
		System.out.println("=================================================================");
		System.out.println("Comments Match? " + areIdentical(annotationValues,allComments));
		System.out.println("=================================================================");
	}

	
	private static void makeListSizeEqual(List<?> list1, List<?> list2)
	{
		int max = Math.max(list1.size(), list2.size());
		
		while (list1.size() != max)
			list1.add(null);
		
		while (list2.size() != max)
			list2.add(null);
	}
	
	private static boolean areIdentical(List<?> list1, List<?> list2)
	{
		Set<Object> set1 = new HashSet<Object>();
		set1.addAll(list1);
		Set<Object> set2 = new HashSet<Object>();
		set2.addAll(list2);
		
		return set1.equals(set2);
		
	}
	
	
	private static void extractKdmElementNames(List<String> modelFile)
	{
		for (int i =0; i < modelFile.size(); i++)
		{
			String line = modelFile.get(i);
			if (line.contains("<dataElement xsi:type=\"data:RelationalTable\""))
			{
				relationalTableNames.add(line.split("\"")[3]);
			}
			else if (line.contains("<itemUnit ") && !line.contains("name=\"Value\""))
			{
				itemUnitNames.add(line.split("\"")[1]);
			}
			else if (line.contains("<dataElement xsi:type=\"data:UniqueKey\""))
			{
				uniqueKeyNames.add(resolvePK(line.split("\"")[5],modelFile));
			}
			else if (line.contains("<dataElement xsi:type=\"data:IndexElement\""))
			{
				indexElementNames.add(line.split("\"")[3].trim());
			}
			else if (line.contains("<dataElement xsi:type=\"data:KeyRelation\""))
			{
				String from =  line.split("\"")[5];
				String to = line.split("\"")[3];
				keyRelationships.add(resolveReference(from,modelFile) + ";" + resolveReference(to,modelFile));
			}
			else if (line.contains("<dataElement xsi:type=\"data:SeqContent\""))
			{
				seqContentNames.add(line.split("\"")[3]);
			}
			else if (line.contains("<annotation "))
			{
				annotationValues.add(line.split("\"")[1]);
			}
			
		}
	}
	
	
	private static String resolveReference(String from, List<String> modelFile) {
		
		from = from.substring(3);
		String[] parts = from.split("/@");
		int currentTable = -1;
		int currentCol = -1;
		String tableName = "";
		String colName = "";
		for (int i = 0; i < modelFile.size();i++ )
		{
			String line = modelFile.get(i);
			while (Integer.parseInt(parts[2].split("\\.")[1]) != currentTable)
			{
				if (line.contains("<dataElement xsi:type=\"data:RelationalTable\""))
				{
					tableName = line.split("\"")[3];
					currentTable++;
				}
				i++;
				line = modelFile.get(i);
			}
			if (Integer.parseInt(parts[2].split("\\.")[1]) == currentTable)
			{
				while (Integer.parseInt(parts[3].split("\\.")[1]) != currentCol)
				{
					if (line.contains("<" + parts[3].split("\\.")[0]))
					{
						colName = resolvePK(line.split("\"")[5].trim(),modelFile);
						currentCol++;
					}
					i++;
					line = modelFile.get(i);
					
				}
			}
			if (!colName.equals("") && !tableName.equals(""))
			{
				return tableName + "." + colName;
			}

		}
		return tableName + "." + colName;
	}
	
	private static String resolvePK(String from, List<String> modelFile) {
		
		from = from.split(" ")[0];
		from = from.substring(3);
		String[] parts = from.split("/@");
		int currentTable = -1;
		int currentCol = -1;
		String tableName = "";
		String colName = "";
		for (int i = 0; i < modelFile.size();i++ )
		{
			String line = modelFile.get(i);
			while (Integer.parseInt(parts[2].split("\\.")[1]) != currentTable)
			{
				if (line.contains("<dataElement xsi:type=\"data:RelationalTable\""))
				{
					tableName = line.split("\"")[3];
					currentTable++;
				}
				i++;
				line = modelFile.get(i);
			}
			if (Integer.parseInt(parts[2].split("\\.")[1]) == currentTable)
			{
				while (Integer.parseInt(parts[3].split("\\.")[1]) != currentCol)
				{
					if (line.contains("<" + parts[3].split("\\.")[0]))
					{
						colName = line.split("\"")[1];
						currentCol++;
					}
					i++;
					line = modelFile.get(i);
					
				}
			}
			if (!colName.equals("") && !tableName.equals(""))
			{
				return colName;
			}

		}
		return colName;
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
				tableNames.add(parts[2]);
			}
			else if (line.contains("  PRIMARY KEY (`"))
			{
				String[] parts = line.split("`");
				ukNames.add(parts[1]);
			}
			else if (line.contains("ADD PRIMARY KEY (\""))
			{
				String[] parts = line.split("\"");
				ukNames.add(parts[3]);
			}
			else if (line.contains(" PRIMARY KEY (\""))
			{
				String[] parts = line.split("\"");
				ukNames.add(parts[5]);
			}
			else if (line.contains("  PRIMARY KEY ("))
			{
				String[] parts = line.split(" ");
				ukNames.add(parts[5].replace(",", ""));
			}
			else if (line.contains("UNIQUE KEY `"))
			{
				String[] parts = line.split("`");
				ukNames.add(parts[3].trim());
			}
			else if (line.contains(" KEY `"))
			{
				String[] parts = line.split("`");
				ukNames.add(parts[3]);
			}
			else if (line.contains("CREATE UNIQUE INDEX \""))
			{
				String[] parts = line.split("\"");
				ukNames.add(parts[5]);	
			}
			else if (line.contains(" INDEX \""))
			{
				String[] parts = line.split("\"");
				keyNames.add(parts[1]);	
			}
			else if (line.contains(" ADD  CONSTRAINT ") && schemaFile.get(i+1).contains("UNIQUE"))
			{
				String[] parts = schemaFile.get(i+1).split(" ");
				ukNames.add(parts[2].replace("(", "").replace(")",""));	
			}
			else if (line.matches("^COMMENT ON TABLE.*"))
			{
				String[] parts = line.split(" IS '");
				tableCommentValues.add(parts[1].replace("';", "").replace("'", ""));
			}
			else if (line.matches("^COMMENT ON COLUMN.*"))
			{
				String[] parts = line.split(" IS '");
				colCommentValues.add(parts[1].replace("';", "").replace("'", ""));
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
			else if (line.contains("ALTER TABLE") && i+1 !=schemaFile.size() && schemaFile.get(i+1).contains("FOREIGN KEY"))
			{
				String[] parts = line.split(" ");
				String fromTable = parts[2];
				String fromCol = schemaFile.get(i+1).split("\\(")[1];
				fromCol = fromCol.replace(")", "");
				
				String toTable =schemaFile.get(i+2).split("REFERENCES ")[1];
				toTable = toTable.split(" ")[0];
				String toCol=schemaFile.get(i+2).split(" \\(")[1];
				toCol = toCol.split("\\)")[0];
				
				references.add(fromTable.trim() + "." + fromCol.trim() + ";" + toTable.trim() + "." + toCol.trim());
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
				String[] parts = line.split("REFERENCES");
				String[] toparts = parts[1].split("`");
				String[] fromparts = parts[0].split("`");
				
				String fromTable = tableNames.get(tableNames.size()-1);
				String fromCol = fromparts[3];
				String toTable =toparts[1];
				String toCol=toparts[3];
				
				references.add(toTable + "." + toCol + ";" + fromTable + "." + fromCol);
			}
			else if (line.contains("  `"))
			{
		
				String[] parts = line.split("`");
				colNames.add(parts[1]);
			}
			else if (line.contains("	\"") || line.contains("    \""))
			{
				String[] parts = line.split("\"");
				colNames.add(parts[1]);
			}
			else if (line.matches("\\s\\s\\w*.*") && !line.equals("  ") && !line.contains("REFERENCES") && !line.contains("CONSTRAINT") && !line.contains("\"")&& !line.contains(";"))
			{
				String[] parts = line.split(" ");
				colNames.add(parts[2]);
			}
		}
	}
}
